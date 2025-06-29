import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';

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
//

class ProfileViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final fb.FirebaseAuth auth;
  final String profileId;

  ProfileUiState _uiState = ProfileLoadingState();
  ProfileUiState get uiState => _uiState;

  ProfileViewModel({
    required this.userRepository,
    required this.auth,
    required this.profileId,
  }) {
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final user = await userRepository.getUser(profileId);
      // final isOwner = auth.currentUser?.uid == user.id;
      final isOwner = true; // for testing only, before login implementation
      _uiState = ProfileSuccessState(user, isOwner);
    } catch (e) {
      _uiState = ProfileErrorState(e.toString());
    }
    notifyListeners();
  }

  void overwriteProfile(User? profile) {
    if (profile != null) {
      _uiState = ProfileSuccessState(profile, true);
      notifyListeners();
    }
  }
}
