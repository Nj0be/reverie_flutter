import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/diary.dart';
import 'package:reverie_flutter/data/model/diary_page.dart';
import 'package:reverie_flutter/data/model/diary_sub_page.dart';
import 'package:reverie_flutter/data/repository/diary_repository.dart';

part 'view_diary_notifier.freezed.dart';

@freezed
abstract class ViewDiaryState with _$ViewDiaryState {
  @override
  final Diary diary;

  ViewDiaryState._({Diary? diary})
      : diary = diary ?? Diary();

  @override
  factory ViewDiaryState({
    Diary? diary,
    @Default({}) Map<String, DiaryPage> pagesMap,
    @Default({}) Map<String, DiarySubPage> subPagesMap,
  }) = _ViewDiaryState;

  List<DiaryPage> get pages => diary.pageIds.map((pageId) => pagesMap[pageId]).whereType<DiaryPage>().toList();
  List<DiarySubPage> get subPages => pages.expand((page) => page.subPageIds).map((subPageId) => subPagesMap[subPageId]).whereType<DiarySubPage>().toList();
}

final viewDiaryNotifierProvider = StateNotifierProvider.family<ViewDiaryNotifier, AsyncValue<ViewDiaryState>, String>((ref, diaryId) {
  final repository = ref.read(diaryRepositoryProvider);

  return ViewDiaryNotifier(
    repository: repository,
    diaryId: diaryId,
  );
});

class ViewDiaryNotifier extends StateNotifier<AsyncValue<ViewDiaryState>> {
  final DiaryRepository _repository;

  ViewDiaryNotifier({
    required DiaryRepository repository,
    required String diaryId,
  }) : _repository = repository, super(AsyncLoading()) {
    _onStart(diaryId);
  }

  Future<void> _onStart(String diaryId) async {
    final diary = await _repository.getDiary(diaryId);
    final pagesMap = {
      for (var pageId in diary.pageIds)
        pageId : await _repository.getPage(pageId)
    };
    final subPagesMap = {
      for (var subPageId in pagesMap.values.expand((page) => page.subPageIds))
        subPageId : await _repository.getSubPage(subPageId)
    };

    state = AsyncData(
        ViewDiaryState(
            diary: diary,
          pagesMap: pagesMap,
          subPagesMap: subPagesMap,
        )
    );

    addEmptyPage();
  }

  Future<void> addEmptyPage() async {
    final currentState = state.value;
    if (currentState == null) return;

    final pages = currentState.pages;
    final subPages = currentState.subPages;

    // if no necessity to add empty page, return
    if (pages.isNotEmpty && pages.last.timestamp.toDate().day == DateTime.now().day) return;

    final lastPage = pages.isNotEmpty ? pages.last : null;
    final lastSubPage = subPages.isNotEmpty ? subPages.last : null;

    // if last page is empty, just update its timestamp
    if (lastPage != null &&
        lastPage.content.isEmpty &&
        (lastSubPage?.imageIds.isEmpty ?? true)) {
      final updatedPage = lastPage.copyWith(timestamp: Timestamp.now());
      await _repository.updatePage(updatedPage);

      final updatedPagesMap = Map<String, DiaryPage>.from(currentState.pagesMap)
        ..[updatedPage.id] = updatedPage;

      state = AsyncData(currentState.copyWith(pagesMap: updatedPagesMap));
      return;
    }

    // otherwise create a new page
    final newPage = DiaryPage(diaryId: currentState.diary.id);
    final savedPage = await _repository.savePage(newPage);

    final updatedPagesMap = Map<String, DiaryPage>.from(currentState.pagesMap)
      ..[savedPage.id] = savedPage;

    final updatedPageIds = [...currentState.diary.pageIds, savedPage.id];
    final updatedDiary = currentState.diary.copyWith(pageIds: updatedPageIds);

    final updatedSubPagesMap = Map<String, DiarySubPage>.from(currentState.subPagesMap);
    final firstSubPageId = savedPage.subPageIds.first;
    final firstSubPage = await _repository.getSubPage(firstSubPageId);
    updatedSubPagesMap[firstSubPageId] = firstSubPage;

    state = AsyncData(currentState.copyWith(
      diary: updatedDiary,
      pagesMap: updatedPagesMap,
      subPagesMap: updatedSubPagesMap,
    ));
  }

  void overwritePage(DiaryPage page) {
    final currentState = state.value;
    if (currentState == null) return;

    var pagesMap = currentState.pagesMap;
    var subPagesMap = currentState.subPagesMap;

    pagesMap[page.id] = page;

    for (var subPageId in page.subPageIds) {
      final subPage = subPagesMap[subPageId];
      if (subPage != null) {
        subPagesMap[subPageId] = subPage.copyWith(testOverflow: 0, contentEndIndex: 0);
      }
    }
  }
}
