import 'package:async/async.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reverieflutter/data/model/user.dart';
import 'dart:async';
import 'package:reverieflutter/data/repository/user_repository.dart';
import 'package:reverieflutter/l10n/app_localizations.dart';
import 'package:reverieflutter/l10n/localizations_provider.dart';
import 'package:riverpod/riverpod.dart';

part 'edit_profile_notifier.freezed.dart';

@freezed
abstract class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    @Default(User()) User profile,
    @Default('') String username,
    @Default('') String usernameError,
    @Default('') String nameError,
    @Default('') String surnameError,
    @Default('') String formError,
  }) = _EditProfileState;
}

final editProfileNotifierProvider = StateNotifierProvider.family<
    EditProfileNotifier,
    AsyncValue<EditProfileState>,
    String>((ref, profileId) {
  final repository = ref.read(userRepositoryProvider);
  final localizations = ref.read(appLocalizationsProvider);

  return EditProfileNotifier(repository: repository, localizations: localizations, profileId: profileId);
});

class EditProfileNotifier extends StateNotifier<AsyncValue<EditProfileState>> {
  final UserRepository _repository;
  final AppLocalizations _localizations;
  final String _profileId;

  EditProfileNotifier({
    required UserRepository repository,
    required AppLocalizations localizations,
    required String profileId,
  })
      : _repository = repository,
        _localizations = localizations,
        _profileId = profileId,
        super(const AsyncLoading()) {
    _loadProfile(_profileId);
  }

  Future<void> _loadProfile(String profileId) async {
    state = const AsyncLoading();

    try {
      final user = await _repository.getUser(profileId);
      state = AsyncValue.data(EditProfileState(
        profile: user,
        username: user.username,
      ));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  CancelableOperation? _usernameCheckJob;

  void onUsernameChange(String newUsername) {
    // Cancel previous timer if exists
    _usernameCheckJob?.cancel();

    var strippedUsername = newUsername.trim();

    // Update username immediately, clear error for now
    state = state.whenData((s) =>
        s.copyWith(
          username: strippedUsername,
          usernameError: '',
        ));

    _usernameCheckJob = CancelableOperation.fromFuture(
      (() async {
        final error = await validateUsername(strippedUsername);
        state = state.whenData((s) => s.copyWith(usernameError: error));
      })(),
    );
  }

  void onNameChange(String newName) {
    var strippedName = newName.trim();

    state = state.whenData((s) =>
        s.copyWith(
          profile: s.profile.copyWith(name: strippedName),
          nameError: validateName(strippedName),
        ));

  }

  void onSurnameChange(String newSurname) {
    var strippedSurname = newSurname.trim();

    state = state.whenData((s) =>
        s.copyWith(
          profile: s.profile.copyWith(surname: strippedSurname),
          surnameError: validateSurname(strippedSurname),
        ));
  }

  Future<String> validateUsername(String username) async {
    final profile = state.value?.profile ?? User();

    if (username == profile.username) return '';
    if (username.trim().isEmpty) return _localizations.usernameMandatory;
    if (await _repository.isUsernameTaken(username)) return _localizations.usernameAlreadyTaken;
    return '';
  }

  String validateName(String name) {
    return name.trim().isEmpty ? _localizations.nameMandatory : '';
  }

  String validateSurname(String surname) {
    return surname.trim().isEmpty ? _localizations.surnameMandatory : '';
  }

  void onSaveProfile(void Function(User) onComplete) async {
    final currentState = state.value;
    if (currentState == null) return;

/*
    // Validate all fields
    final usernameError = await validateUsername(currentState.profile.username);
    final nameError = validateName(currentState.profile.name);
    final surnameError = validateSurname(currentState.profile.surname);

    // Update errors in state
    state = AsyncValue.data(currentState.copyWith(
      usernameError: usernameError,
      nameError: nameError,
      surnameError: surnameError,
    ));

*/
    final hasErrors = [currentState.usernameError, currentState.nameError, currentState.surnameError].any((e) =>
    e.isNotEmpty);
    if (hasErrors) {
      // Don't proceed if validation fails
      return;
    }

    // Build updated user
    final updatedUser = currentState.profile.copyWith(
      username: currentState.username,
    );

    try {
      await _repository.updateUser(updatedUser);
      // Update state with new user & clear errors
      state = AsyncValue.data(currentState.copyWith(profile: updatedUser));

      onComplete(updatedUser);
    } catch (e, st) {
      // If save fails, keep current inputs but surface error in some way
      state = AsyncValue.error(e, st);
    }
  }
}
