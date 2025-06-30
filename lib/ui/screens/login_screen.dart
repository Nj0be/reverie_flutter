import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/notifier/login_notifier.dart';
import 'package:reverie_flutter/ui/components/error_field.dart';
import 'package:reverie_flutter/ui/components/single_field.dart';

class LoginScreen extends ConsumerWidget {
  final void Function() onLoginSuccess;
  final void Function() onNavigateToRegister;
  final void Function() onNavigateToResetPassword;

  const LoginScreen({
    super.key,
    required this.onLoginSuccess,
    required this.onNavigateToRegister,
    required this.onNavigateToResetPassword,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginNotifierProvider);
    final notifier = ref.watch(loginNotifierProvider.notifier);

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
            value: state.password,
            errorMessage: state.passwordError,
            onNewValue: notifier.onPasswordChange,
            label: AppLocalizations.of(context)!.password,
          ),

          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: () => notifier.onLogin(onLoginSuccess),
            child: Text(AppLocalizations.of(context)!.login),
          ),

          if (state.formError.isNotEmpty) ErrorField(
              errorMessage: state.formError),
        ],
      ),
    );
  }
}
