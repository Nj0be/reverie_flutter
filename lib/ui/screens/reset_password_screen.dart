import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverieflutter/l10n/app_localizations.dart';
import 'package:reverieflutter/notifier/reset_password_notifier.dart';
import 'package:reverieflutter/ui/components/error_field.dart';
import 'package:reverieflutter/ui/components/single_field.dart';

class ResetPasswordScreen extends ConsumerWidget {
  static const String name = 'reset_password';
  static const String path = '/reset_password';

  final void Function() onResetPasswordSuccess;

  const ResetPasswordScreen({
    super.key,
    required this.onResetPasswordSuccess,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(resetPasswordNotifierProvider);
    final notifier = ref.watch(resetPasswordNotifierProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.resetPassword,
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

          ElevatedButton(
            onPressed: () => notifier.onResetPassword(onResetPasswordSuccess),
            child: Text(AppLocalizations.of(context)!.resetPassword),
          ),

          const SizedBox(height: 8),

          if (state.formError.isNotEmpty) ErrorField(
              errorMessage: state.formError),
        ],
      ),
    );
  }
}
