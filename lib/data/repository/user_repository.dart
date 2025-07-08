import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverieflutter/storage_service.dart';

import '../model/user.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final storage = ref.read(storageServiceProvider);
  final auth = ref.read(firebaseAuthInstanceProvider);

  return UserRepository(storage: storage, auth: auth);
});

class UserRepository {
  UserRepository({
    required StorageService storage,
    required FirebaseAuth auth,
  })
      : _storage = storage,
        _auth = auth;

  final StorageService _storage;
  final FirebaseAuth _auth;

  Future<User> getUser(String userId) async {
    final user = await _storage.getUser(userId);
    if (user == null) {
      throw Exception('User not found for id $userId');
    }
    return user;
  }

  Future<bool> isUsernameTaken(String username) async {
    return await _storage.isUsernameTaken(username);
  }

  Future<bool> isEmailTaken(String email) async {
    return await _storage.isEmailTaken(email);
  }

  Future<void> updateUser(User user) async {
    await _storage.updateUser(user);
  }

  Future<bool> authenticate(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<User?> createAccount(User user, String password) async {
    try {
      final firebaseUser = (await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      )).user;

      if (firebaseUser == null) return null;

      final userWithId = user.copyWith(id: firebaseUser.uid);
      return _storage.saveUser(userWithId);
    } catch (e) {
      return null;
    }
  }

  Null sendPasswordResetEmail(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }

  Future<List<User>> getUsersMatchingPartialUsername(String partialUsername) async {
    return await _storage.getUsersMatchingPartialUsername(partialUsername);
  }
}