import 'package:flutter/material.dart';
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

    if (uiState is LoadingState) {
      return const Center(child: CircularProgressIndicator());
    }

    if (uiState is ErrorState) {
      return Center(
        child: Text(
          'Error: ${uiState.message}',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    if (uiState is SuccessState) {
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
                  isOwner ? 'Your Profile' : 'Profile',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'Username: ${profile.username}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 40),
                Text(
                  'Name: ${profile.name}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 40),
                Text(
                  'Surname: ${profile.surname}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 40),
                if (isOwner) ...[
                  ElevatedButton(
                    onPressed: () => onEditProfile(profile.id),
                    child: const Text('Edit Profile'),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => onLogout(profile.id),
                    child: const Text('Logout'),
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