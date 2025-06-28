import 'package:reverie_flutter/storage_service.dart';

import '../model/diary.dart';

class DiaryRepository {
  DiaryRepository({required StorageService storage})
      : _storage = storage;

  late final StorageService _storage;

  Future<Diary> getDiary(String diaryId) async {
    final diary = await _storage.getDiary(diaryId);
    if (diary == null) {
      throw Exception('Diary not found for id $diaryId');
    }
    return diary;
  }
}
