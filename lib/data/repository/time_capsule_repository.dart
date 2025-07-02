import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/time_capsule.dart';
import 'package:reverie_flutter/data/repository/user_repository.dart';
import 'package:reverie_flutter/storage_service.dart';

final timeCapsuleRepositoryProvider = Provider<TimeCapsuleRepository>((ref) {
  final storage = ref.read(storageServiceProvider);
  final userRepository = ref.read(userRepositoryProvider);

  return TimeCapsuleRepository(storageService: storage, userRepository: userRepository);
});

class TimeCapsuleRepository {
  final StorageService _storage;
  final UserRepository _userRepository;

  TimeCapsuleRepository({
    required StorageService storageService,
    required UserRepository userRepository,
  }) : _userRepository = userRepository, _storage = storageService;

  Future<List<TimeCapsule>> getUserSentTimeCapsules(String userId) async {
    final user = await _userRepository.getUser(userId);
    return Future.wait(user.sentTimeCapsuleIds.map(getTimeCapsule));
  }

  Future<List<TimeCapsule>> getUserReceivedTimeCapsules(String userId) async {
    final user = await _userRepository.getUser(userId);
    return Future.wait(user.receivedTimeCapsuleIds.map(getTimeCapsule));
  }

  Future<TimeCapsule> getTimeCapsule(String timeCapsuleId) async {
    final timeCapsule = await _storage.getTimeCapsule(timeCapsuleId);
    if (timeCapsule == null) {
      throw Exception("TimeCapsule with ID $timeCapsuleId does not exist");
    }
    return timeCapsule;
  }

  Future<TimeCapsule> saveTimeCapsule(TimeCapsule timeCapsule) async {
    final savedTimeCapsule = await _storage.saveTimeCapsule(timeCapsule);

    // Add time capsule to the sending user
    final user = await _userRepository.getUser(timeCapsule.userId);
    final sentTimeCapsuleIds = List<String>.from(user.sentTimeCapsuleIds)
      ..add(savedTimeCapsule.id);
    await _userRepository.updateUser(
        user.copyWith(sentTimeCapsuleIds: sentTimeCapsuleIds));

    // Add to received capsules if the sender is also a receiver
    if (savedTimeCapsule.receiversIds.contains(user.id)) {
      final receivedTimeCapsuleIds = List<String>.from(
          user.receivedTimeCapsuleIds)
        ..add(savedTimeCapsule.id);
      await _userRepository.updateUser(
          user.copyWith(receivedTimeCapsuleIds: receivedTimeCapsuleIds));
    }

    return getTimeCapsule(savedTimeCapsule.id);
  }

  Future<void> deleteTimeCapsule(TimeCapsule timeCapsule) async {
    await _storage.deleteTimeCapsule(timeCapsule);
  }
}
