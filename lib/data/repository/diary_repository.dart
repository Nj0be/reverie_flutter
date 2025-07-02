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

  // Future<Diary> saveDiary(Diary diary) async {
  //   return await _storage.saveDiary(diary);
  // }

  Future<Diary> saveDiary(Diary diary) async {
    final savedDiary = await _storage.saveDiary(diary);

    // aggiungi la prima pagina
    await savePage(DiaryPage(diaryId: savedDiary.id));

    // ottieni l'utente attuale e aggiorna la lista dei suoi diari
    final user = await _userRepository.getUser(diary.uid);
    final diaryIds = List<String>.from(user.diaryIds);
    diaryIds.add(savedDiary.id);

    _userRepository.updateUser(user.copyWith(diaryIds: diaryIds));

    return await getDiary(savedDiary.id);
  }

  Future<void> updateDiary(Diary diary) async {
    await _storage.updateDiary(diary);
  }

  Future<void> deleteDiary(Diary diary) async {
    for (final pageId in diary.pageIds) {
      await deletePage(await getPage(pageId));
    }

    await _storage.deleteDiary(diary);
  }

  Future<DiaryCover> getDiaryCover(String diaryCoverId) async {
    return await _storage.getDiaryCover(diaryCoverId) ?? (throw Exception('DiaryCover with ID $diaryCoverId does not exists'));
  }


  Future<DiaryPage> getPage(String pageId) async {
    return await _storage.getPage(pageId) ?? (throw Exception('Page with ID $pageId does not exist'));
  }

  // Future<DiaryPage> savePage(DiaryPage page) async {
  //   return await _storage.savePage(page);
  // }

  Future<DiaryPage> savePage(DiaryPage page) async {
    // salva la pagina
    final savedPage = await _storage.savePage(page);

    // aggiungi la prima sotto-pagina
    await saveSubPage(DiarySubPage(pageId: savedPage.id, diaryId: page.diaryId));

    // aggiorna il diario con la nuova pagina
    final diary = await getDiary(page.diaryId);
    final pageIds = List<String>.from(diary.pageIds);
    pageIds.add(savedPage.id);

    await updateDiary(diary.copyWith(pageIds: pageIds));

    // ritorna la pagina aggiornata
    return await getPage(savedPage.id);
  }

  Future<void> updatePage(DiaryPage page) async {
    await _storage.updatePage(page);
  }

  Future<void> deletePage(DiaryPage page) async {
    for (final subPageId in page.subPageIds) {
      await deleteSubPage(await getSubPage(subPageId));
    }

    await _storage.deletePage(page);
  }

  Future<DiarySubPage> getSubPage(String subPageId) async {
    return await _storage.getSubPage(subPageId) ?? (throw Exception('SubPage with ID $subPageId does not exist'));
  }

  // Future<DiarySubPage> saveSubPage(DiarySubPage subPage) async {
  //   return await _storage.saveSubPage(subPage);
  // }

  Future<DiarySubPage> saveSubPage(DiarySubPage subPage) async {
    final savedSubPage = await _storage.saveSubPage(subPage);

    final page = await getPage(subPage.pageId);
    if (page == null) return DiarySubPage();

    final subPageIds = List<String>.from(page.subPageIds);
    subPageIds.add(savedSubPage.id);

    await updatePage(page.copyWith(subPageIds: subPageIds));

    return savedSubPage;
  }

  Future<void> updateSubPage(DiarySubPage subPage) async {
    await _storage.updateSubPage(subPage);
  }

  Future<void> deleteSubPage(DiarySubPage subPage) async {
    for (final imageId in subPage.imageIds) {
      await deleteDiaryImage(imageId);
    }

    await _storage.deleteSubPage(subPage);
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
