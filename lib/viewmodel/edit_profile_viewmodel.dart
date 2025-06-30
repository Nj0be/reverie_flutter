import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reverie_flutter/data/model/time_capsule.dart';
import 'package:reverie_flutter/data/model/user.dart';
import 'dart:async';
import 'package:reverie_flutter/data/repository/user_repository.dart';
import 'package:riverpod/riverpod.dart';

part 'edit_profile_viewmodel.freezed.dart';
@freezed
abstract class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    @Default(User()) User profile,
    @Default('') String username,
    @Default('') String usernameError,
    @Default('') String name,
    @Default('') String nameError,
    @Default('') String surname,
    @Default('') String surnameError,
    @Default('') String editError,
  }) = _EditProfileState;
}
final editProfileNotifierProvider = StateNotifierProvider.family<
    EditProfileNotifier, AsyncValue<EditProfileState>, String>((ref, profileId) {
  final repository = ref.read(userRepositoryProvider);
  return EditProfileNotifier(repository: repository, profileId: profileId);
});


class EditProfileNotifier extends StateNotifier<AsyncValue<EditProfileState>> {
  final UserRepository repository;
  final String profileId;

  Timer? _usernameCheckTimer;

  EditProfileNotifier({
    required this.repository,
    required this.profileId,
  }) : super(const AsyncLoading()) {
    loadProfile(profileId);
  }

  Future<void> loadProfile(String profileId) async {
    state = const AsyncLoading();

    try {
      final user = await repository.getUser(profileId);
      state = AsyncValue.data(EditProfileState(
        profile: user,
        username: user.username,
        name: user.name,
        surname: user.surname,
      ));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void onUsernameChange(String newUsername) {
    // Cancel previous timer if exists
    _usernameCheckTimer?.cancel();

    // Update username immediately, clear error for now
    state = state.whenData((s) => s.copyWith(
      username: newUsername,
      usernameError: '',
    ));

    // Debounce validation
    _usernameCheckTimer = Timer(const Duration(milliseconds: 500), () async {
      final error = await validateUsername(newUsername);
      state = state.whenData((s) => s.copyWith(usernameError: error));
    });
  }

  void onNameChange(String newName) {
    final error = validateName(newName);
    state = state.whenData((s) => s.copyWith(name: newName, nameError: error));
  }

  void onSurnameChange(String newSurname) {
    final error = validateSurname(newSurname);
    state = state.whenData((s) => s.copyWith(surname: newSurname, surnameError: error));
  }

  Future<String> validateUsername(String username) async {
    final profile = state.value?.profile ?? User();

    if (username == profile.username) return '';
    if (username.trim().isEmpty) return 'Username obbligatorio';
    if (await repository.isUsernameTaken(username)) return 'Username già in uso';
    return '';
  }

  String validateName(String name) {
    return name.trim().isEmpty ? 'Nome obbligatorio' : '';
  }

  String validateSurname(String surname) {
    return surname.trim().isEmpty ? 'Cognome obbligatorio' : '';
  }

  Future<void> onSaveProfile(void Function(User) onComplete) async {
    final currentState = state.value;
    if (currentState == null) return;

    // Validate all fields
    final usernameError = await validateUsername(currentState.username);
    final nameError = validateName(currentState.name);
    final surnameError = validateSurname(currentState.surname);

    // Update errors in state
    state = AsyncValue.data(currentState.copyWith(
      usernameError: usernameError,
      nameError: nameError,
      surnameError: surnameError,
    ));

    final hasErrors = [usernameError, nameError, surnameError].any((e) => e.isNotEmpty);
    if (hasErrors) {
      // Don't proceed if validation fails
      return;
    }

    // Build updated user
    final updatedUser = currentState.profile.copyWith(
      username: currentState.username,
      name: currentState.name,
      surname: currentState.surname,
    );

    try {
      await repository.updateUser(updatedUser);
      // Update state with new user & clear errors
      state = AsyncValue.data(currentState.copyWith(
        profile: updatedUser,
        usernameError: '',
        nameError: '',
        surnameError: '',
      ));

      WidgetsBinding.instance.addPostFrameCallback((_) {
        onComplete(updatedUser);
      });
    } catch (e, st) {
      // If save fails, keep current inputs but surface error in some way
      state = AsyncValue.error(e, st);
    }
  }
}
