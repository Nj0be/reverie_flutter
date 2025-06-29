import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';

import '../data/repository/user_repository.dart';
import '../data/model/user.dart';

enum ProfileStatus { loading, success, error }

// Sealed Class in Flutter
abstract class ProfileUiState {}

class LoadingState extends ProfileUiState {}

class SuccessState extends ProfileUiState {
  final User profile;
  final bool isOwner;

  SuccessState(this.profile, this.isOwner);
}

class ErrorState extends ProfileUiState {
  final String message;

  ErrorState(this.message);
}
//

class ProfileViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final fb.FirebaseAuth auth;
  final String profileId;

  ProfileUiState _uiState = LoadingState();
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
      final isOwner = auth.currentUser?.uid == user.id;
      // final isOwner = true; // for testing only, before login implementation
      _uiState = SuccessState(user, isOwner);
    } catch (e) {
      _uiState = ErrorState(e.toString());
    }
    notifyListeners();
  }

  void overwriteProfile(User? profile) {
    if (profile != null) {
      _uiState = SuccessState(profile, true);
      notifyListeners();
    }
  }
}
