import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reverieflutter/data/repository/user_repository.dart';
import 'package:reverieflutter/l10n/app_localizations.dart';
import 'package:reverieflutter/l10n/localizations_provider.dart';
import 'package:reverieflutter/utils.dart';
import 'package:riverpod/riverpod.dart';

part 'login_notifier.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default('') String emailError,
    @Default('') String password,
    @Default('') String passwordError,
    @Default('') String formError,
  }) = _LoginState;
}

final loginNotifierProvider = StateNotifierProvider<LoginNotifier, LoginState>((
  ref,
) {
  final repository = ref.read(userRepositoryProvider);
  final localizations = ref.read(appLocalizationsProvider);

  return LoginNotifier(repository: repository, localizations: localizations);
});

class LoginNotifier extends StateNotifier<LoginState> {
  final UserRepository repository;
  final AppLocalizations localizations;

  LoginNotifier({required this.repository, required this.localizations})
    : super(LoginState());

  String validateEmail(String email) {
    if (email.isEmpty) {
      return localizations.emailMandatory;
    } else if (!isEmailValid(email)) {
      return localizations.emailNotValid;
    } else {
      return "";
    }
  }

  String validatePassword(String password) {
    if (password.isEmpty) {
      return localizations.passwordMandatory;
    } else {
      return "";
    }
  }

  void onEmailChange(String newEmail) {
    state = state.copyWith(email: newEmail, emailError: validateEmail(newEmail));
  }

  void onPasswordChange(String newPassword) {
    state = state.copyWith(password: newPassword, passwordError: validatePassword(newPassword));
  }

  Future<void> onLogin(void Function() onLoginSuccess) async {
    // Clear any form-wide errors
    // Validate individual inputs
    state = state.copyWith(
      emailError: validateEmail(state.email),
      passwordError: validatePassword(state.password),
      formError: '',
    );

    if (state.emailError.isNotEmpty || state.passwordError.isNotEmpty) {
      return;
    }

    // Proceed with login attempt
    try {
      final isAuthenticated = await repository.authenticate(
        state.email,
        state.password,
      );

      if (isAuthenticated) {
        onLoginSuccess();
        state = LoginState();
      } else {
        state = state.copyWith(formError: localizations.loginError);
      }
    } catch (error) {
      // Handle any unexpected errors
      state = state.copyWith(
        formError: localizations.loginError,
      );
    }
  }
}
