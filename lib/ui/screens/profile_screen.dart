import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/user.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import '../../notifier/profile_notifier.dart';

class ProfileScreen extends ConsumerWidget {
  static const String name = 'profile';
  static const String path = '/profile/:profileId';

  final String profileId;
  final Future<User> Function(String) onEditProfile;
  final void Function() onLogout;

  const ProfileScreen({
    super.key,
    required this.profileId,
    required this.onEditProfile,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileNotifierProvider(profileId));
    final notifier = ref.watch(profileNotifierProvider(profileId).notifier);

    return state.when(
      data: (data) {
        final profile = data.profile;
        final isOwner = data.isOwner;

        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isOwner
                    ? AppLocalizations.of(context)!.yourProfile
                    : AppLocalizations.of(context)!.profile,
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
                  onPressed: () async {
                    final updatedProfile = await onEditProfile(profile.id);
                    notifier.overwriteProfile(updatedProfile);
                  },
                  child: Text(AppLocalizations.of(context)!.editProfile),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => onLogout(),
                  child: Text(AppLocalizations.of(context)!.logout),
                ),
              ],
            ],
          ),
        );
      },
      error: (error, _) {
        return Center(
          child: Text(
            '${AppLocalizations.of(context)!.errorMessage}: $error',
            style: const TextStyle(color: Colors.red),
          ),
        );
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
