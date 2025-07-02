import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reverie_flutter/data/model/diary.dart';
import 'package:reverie_flutter/data/repository/diary_repository.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/storage_service.dart';
import '../data/repository/user_repository.dart';
import '../data/model/user.dart';
import 'package:riverpod/riverpod.dart';
import 'package:reverie_flutter/data/model/diary_cover.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/l10n/localizations_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'all_diaries_notifier.freezed.dart';

@freezed
abstract class AllDiariesState with _$AllDiariesState {
  const factory AllDiariesState({
    @Default([]) List<Diary> diaries,
    @Default({}) Map<String, DiaryCover> diaryCoversMap,
    @Default(false) bool deleteDialogState,
  }) = _AllDiariesState;
}

final allDiariesNotifierProvider = StateNotifierProvider<
    AllDiariesNotifier,
    AsyncValue<AllDiariesState>
  >((ref) {
  final repository = ref.read(diaryRepositoryProvider);
  final auth = ref.read(firebaseAuthInstanceProvider);
  final localizations = ref.read(appLocalizationsProvider);

  return AllDiariesNotifier(repository: repository, auth: auth, localizations: localizations, ref: ref);
});

final currentDiaryPageIndexProvider = StateProvider<int>((ref) => 0);

final pageControllerProvider = Provider.autoDispose<PageController>((ref) {
  final initialPage = ref.read(currentDiaryPageIndexProvider);
  final controller = PageController(initialPage: initialPage);
  ref.listen<int>(
    currentDiaryPageIndexProvider,
        (previous, next) {
      if (previous != null && previous != next && controller.hasClients) {
        controller.animateToPage(
          next,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    },
  );

  // Quando il provider viene smontato, eliminiamo il controller
  ref.onDispose(() => controller.dispose());

  return controller;
});

class AllDiariesNotifier
    extends StateNotifier<AsyncValue<AllDiariesState>> {
  final DiaryRepository _repository;
  final FirebaseAuth _auth;
  final AppLocalizations _localizations;
  final Ref _ref;

  AllDiariesNotifier({
    required DiaryRepository repository,
    required FirebaseAuth auth,
    required AppLocalizations localizations,
    required Ref ref,
  })
      : _auth = auth,
        _repository = repository,
        _localizations = localizations,
        _ref = ref,
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

    try {
      await _repository.deleteDiary(diaryId);
      final updatedDiaries = List<Diary>.from(currentState.diaries)..removeWhere((d) => d.id == diaryId);

      final currentIndex = _ref.read(currentDiaryPageIndexProvider);
      final newIndex = (currentIndex > 0) ? currentIndex - 1 : 0;
      _ref.read(currentDiaryPageIndexProvider.notifier).state = newIndex;

      // Aggiorna stato con diario eliminato e chiudi dialog
      state = AsyncValue.data(
        currentState.copyWith(
          diaries: updatedDiaries,
          deleteDialogState: false,
          // eventualmente aggiorna anche diaryCoversMap se serve
        ),
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

    // Aggiorna lo stato con la nuova lista e la mappa delle cover aggiornata
    state = AsyncValue.data(
      currentState.copyWith(
        diaries: currentDiaries,
        diaryCoversMap: diaryCoversMap,
      ),
    );
  }
}