import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/notifier/signup_notifier.dart';
import 'package:reverie_flutter/ui/components/error_field.dart';
import 'package:reverie_flutter/ui/components/single_field.dart';

class SignupScreen extends ConsumerWidget {
  static const String name = 'signup';
  static const String path = '/signup';

  final void Function() onSignupSuccess;
  final void Function() onNavigateToLogin;

  const SignupScreen({
    super.key,
    required this.onSignupSuccess,
    required this.onNavigateToLogin,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signupNotifierProvider);
    final notifier = ref.watch(signupNotifierProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.login,
            // o usa localization
            style: Theme
                .of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),

          SingleLineFieldWithError(
            value: state.email,
            errorMessage: state.emailError,
            onNewValue: notifier.onEmailChange,
            label: AppLocalizations.of(context)!.email,
          ),

          const SizedBox(height: 16),

          SingleLineFieldWithError(
            value: state.username,
            errorMessage: state.usernameError,
            onNewValue: notifier.onUsernameChange,
            label: AppLocalizations.of(context)!.username,
          ),

          const SizedBox(height: 16),

          SingleLineFieldWithError(
            value: state.name,
            errorMessage: state.nameError,
            onNewValue: notifier.onNameChange,
            label: AppLocalizations.of(context)!.name,
          ),

          const SizedBox(height: 16),

          SingleLineFieldWithError(
            value: state.surname,
            errorMessage: state.surnameError,
            onNewValue: notifier.onSurnameChange,
            label: AppLocalizations.of(context)!.surname,
          ),

          const SizedBox(height: 16),

          SingleLineFieldWithError(
            value: state.password,
            errorMessage: state.passwordError,
            onNewValue: notifier.onPasswordChange,
            label: AppLocalizations.of(context)!.password,
          ),

          const SizedBox(height: 16),

          SingleLineFieldWithError(
            value: state.confirmPassword,
            errorMessage: state.confirmPasswordError,
            onNewValue: notifier.onConfirmPasswordChange,
            label: AppLocalizations.of(context)!.confirmPassword,
          ),

          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: () => notifier.onSignup(onSignupSuccess),
            child: Text(AppLocalizations.of(context)!.signup),
          ),

          const SizedBox(height: 8),

          TextButton(
              onPressed: onNavigateToLogin,
              child: Text(AppLocalizations.of(context)!.alreadyHaveAccount)
          ),

          const SizedBox(height: 16),

          if (state.formError.isNotEmpty) ErrorField(
              errorMessage: state.formError),
        ],
      ),
    );
  }
}
