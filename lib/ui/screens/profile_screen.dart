import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/ui/screens/edit_profile_screen.dart';
import '../../notifier/profile_notifier.dart';

class ProfileScreen extends ConsumerWidget {
  final void Function(String) onEditProfile;
  final void Function(String) onLogout;

  const ProfileScreen({
    super.key,
    required this.onEditProfile,
    required this.onLogout
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileId = ref.watch(profileIdProvider);
    final state = ref.watch(profileNotifierProvider(profileId));

    if (state is ProfileLoadingState) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is ProfileErrorState) {
      return Center(
        child: Text
(
          '${AppLocalizations.of(context)!.errorMessage}: ${state.message}',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    if (state is ProfileSuccessState) {
      final profile = state.profile;
      final isOwner = state.isOwner;

      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isOwner ? AppLocalizations.of(context)!.viewYourProfileTitle : AppLocalizations.of(context)!.viewProfileTitle,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  '${AppLocalizations.of(context)!.username}: ${profile.username}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 40),
                Text(
                  '${AppLocalizations.of(context)!.name}: ${profile.name}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 40),
                Text(
                  '${AppLocalizations.of(context)!.surname}: ${profile.surname}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 40),
                if (isOwner) ...[
                  ElevatedButton(
                    onPressed: () => onEditProfile(profile.id),
                    child: Text(AppLocalizations.of(context)!.editProfileButton),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => onLogout(profile.id),
                    child: Text(AppLocalizations.of(context)!.logoutButton),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    }

    // Optional fallback
    return const SizedBox.shrink();
  }
}