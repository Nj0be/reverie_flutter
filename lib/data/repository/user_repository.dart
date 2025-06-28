import 'package:reverie_flutter/storage_service.dart';

import '../model/user.dart';

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
}