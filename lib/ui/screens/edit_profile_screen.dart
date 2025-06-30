import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/user.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/ui/components/error_field.dart';
import 'package:reverie_flutter/ui/components/single_field.dart';
import '../../notifier/edit_profile_notifier.dart';


final profileIdProvider = Provider<String>((ref) {
  throw UnimplementedError(); // Will be overridden in ProviderScope.
});


class EditProfileScreen extends ConsumerWidget {
  final void Function(User) onComplete;

  const EditProfileScreen({
    super.key,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileId = ref.watch(profileIdProvider);
    final state = ref.watch(editProfileNotifierProvider(profileId));
    final notifier = ref.read(editProfileNotifierProvider(profileId).notifier);

    return state.when(
      data: (data) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.editProfile,
                // o usa localization
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),

              SingleLineFieldWithError(
                value: data.username,
                errorMessage: data.usernameError,
                onNewValue: notifier.onUsernameChange,
                label: AppLocalizations.of(context)!.username,
              ),

              const SizedBox(height: 16),

              SingleLineFieldWithError(
                value: data.name,
                errorMessage: data.nameError,
                onNewValue: notifier.onNameChange,
                label: AppLocalizations.of(context)!.name,
              ),

              const SizedBox(height: 16),

              SingleLineFieldWithError(
                value: data.surname,
                errorMessage: data.surnameError,
                onNewValue: notifier.onSurnameChange,
                label: AppLocalizations.of(context)!.surname,
              ),

              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: () => notifier.onSaveProfile(onComplete),
                child: Text(AppLocalizations.of(context)!.save),
              ),

              if (data.formError.isNotEmpty) ErrorField(
                  errorMessage: data.formError),
            ],
          ),
        );
      },
      error: (error, _) {
        return Center(child: Text(
            '${AppLocalizations.of(context)!.error}: ${error
                .toString()}'));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}