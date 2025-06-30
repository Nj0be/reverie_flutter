import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/storage_service.dart';

import '../data/repository/user_repository.dart';
import '../data/model/user.dart';

enum ProfileStatus { loading, success, error }

// Sealed Class in Flutter
abstract class ProfileUiState {}

class ProfileLoadingState extends ProfileUiState {}

class ProfileSuccessState extends ProfileUiState {
  final User profile;
  final bool isOwner;

  ProfileSuccessState(this.profile, this.isOwner);
}

class ProfileErrorState extends ProfileUiState {
  final String message;

  ProfileErrorState(this.message);
}

final profileNotifierProvider = StateNotifierProvider.family<
    ProfileNotifier, ProfileUiState, String>((ref, profileId) {
  final repository = ref.read(userRepositoryProvider);
  final auth = ref.read(firebaseAuthInstanceProvider);

  return ProfileNotifier(repository: repository, auth: auth, profileId: profileId);
});

class ProfileNotifier extends StateNotifier<ProfileUiState> {
  final UserRepository repository;
  final FirebaseAuth auth;
  final String profileId;

  ProfileNotifier({
    required this.repository,
    required this.auth,
    required this.profileId,
  }) : super(ProfileLoadingState()) {
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final user = await repository.getUser(profileId);
      // final isOwner = auth.currentUser?.uid == user.id;
      final isOwner = true; // for testing only, before login implementation
      state = ProfileSuccessState(user, isOwner);
    } catch (e) {
      state = ProfileErrorState(e.toString());
    }
  }

  void overwriteProfile(User? profile) {
    if (profile != null) {
      state = ProfileSuccessState(profile, true);
    }
  }
}
