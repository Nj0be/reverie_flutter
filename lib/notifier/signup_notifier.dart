import 'dart:async';

import 'package:async/async.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reverieflutter/data/model/user.dart';
import 'package:reverieflutter/data/repository/user_repository.dart';
import 'package:reverieflutter/l10n/app_localizations.dart';
import 'package:reverieflutter/l10n/localizations_provider.dart';
import 'package:reverieflutter/utils.dart';
import 'package:riverpod/riverpod.dart';

part 'signup_notifier.freezed.dart';

@freezed
abstract class SignupState with _$SignupState {
  const factory SignupState({
    @Default('') String username,
    @Default('') String usernameError,
    @Default('') String email,
    @Default('') String emailError,
    @Default('') String name,
    @Default('') String nameError,
    @Default('') String surname,
    @Default('') String surnameError,
    @Default('') String password,
    @Default('') String passwordError,
    @Default('') String confirmPassword,
    @Default('') String confirmPasswordError,
    @Default('') String formError,
  }) = _SignupState;
}

final signupNotifierProvider = StateNotifierProvider<SignupNotifier, SignupState>((
    ref,
    ) {
  final repository = ref.read(userRepositoryProvider);
  final localizations = ref.read(appLocalizationsProvider);

  return SignupNotifier(repository: repository, localizations: localizations);
});

class SignupNotifier extends StateNotifier<SignupState> {
  final UserRepository repository;
  final AppLocalizations localizations;

  SignupNotifier({required this.repository, required this.localizations})
      : super(SignupState());

  Future<String> validateUsername(String username) async {
    if (username.isEmpty) {
      return localizations.usernameMandatory;
    } else if (username.length < 3) {
      return localizations.usernameLength;
    } else if (await repository.isUsernameTaken(username)) {
      return localizations.usernameAlreadyTaken;
    } else {
      return "";
    }
  }

  Future<String> validateEmail(String email) async {
    if (email.isEmpty) {
      return localizations.emailMandatory;
    } else if (!isEmailValid(email)) {
      return localizations.emailNotValid;
    } else if (await repository.isEmailTaken(email)) {
      return localizations.emailAlreadyTaken;
    } else {
      return "";
    }
  }

  String validateName(String name) {
    if (name.isEmpty) {
      return localizations.nameMandatory;
    } else {
      return "";
    }
  }

  String validateSurname(String surname) {
    if (surname.isEmpty) {
      return localizations.surnameMandatory;
    } else {
      return "";
    }
  }

  String validatePassword(String password) {
    if (password.length < 8) {
      return localizations.passwordLength;
    } else {
      return "";
    }
  }

  String validateConfirmPassword(String confirmPassword) {
    if (state.password.isNotEmpty && state.password != confirmPassword) {
      return localizations.passwordsDontMatch;
    } else {
      return "";
    }
  }

  CancelableOperation? _usernameCheckJob;

  void onUsernameChange(String newUsername) {
    final strippedUsername = newUsername.trim();
    if (strippedUsername == state.username) return;

    // Cancel previous job if exists
    _usernameCheckJob?.cancel();

    state = state.copyWith(
      username: strippedUsername,
      usernameError: '',
    );

    _usernameCheckJob = CancelableOperation.fromFuture(
      (() async {
        final error = await validateUsername(strippedUsername);
        state = state.copyWith(usernameError: error);
      })(),
    );
  }

  CancelableOperation? _emailCheckJob;

  void onEmailChange(String newEmail) {
    final strippedEmail = newEmail.trim();
    if (strippedEmail == state.email) return;

    // Cancel previous job if exists
    _emailCheckJob?.cancel();

    state = state.copyWith(
      email: strippedEmail,
      emailError: '',
    );

    _emailCheckJob = CancelableOperation.fromFuture(
      (() async {
        final error = await validateEmail(strippedEmail);
        state = state.copyWith(emailError: error);
      })(),
    );
  }

  void onNameChange(String newName) {
    final strippedName = newName.trim();
    if (strippedName == state.name) return;

    state = state.copyWith(
      name: strippedName,
      nameError: validateName(strippedName),
    );
  }

  void onSurnameChange(String newSurname) {
    final strippedSurname = newSurname.trim();
    if (strippedSurname == state.surname) return;

    state = state.copyWith(
      surname: strippedSurname,
      surnameError: validateSurname(strippedSurname),
    );
  }

  void onPasswordChange(String newPassword) {
    state = state.copyWith(
        password: newPassword,
        passwordError: validatePassword(newPassword)
    );
  }

  void onConfirmPasswordChange(String newConfirmPassword) {
    state = state.copyWith(
        confirmPassword: newConfirmPassword,
        confirmPasswordError: validateConfirmPassword(newConfirmPassword)
    );
  }

  void onSignup(void Function() onSignupSuccess) async {
    // Clear any form-wide errors
    // Validate individual inputs
    state = state.copyWith(
      usernameError: await validateUsername(state.username),
      emailError: await validateEmail(state.email),
      nameError: validateName(state.name),
      surnameError: validateSurname(state.surname),
      passwordError: validatePassword(state.password),
      confirmPasswordError: validateConfirmPassword(state.confirmPassword),
      formError: '',
    );

    // if there are errors
    if (![
      state.usernameError,
      state.emailError,
      state.nameError,
      state.surnameError,
      state.passwordError,
      state.confirmPasswordError,
    ].every((error) => error.isEmpty)) {
      return;
    }

    final user = await repository.createAccount(
        User(
            username: state.username,
            email: state.email,
            name: state.name,
            surname: state.surname
        ),
        state.password
    );

    if (user != null) {
      onSignupSuccess();
    } else {
      state = state.copyWith(formError: localizations.signupError);
    }
  }
}
