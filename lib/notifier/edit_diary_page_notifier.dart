import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reverieflutter/data/model/diary_page.dart';
import 'package:reverieflutter/data/repository/diary_repository.dart';
import 'package:reverieflutter/l10n/app_localizations.dart';
import 'package:reverieflutter/storage_service.dart';
import 'package:riverpod/riverpod.dart';
import 'package:reverieflutter/l10n/localizations_provider.dart';

part 'edit_diary_page_notifier.freezed.dart';

@freezed
abstract class EditDiaryPageState with _$EditDiaryPageState {
  @override
  final DiaryPage page;

  EditDiaryPageState._({DiaryPage? page})
      : page = page ?? DiaryPage();

  factory EditDiaryPageState({
    DiaryPage? page,
  }) = _EditDiaryPageState;
}

final editDiaryPageNotifierProvider = StateNotifierProvider.family<
    EditDiaryPageNotifier,
    AsyncValue<EditDiaryPageState>,
    String
>((ref, pageId) {
  final repository = ref.read(diaryRepositoryProvider);
  final auth = ref.read(firebaseAuthInstanceProvider);
  final localizations = ref.read(appLocalizationsProvider);

  return EditDiaryPageNotifier(repository: repository, auth: auth, localizations: localizations, pageId: pageId);
});

class EditDiaryPageNotifier extends StateNotifier<AsyncValue<EditDiaryPageState>> {
  final DiaryRepository repository;
  final FirebaseAuth auth;
  final AppLocalizations localizations;
  final String pageId;

  EditDiaryPageNotifier({
    required this.repository,
    required this.auth,
    required this.localizations,
    required this.pageId,
  }) : super(const AsyncLoading()) {
    _loadDiary(pageId);
  }

  Future<void> _loadDiary(String pageId) async {
    state = AsyncData(
      EditDiaryPageState(
        page: await repository.getPage(pageId)
      )
    );
  }

  void onUpdateContent(String newContent) {
    state = state.whenData((s) {
      final updatedPage = s.page.copyWith(content: newContent);
      return s.copyWith(page: updatedPage);
    });
  }

  void onUpdatePage(void Function(DiaryPage) onComplete) async {
    final currentState = state.value;
    if (currentState == null) return;

    try {
      await repository.updatePage(currentState.page);

      onComplete(currentState.page);
    } catch (e, st) {
      // If save fails, keep current inputs but surface error in some way
      state = AsyncValue.error(e, st);
    }
  }
}
