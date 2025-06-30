import 'package:flutter/material.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import '../../viewmodel/profile_viewmodel.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  final void Function(String) onEditProfile;
  final void Function(String) onLogout;

  const ProfileScreen({
    super.key,
    required this.onEditProfile,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final uiState = context.watch<ProfileViewModel>().uiState;

    if (uiState is ProfileLoadingState) {
      return const Center(child: CircularProgressIndicator());
    }

    if (uiState is ProfileErrorState) {
      return Center(
        child: Text(
          '${AppLocalizations.of(context)!.errorMessage}: ${uiState.message}',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    if (uiState is ProfileSuccessState) {
      final profile = uiState.profile;
      final isOwner = uiState.isOwner;

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