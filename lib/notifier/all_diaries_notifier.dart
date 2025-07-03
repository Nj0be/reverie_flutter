import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reverie_flutter/data/model/diary.dart';
import 'package:reverie_flutter/data/repository/diary_repository.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/storage_service.dart';
import 'package:riverpod/riverpod.dart';
import 'package:reverie_flutter/data/model/diary_cover.dart';
import 'package:reverie_flutter/l10n/localizations_provider.dart';
import 'package:flutter/material.dart';
part 'all_diaries_notifier.freezed.dart';

@freezed
abstract class AllDiariesState with _$AllDiariesState {
  @override
  final PageController pageController;

  AllDiariesState._({PageController? pageController})
      : pageController = pageController ?? PageController(initialPage: 0);

  factory AllDiariesState({
    @Default([]) List<Diary> diaries,
    @Default({}) Map<String, DiaryCover> diaryCoversMap,
    @Default(false) bool deleteDialogState,
    @Default(0) int currentIndex,
    PageController? pageController,
  }) = _AllDiariesState;
}

final allDiariesNotifierProvider = StateNotifierProvider<
    AllDiariesNotifier,
    AsyncValue<AllDiariesState>
  >((ref) {
  final repository = ref.read(diaryRepositoryProvider);
  final auth = ref.read(firebaseAuthInstanceProvider);
  final localizations = ref.read(appLocalizationsProvider);

  return AllDiariesNotifier(repository: repository, auth: auth, localizations: localizations);
});

class AllDiariesNotifier
    extends StateNotifier<AsyncValue<AllDiariesState>> {
  final DiaryRepository _repository;
  final FirebaseAuth _auth;
  final AppLocalizations _localizations;

  AllDiariesNotifier({
    required DiaryRepository repository,
    required FirebaseAuth auth,
    required AppLocalizations localizations,
  })
      : _auth = auth,
        _repository = repository,
        _localizations = localizations,
        super(const AsyncLoading()) {
    _loadDiaries();
  }

  Future<void> _loadDiaries() async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) {
      state =
          AsyncValue.error(_localizations.userNotSignedIn, StackTrace.current);
      return;
    }

    try {
      final diaries = await _repository.getUserDiaries(userId);

      final Set<String> diaryCoversSet = diaries
          .map((diary) => diary.coverId)
          .toSet();
      final Map<String, DiaryCover> diaryCoversMap = {};
      await Future.wait(diaryCoversSet.map((diaryCoverId) async {
        diaryCoversMap[diaryCoverId] =
        await _repository.getDiaryCover(diaryCoverId);
      }));

      // Update UI state
      state = AsyncValue.data(
          AllDiariesState(
              diaries: diaries,
              diaryCoversMap: diaryCoversMap
          )
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void _updateDeleteDiaryDialog(bool newDeleteDialogState) {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncValue.data(
      currentState.copyWith(
        deleteDialogState: newDeleteDialogState,
      ),
    );
  }

  void openDeleteDialog() {
    _updateDeleteDiaryDialog(true);
  }

  void closeDeleteDialog() {
    _updateDeleteDiaryDialog(false);
  }

  Future<void> deleteDiary(String diaryId) async {
    final currentState = state.value;
    if (currentState == null) return;

    final diary = currentState.diaries.firstWhere((d) => d.id == diaryId);

    try {
      await _repository.deleteDiary(diary);
      final updatedDiaries = List<Diary>.from(currentState.diaries)..removeWhere((d) => d.id == diaryId);

      final newIndex = (currentState.currentIndex > 0) ? currentState.currentIndex - 1 : 0;

      // Aggiorna stato con diario eliminato e chiudi dialog
      state = AsyncValue.data(
        currentState.copyWith(
          diaries: updatedDiaries,
          deleteDialogState: false,
          currentIndex: newIndex
        ),
      );

      currentState.pageController.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> overwriteDiary(Diary? updatedDiary) async {
    final currentState = state.value;
    if (currentState == null) return;

    if (updatedDiary == null) return;

    final List<Diary> currentDiaries = List.from(currentState.diaries);
    final Map<String, DiaryCover> diaryCoversMap = Map.from(currentState.diaryCoversMap);

    final existingIndex = currentDiaries.indexWhere((d) => d.id == updatedDiary.id);
    if (existingIndex == -1) {
      // Diario nuovo: aggiungiamolo in fondo
      currentDiaries.add(updatedDiary);
    } else {
      // Diario esistente: sostituiamolo
      currentDiaries[existingIndex] = updatedDiary;
    }

    // Controlla se la cover del diario è già nella mappa
    final diaryCoverId = updatedDiary.coverId;
    if (!diaryCoversMap.containsKey(diaryCoverId)) {
      final cover = await _repository.getDiaryCover(diaryCoverId);
      diaryCoversMap[diaryCoverId] = cover;
    }

    final currentIndex = existingIndex == -1 ? currentDiaries.length - 1 : existingIndex;

    // Aggiorna lo stato con la nuova lista e la mappa delle cover aggiornata
    state = AsyncValue.data(
      currentState.copyWith(
        diaries: currentDiaries,
        diaryCoversMap: diaryCoversMap,
        currentIndex: currentIndex
      ),
    );
    currentState.pageController.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void onChangeIndex(int index) {
    state = state.whenData((s) {
      return s.copyWith(currentIndex: index);
    });
  }
}