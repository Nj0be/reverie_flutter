import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverieflutter/l10n/app_localizations.dart';
import 'package:reverieflutter/notifier/reset_password_notifier.dart';
import 'package:reverieflutter/ui/components/error_field.dart';
import 'package:reverieflutter/ui/components/single_field.dart';

class ResetPasswordScreen extends ConsumerWidget {
  static const String name = 'reset_password';
  static const String path = '/reset_password';

  final void Function() onNavigateToLogin;

  const ResetPasswordScreen({
    super.key,
    required this.onNavigateToLogin,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(resetPasswordNotifierProvider);
    final notifier = ref.watch(resetPasswordNotifierProvider.notifier);
    final localizations = AppLocalizations.of(context)!;

    if (state.resetSuccessful) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              localizations.resetPasswordEmailSent,
              // o usa localization
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 32),

            TextButton(
                onPressed: onNavigateToLogin,
                child: Text(localizations.goBackToLogin)
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              localizations.resetPassword,
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
              label: localizations.email,
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () => notifier.onResetPassword(),
              child: Text(localizations.resetPassword),
            ),

            const SizedBox(height: 8),

            TextButton(
                onPressed: onNavigateToLogin,
                child: Text(localizations.goBackToLogin)
            ),

            const SizedBox(height: 8),

            if (state.formError.isNotEmpty) ErrorField(
                errorMessage: state.formError),
          ],
        ),
      );
    }
  }
}
