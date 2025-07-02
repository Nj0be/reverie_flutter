import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reverie_flutter/data/repository/user_repository.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/l10n/localizations_provider.dart';
import 'package:reverie_flutter/utils.dart';
import 'package:riverpod/riverpod.dart';

part 'reset_password_notifier.freezed.dart';

@freezed
abstract class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    @Default('') String email,
    @Default('') String emailError,
    @Default('') String formError,
  }) = _ResetPasswordState;
}

final resetPasswordNotifierProvider =
    StateNotifierProvider<ResetPasswordNotifier, ResetPasswordState>((ref) {
      final repository = ref.read(userRepositoryProvider);
      final localizations = ref.read(appLocalizationsProvider);

      return ResetPasswordNotifier(
        repository: repository,
        localizations: localizations,
      );
    });

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  final UserRepository repository;
  final AppLocalizations localizations;

  ResetPasswordNotifier({required this.repository, required this.localizations})
    : super(ResetPasswordState());

  String validateEmail(String email) {
    if (email.isEmpty) {
      return localizations.emailMandatory;
    } else if (!isEmailValid(email)) {
      return localizations.emailNotValid;
    } else {
      return "";
    }
  }

  void onEmailChange(String newEmail) {
    state = state.copyWith(
      email: newEmail,
      emailError: validateEmail(newEmail),
    );
  }

  Future<void> onResetPassword(void Function() onResetPasswordSuccess) async {
    // Clear any form-wide errors
    // Validate individual inputs
    state = state.copyWith(
      emailError: validateEmail(state.email),
      formError: '',
    );

    if (state.emailError.isNotEmpty) {
      return;
    }

    // Proceed with login attempt
    try {
      repository.sendPasswordResetEmail(
        state.email
      );

      onResetPasswordSuccess();
    } catch (error) {
      // Handle any unexpected errors
      state = state.copyWith(formError: localizations.loginError);
    }
  }
}
