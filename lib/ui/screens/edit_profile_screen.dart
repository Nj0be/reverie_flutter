import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/user.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/ui/components/error_field.dart';
import 'package:reverie_flutter/ui/components/single_field.dart';
import '../../notifier/edit_profile_notifier.dart';

class EditProfileScreen extends ConsumerWidget {
  static const String name = 'edit_profile';
  static const String path = '/edit';

  final String profileId;
  final void Function(User) onComplete;

  const EditProfileScreen({
    super.key,
    required this.profileId,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editProfileNotifierProvider(profileId));
    final notifier = ref.read(editProfileNotifierProvider(profileId).notifier);
    final localizations = AppLocalizations.of(context)!;

    return state.when(
      data: (data) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              localizations.editProfile,
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
              label: localizations.username,
            ),

            const SizedBox(height: 16),

            SingleLineFieldWithError(
              value: data.profile.name,
              errorMessage: data.nameError,
              onNewValue: notifier.onNameChange,
              label: localizations.name,
            ),

            const SizedBox(height: 16),

            SingleLineFieldWithError(
              value: data.profile.surname,
              errorMessage: data.surnameError,
              onNewValue: notifier.onSurnameChange,
              label: localizations.surname,
            ),

            const SizedBox(height: 32),

            ElevatedButton(
              onPressed: () => notifier.onSaveProfile(onComplete),
              child: Text(localizations.save),
            ),

            if (data.formError.isNotEmpty) ErrorField(
                errorMessage: data.formError),
          ],
        );
      },
      error: (error, _) {
        return Center(child: Text(
            '${localizations.error}: ${error
                .toString()}'));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}