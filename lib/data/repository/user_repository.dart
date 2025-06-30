import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/storage_service.dart';

import '../model/user.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final storage = ref.read(storageServiceProvider);
  return UserRepository(storage: storage);
});

class UserRepository {
  UserRepository({required StorageService storage})
      : _storage = storage;

  late final StorageService _storage;

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

  Future<void> updateUser(User user) async {
    await _storage.updateUser(user);
  }
}