import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/diary_cover.dart';
import 'package:reverie_flutter/storage_service.dart';
import 'package:reverie_flutter/data/repository/user_repository.dart';

import '../model/diary.dart';

final diaryRepositoryProvider = Provider<DiaryRepository>((ref) {
  final storage = ref.read(storageServiceProvider);
  final userRepository = ref.read(userRepositoryProvider);

  return DiaryRepository(storageService: storage, userRepository: userRepository);
});

class DiaryRepository {
  final StorageService _storage;
  final UserRepository _userRepository;

  DiaryRepository({
    required StorageService storageService,
    required UserRepository userRepository,
  }) : _userRepository = userRepository, _storage = storageService;

  Future<Diary> getDiary(String diaryId) async {
    final diary = await _storage.getDiary(diaryId);
    if (diary == null) {
      throw Exception('Diary not found for id $diaryId');
    }
    return diary;
  }

  Future<List<Diary>> getUserDiaries(String userId) async {
    final user = await _userRepository.getUser(userId);
    return Future.wait(user.diaryIds.map(getDiary));
  }

  Future<DiaryCover> getDiaryCover(String diaryCoverId) async {
    final diaryCover = await _storage.getDiaryCover(diaryCoverId);
    if (diaryCover == null) {
      throw Exception('DiaryCover with ID $diaryCoverId does not exists');
    }
    return diaryCover;
  }
}
