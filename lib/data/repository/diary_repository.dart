import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/diary_cover.dart';
import 'package:reverie_flutter/data/model/diary_page.dart';
import 'package:reverie_flutter/data/model/diary_sub_page.dart';
import 'package:reverie_flutter/storage_service.dart';
import 'package:reverie_flutter/data/repository/user_repository.dart';

import '../model/diary.dart';
import '../model/diary_image.dart';

final diaryRepositoryProvider = Provider<DiaryRepository>((ref) {
  final storage = ref.read(storageServiceProvider);
  final userRepository = ref.read(userRepositoryProvider);

  return DiaryRepository(
    storageService: storage,
    userRepository: userRepository,
  );
});

class DiaryRepository {
  final StorageService _storage;
  final UserRepository _userRepository;

  DiaryRepository({
    required StorageService storageService,
    required UserRepository userRepository,
  }) : _userRepository = userRepository,
       _storage = storageService;

  Future<Diary> getDiary(String diaryId) async {
    return await _storage.getDiary(diaryId) ?? (throw Exception('Diary not found for id $diaryId'));
  }

  Future<List<Diary>> getUserDiaries(String userId) async {
    final user = await _userRepository.getUser(userId);
    return Future.wait(user.diaryIds.map(getDiary));
  }

  Future<Diary> saveDiary(Diary diary) async {
    return await _storage.saveDiary(diary);
  }

  Future<void> updateDiary(Diary diary) async {
    await _storage.updateDiary(diary);
  }

  Future<void> deleteDiary(String diaryId) async {
    Diary? diary;
    try { diary = await getDiary(diaryId); } catch (_) { return; }

    for (final pageId in diary.pageIds) {
      await deletePage(pageId);
    }

    final user = await _userRepository.getUser(diary.uid);

    final diaryIds = List<String>.from(user.diaryIds);
    diaryIds.remove(diaryId);

    await _userRepository.updateUser(user.copyWith(diaryIds: diaryIds));

    await _storage.deleteDiary(diaryId);
  }

  Future<DiaryCover> getDiaryCover(String diaryCoverId) async {
    return await _storage.getDiaryCover(diaryCoverId) ?? (throw Exception('DiaryCover with ID $diaryCoverId does not exists'));
  }


  Future<DiaryPage> getPage(String pageId) async {
    return await _storage.getPage(pageId) ?? (throw Exception('Page with ID $pageId does not exist'));
  }

  Future<DiaryPage> savePage(DiaryPage page) async {
    return await _storage.savePage(page);
  }

  Future<void> updatePage(DiaryPage page) async {
    await _storage.updatePage(page);
  }

  Future<void> deletePage(String pageId) async {
    DiaryPage? page;
    try { page = await getPage(pageId); } catch (_) { return; }

    for (final subPageId in page.subPageIds) {
      await deleteSubPage(subPageId);
    }

    final diary = await getDiary(page.diaryId);

    final pageIds = List<String>.from(diary.pageIds);
    pageIds.remove(pageId);

    await updateDiary(diary.copyWith(pageIds: pageIds));

    await _storage.deletePage(pageId);
  }

  Future<DiarySubPage> getSubPage(String subPageId) async {
    return await _storage.getSubPage(subPageId) ?? (throw Exception('SubPage with ID $subPageId does not exist'));
  }

  Future<DiarySubPage> saveSubPage(DiarySubPage subPage) async {
    return await _storage.saveSubPage(subPage);
  }

  Future<void> updateSubPage(DiarySubPage subPage) async {
    await _storage.updateSubPage(subPage);
  }

  Future<void> deleteSubPage(String subPageId) async {
    DiarySubPage? subPage;
    try { subPage = await getSubPage(subPageId); } catch (_) { return; }

    for (final imageId in subPage.imageIds) {
      await deleteDiaryImage(imageId);
    }

    final page = await getPage(subPage.pageId);
    final subPageIds = List<String>.from(page.subPageIds);
    subPageIds.remove(subPageId);

    await updatePage(page.copyWith(subPageIds: subPageIds));

    await _storage.deleteSubPage(subPageId);
  }

  Future<DiaryImage> getDiaryImage(String diaryImageId) async {
    return await _storage.getDiaryImage(diaryImageId) ?? (throw Exception('DiaryImage with ID $diaryImageId does not exist'));
  }

  Future<void> deleteDiaryImage(String diaryImageId) async {
    DiaryImage? diaryImage;
    try { diaryImage = await getDiaryImage(diaryImageId); } catch (_) { return; }

    final subPage = await getSubPage(diaryImage.subPageId);
    final imageIds = List<String>.from(subPage.imageIds);
    imageIds.remove(diaryImageId);

    await updateSubPage(subPage.copyWith(imageIds: imageIds));

    await _storage.deleteDiaryImage(diaryImageId);
  }

  Future<List<DiaryCover>> getAllDiaryCovers() async {
    return await _storage.getAllDiaryCovers();
  }
}
