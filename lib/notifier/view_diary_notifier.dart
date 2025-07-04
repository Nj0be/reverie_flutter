import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/diary.dart';
import 'package:reverie_flutter/data/model/diary_page.dart';
import 'package:reverie_flutter/data/repository/diary_repository.dart';
import 'package:flutter/material.dart';

part 'view_diary_notifier.freezed.dart';

@freezed
abstract class ViewDiaryState with _$ViewDiaryState {
  @override
  final Diary diary;
  @override
  final PageController pageController;

  ViewDiaryState._({Diary? diary, PageController? pageController})
      : diary = diary ?? Diary(), pageController = pageController ?? PageController();

  @override
  factory ViewDiaryState({
    Diary? diary,
    @Default({}) Map<String, DiaryPage> pagesMap,
    @Default(0) int currentSubPage,
    PageController? pageController,
    @Default(Size(0, 0)) Size pageSize,
    @Default(TextStyle(fontSize: 25, color: Colors.black)) TextStyle textStyle,
  }) = _ViewDiaryState;

  List<DiaryPage> get pages => diary.pageIds.map((pageId) => pagesMap[pageId]).whereType<DiaryPage>().toList();
  List<List<String>> get splitPagesList => pages.map((p) => p.content).toList().map((text) => splitText(
    text: text,
    textStyle: textStyle,
    pageSize: pageSize,
  )).toList();
  List<String> get splitPages => splitPagesList.expand((e) => e).toList();
  List<int> get subPagesPerPage => splitPagesList.map((pagesList) => pagesList.length).toList();
  int get currentPageIndex => subPagesPerPage.indexWhere((i) =>
    currentSubPage < subPagesPerPage.take(i + 1).fold(0, (a, b) => a + b)
  );
  DiaryPage get currentPage => pages[currentPageIndex];
}

@freezed
abstract class ViewDiaryParams with _$ViewDiaryParams{
  factory ViewDiaryParams({
    @Default('') String diaryId,
    @Default(Size(0, 0)) Size pageSize,
  }) = _ViewDiaryParams;
}

final viewDiaryNotifierProvider = StateNotifierProvider.family<ViewDiaryNotifier, AsyncValue<ViewDiaryState>, ViewDiaryParams>((ref, params) {
  final repository = ref.read(diaryRepositoryProvider);

  return ViewDiaryNotifier(
    repository: repository,
    diaryId: params.diaryId,
    pageSize: params.pageSize,
  );
});

class ViewDiaryNotifier extends StateNotifier<AsyncValue<ViewDiaryState>> {
  final DiaryRepository _repository;

  ViewDiaryNotifier({
    required DiaryRepository repository,
    required String diaryId,
    required Size pageSize,
  }) : _repository = repository, super(AsyncLoading()) {
    _onStart(diaryId, pageSize);
  }

  Future<void> _onStart(String diaryId, Size pageSize) async {
    final diary = await _repository.getDiary(diaryId);
    final pagesMap = {
      for (var pageId in diary.pageIds)
        pageId : await _repository.getPage(pageId)
    };

    state = AsyncData(
        ViewDiaryState(
            diary: diary,
          pagesMap: pagesMap,
          pageSize: pageSize
        )
    );
  }

  void overwritePage(DiaryPage page) {
    final currentState = state.value;
    if (currentState == null) return;

    debugPrint(page.toString());

    final pagesMap = Map<String, DiaryPage>.from(currentState.pagesMap);

    pagesMap[page.id] = page;

    state = state.whenData((s) {
      return s.copyWith(pagesMap: pagesMap);
    });
  }

  void changeSubPage(int index) {
    state = state.whenData((s) => s.copyWith(currentSubPage: index));
  }
}

List<String> splitText({
  required String text,
  required TextStyle textStyle,
  required Size pageSize,
}) {
  final List<String> pageTexts = [];
  final textSpan = TextSpan(text: text, style: textStyle);
  final textPainter = TextPainter(
    text: textSpan,
    textDirection: TextDirection.ltr,
  );

  textPainter.layout(minWidth: 0, maxWidth: pageSize.width);
  final lines = textPainter.computeLineMetrics();

  double currentPageBottom = pageSize.height;
  int start = 0, end = 0;

  for (final line in lines) {
    final top = line.baseline - line.ascent;
    final bottom = line.baseline + line.descent;

    if (currentPageBottom < bottom) {
      end = textPainter.getPositionForOffset(Offset(line.left, top)).offset;
      final pageText = text.substring(start, end);
      pageTexts.add(pageText);
      start = end;
      currentPageBottom = top + pageSize.height;
    }
  }

  pageTexts.add(text.substring(start));
  return pageTexts;
}
