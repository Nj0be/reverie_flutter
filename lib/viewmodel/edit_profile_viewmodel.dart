import 'package:reverie_flutter/data/model/user.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reverie_flutter/data/repository/user_repository.dart';

class EditProfileInputState {
  final String username;
  final String usernameError;
  final String name;
  final String nameError;
  final String surname;
  final String surnameError;

  const EditProfileInputState({
    this.username = '',
    this.usernameError = '',
    this.name = '',
    this.nameError = '',
    this.surname = '',
    this.surnameError = '',
  });

  EditProfileInputState copyWith({
    String? username,
    String? usernameError,
    String? name,
    String? nameError,
    String? surname,
    String? surnameError,
  }) {
    return EditProfileInputState(
      username: username ?? this.username,
      usernameError: usernameError ?? this.usernameError,
      name: name ?? this.name,
      nameError: nameError ?? this.nameError,
      surname: surname ?? this.surname,
      surnameError: surnameError ?? this.surnameError,
    );
  }
}

abstract class EditProfileUiState {}

class EditProfileLoadingState extends EditProfileUiState {}

class EditProfileIdleState extends EditProfileUiState {
  final User profile;
  EditProfileIdleState(this.profile);
}

class EditProfileCompletedState extends EditProfileUiState {
  final User profile;
  EditProfileCompletedState(this.profile);
}

class EditProfileLoadingErrorState extends EditProfileUiState {
  final Exception exception;
  EditProfileLoadingErrorState(this.exception);
}

class EditProfileInputErrorState extends EditProfileUiState {
  final User profile;
  final String errorMessage;
  EditProfileInputErrorState(this.profile, this.errorMessage);
}

class EditProfileViewModel extends ChangeNotifier {
  final UserRepository repository;
  final String profileId;
  final BuildContext context;

  EditProfileUiState _uiState = EditProfileLoadingState();
  EditProfileUiState get uiState => _uiState;

  EditProfileInputState _inputState = const EditProfileInputState();
  EditProfileInputState get inputState => _inputState;

  EditProfileViewModel({
    required this.repository,
    required this.profileId,
    required this.context,
  }) {
    loadProfile(profileId);
  }

  Future<void> loadProfile(String profileId) async {
    _uiState = EditProfileLoadingState();
    notifyListeners();

    try {
      final user = await repository.getUser(profileId);

      _inputState = EditProfileInputState(
        username: user.username,
        name: user.name,
        surname: user.surname,
      );

      _uiState = EditProfileIdleState(user);
    } catch (e) {
      _uiState = EditProfileLoadingErrorState(Exception(e.toString()));
    }

    notifyListeners();
  }

  Timer? _usernameCheckTimer;

  void onUsernameChange(String newUsername) {
    _inputState = _inputState.copyWith(username: newUsername);
    notifyListeners();

    _usernameCheckTimer?.cancel();
    _usernameCheckTimer = Timer(const Duration(milliseconds: 500), () async {
      final error = await validateUsername(newUsername);
      _inputState = _inputState.copyWith(usernameError: error);
      notifyListeners();
    });
  }

  void onNameChange(String newName) {
    final error = validateName(newName);
    _inputState = _inputState.copyWith(name: newName, nameError: error);
    notifyListeners();
  }

  void onSurnameChange(String newSurname) {
    final error = validateSurname(newSurname);
    _inputState = _inputState.copyWith(surname: newSurname, surnameError: error);
    notifyListeners();
  }

  Future<String> validateUsername(String username) async {
    User profile = User.empty();

    if (_uiState is EditProfileIdleState) {
      profile = (_uiState as EditProfileIdleState).profile;
    } else if (_uiState is EditProfileInputErrorState) {
      profile = (_uiState as EditProfileInputErrorState).profile;
    }

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

  Future<void> onSaveProfile() async {
    User profile = User.empty();

    if (_uiState is EditProfileIdleState) {
      profile = (_uiState as EditProfileIdleState).profile;
    } else if (_uiState is EditProfileInputErrorState) {
      profile = (_uiState as EditProfileInputErrorState).profile;
    }

    final newState = _inputState.copyWith(
      usernameError: await validateUsername(_inputState.username),
      nameError: validateName(_inputState.name),
      surnameError: validateSurname(_inputState.surname),
    );

    _inputState = newState;
    notifyListeners();

    final hasErrors = [
      newState.usernameError,
      newState.nameError,
      newState.surnameError,
    ].any((e) => e.isNotEmpty);

    if (hasErrors) {
      _uiState = EditProfileInputErrorState(profile, '');
      notifyListeners();
      return;
    }

    final updatedUser = profile.copyWith(
      username: _inputState.username,
      name: _inputState.name,
      surname: _inputState.surname,
    );

    try {
      await repository.updateUser(updatedUser);
      _uiState = EditProfileCompletedState(updatedUser);
    } catch (e) {
      _uiState = EditProfileInputErrorState(profile, 'Errore durante il salvataggio');
    }

    notifyListeners();
  }
}