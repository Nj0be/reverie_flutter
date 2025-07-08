import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reverieflutter/data/model/diary.dart';
import 'package:reverieflutter/data/repository/diary_repository.dart';
import 'package:reverieflutter/l10n/app_localizations.dart';
import 'package:reverieflutter/storage_service.dart';
import 'package:riverpod/riverpod.dart';
import 'package:reverieflutter/data/model/diary_cover.dart';
import 'package:reverieflutter/l10n/localizations_provider.dart';

part 'edit_diary_notifier.freezed.dart';

@freezed
abstract class EditDiaryState with _$EditDiaryState {
  @override
  final Diary diary;

  EditDiaryState._({Diary? diary})
      : diary = diary ?? Diary();

  factory EditDiaryState({
    Diary? diary,
    @Default([]) List<DiaryCover> allCoversList,
    @Default('') String titleError,
    @Default('') String descriptionError,
  }) = _EditDiaryState;
}

final editDiaryNotifierProvider = StateNotifierProvider.family<
  EditDiaryNotifier,
  AsyncValue<EditDiaryState>,
  String
  >((ref, diaryId) {
    final repository = ref.read(diaryRepositoryProvider);
    final auth = ref.read(firebaseAuthInstanceProvider);
    final localizations = ref.read(appLocalizationsProvider);

    return EditDiaryNotifier(repository: repository, auth: auth, localizations: localizations, diaryId: diaryId);
});

class EditDiaryNotifier extends StateNotifier<AsyncValue<EditDiaryState>> {
  final DiaryRepository repository;
  final FirebaseAuth auth;
  final AppLocalizations localizations;
  final String diaryId;

  EditDiaryNotifier({
    required this.repository,
    required this.auth,
    required this.localizations,
    required this.diaryId,
  }) : super(const AsyncLoading()) {
    _loadDiary(diaryId);
  }

  Future<void> _loadDiary(String diaryId) async {
    state = const AsyncLoading();
    Diary diary;

    try {
      diary = await repository.getDiary(diaryId);

    } catch (e) {
      final userId = auth.currentUser?.uid;
      diary = Diary(
        uid: userId ?? '',
        title: 'New Diary',
        description: '',
        coverId: 'MVl66divWlJIIGvaBFbw',
      );
    }

    final allCoversList = await repository.getAllDiaryCovers();
    try {
      state = AsyncValue.data(
          EditDiaryState(
              diary: diary,
            allCoversList: allCoversList,
          )
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  String validateTitle(String title) {
    return title.trim().isEmpty ? localizations.titleMandatory : '';
  }

  String validateDescription(String description) {
    return description.trim().isEmpty ? localizations.descriptionMandatory : '';
  }

  void onTitleChange(String newTitle) {
    final error = validateTitle(newTitle);

    state = state.whenData((s) {
      final updated = s.diary.copyWith(title: newTitle);
      return s.copyWith(diary: updated, titleError: error);
    });
  }

  void onDescriptionChange(String newDescription) {
    final error = validateDescription(newDescription);

    state = state.whenData((s) {
      final updated = s.diary.copyWith(description: newDescription);
      return s.copyWith(diary: updated, descriptionError: error);
    });
  }

  void updateCover(String newCoverId) {
    state = state.whenData((s) {
      final updated = s.diary.copyWith(coverId: newCoverId);
      return s.copyWith(diary: updated);
    });
  }

  Future<void> onSaveDiary(void Function(Diary) onComplete) async {
    final currentState = state.value;
    if (currentState == null) return;

    // Validate all fields
    final titleError = validateTitle(currentState.diary.title);
    final descriptionError = validateDescription(currentState.diary.description);

    // Update errors in state
    state = AsyncValue.data(currentState.copyWith(
      titleError: titleError,
      descriptionError: descriptionError,
    ));

    final hasErrors = [titleError, descriptionError].any((e) =>
    e.isNotEmpty);
    if (hasErrors) {
      // Don't proceed if validation fails
      return;
    }

    // Build updated diary
    var updatedDiary = currentState.diary.copyWith(
      title: currentState.diary.title,
      description: currentState.diary.description,
      coverId: currentState.diary.coverId,
    );

    try {
      if (updatedDiary.id != '') {
        await repository.updateDiary(updatedDiary);
      } else {
        updatedDiary = await repository.saveDiary(updatedDiary);
      }
      // Update state with new user & clear errors
      state = AsyncValue.data(currentState.copyWith(
        diary: updatedDiary,
        titleError: '',
        descriptionError: '',
      ));

      onComplete(updatedDiary);
    } catch (e, st) {
      // If save fails, keep current inputs but surface error in some way
      state = AsyncValue.error(e, st);
    }
  }
}
