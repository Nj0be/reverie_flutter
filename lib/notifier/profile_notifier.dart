import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reverieflutter/storage_service.dart';
import '../data/repository/user_repository.dart';
import '../data/model/user.dart';
import 'package:riverpod/riverpod.dart';

part 'profile_notifier.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(User()) User profile,
    @Default(false) bool isOwner,
  }) = _ProfileState;
}

final profileNotifierProvider = StateNotifierProvider.family<
    ProfileNotifier,
    AsyncValue<ProfileState>,
    String>((ref, profileId) {
  final repository = ref.read(userRepositoryProvider);
  final auth = ref.read(firebaseAuthInstanceProvider);

  return ProfileNotifier(
      repository: repository, auth: auth, profileId: profileId);
});

class ProfileNotifier extends StateNotifier<AsyncValue<ProfileState>> {
  final UserRepository repository;
  final FirebaseAuth auth;
  final String profileId;

  ProfileNotifier({
    required this.repository,
    required this.auth,
    required this.profileId,
  }) : super(const AsyncLoading()) {
    _loadProfile(profileId);
  }

  Future<void> _loadProfile(String profileId) async {
    state = const AsyncLoading();

    try {
      final user = await repository.getUser(profileId);
      state = AsyncValue.data(
          ProfileState(
              profile: user,
              isOwner: auth.currentUser?.uid == user.id
          )
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void overwriteProfile(User? profile) {
    if (profile != null) {
      state = AsyncValue.data(
          ProfileState(profile: profile, isOwner: true)
      );
    }
  }
}
