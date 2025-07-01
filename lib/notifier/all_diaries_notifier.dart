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

part 'all_diaries_notifier.freezed.dart';

@freezed
abstract class AllDiariesState with _$AllDiariesState {
  const factory AllDiariesState({
    @Default([]) List<Diary> diaries,
    @Default({}) Map<String, DiaryCover> diaryCoversMap,
    // @Default("") String deleteDialogState,
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
}