import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/diary_cover.dart';
import 'package:reverie_flutter/data/model/diary_page.dart';
import 'package:reverie_flutter/data/model/diary_sub_page.dart';
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

  Future<void> deleteDiary(String diaryId) async {
    final diary = await getDiary(diaryId);

    for (final pageId in diary.pageIds) {
      await deletePage(pageId);
    }

    final user = await _userRepository.getUser(diary.uid);

    final diaryIds = List<String>.from(user.diaryIds);
    diaryIds.remove(diaryId);

    await _userRepository.updateUser(user.copyWith(diaryIds: diaryIds));

    await _storage.deleteDiary(diaryId);
  }

  Future<DiaryPage> getPage(String pageId) async {
    final page = await _storage.getPage(pageId);
    if (page == null) {
      throw StateError('Page with ID $pageId does not exist');
    }
    return page;
  }

  Future<void> deletePage(String pageId) async {
    final page = await getPage(pageId);

    for (final subPageId in page.subPageIds) {
      await deleteSubPage(subPageId);
    }

    final diary = await getDiary(page.diaryId);

    final pageIds = List<String>.from(diary.pageIds);
    pageIds.remove(pageId);

    await updateDiary(diary.copyWith(pageIds: pageIds));

    await _storage.deletePage(pageId);
  }

  Future<void> updateDiary(Diary diary) async {
    await _storage.updateDiary(diary);
  }

  Future<DiarySubPage> getSubPage(String subPageId) async {
    final subPage = await _storage.getSubPage(subPageId);
    if (subPage == null) {
      throw StateError('SubPage with ID $subPageId does not exist');
    }
    return subPage;
  }

  Future<void> deleteSubPage(String subPageId) async {
    DiarySubPage? subPage;
    try {
      subPage = await getSubPage(subPageId);
    } catch (_) {
      return;
    }

    // for (final imageId in subPage.imageIds) {
    //   await deleteDiaryImage(imageId);
    // }

    final page = await getPage(subPage.pageId);
    final subPageIds = List<String>.from(page.subPageIds);
    subPageIds.remove(subPageId);

    await updatePage(page.copyWith(subPageIds: subPageIds));

    await _storage.deleteSubPage(subPageId);
  }

  Future<void> updatePage(DiaryPage page) async {
    await _storage.updatePage(page);
  }
}
