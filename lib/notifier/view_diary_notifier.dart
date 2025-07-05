import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverieflutter/data/model/diary.dart';
import 'package:reverieflutter/data/model/diary_page.dart';
import 'package:reverieflutter/data/repository/diary_repository.dart';
import 'package:flutter/material.dart';

part 'view_diary_notifier.freezed.dart';

@freezed
abstract class ViewDiaryState with _$ViewDiaryState {
  @override
  final Diary diary;
  @override
  final PageController pageController;
  @override
  final GlobalKey<State<StatefulWidget>> pageKey;

  ViewDiaryState._({
    Diary? diary,
    PageController? pageController,
    GlobalKey<State<StatefulWidget>>? pageKey,
  }) : diary = diary ?? Diary(),
       pageController = pageController ?? PageController(),
       pageKey = pageKey ?? GlobalKey();

  @override
  factory ViewDiaryState({
    Diary? diary,
    @Default({}) Map<String, DiaryPage> pagesMap,
    PageController? pageController,
    GlobalKey<State<StatefulWidget>>? pageKey,
    @Default(TextScaler.noScaling) TextScaler textScaler,
  }) = _ViewDiaryState;

  int get currentSubPageIndex => pageController.hasClients
      ? (pageController.page?.round() ?? lastSubPageIndex)
      : lastSubPageIndex;

  List<DiaryPage> get pages => diary.pageIds
      .map((pageId) => pagesMap[pageId])
      .whereType<DiaryPage>()
      .toList();

  Size get pageSize => () {
    final renderBox = pageKey.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox != null && renderBox.hasSize) {
      return renderBox.size;
    }
    return Size(0, 0);
  }();

  List<List<String>> get splitPagesList => pages
      .map((p) => p.content)
      .toList()
      .map(
        (text) => splitText(
          text: text,
          textStyle: ViewDiaryNotifier.textStyle,
          pageSize: pageSize,
          textScaler: textScaler,
        ),
      )
      .toList();

  List<String> get splitPages => splitPagesList.expand((e) => e).toList();

  List<int> get pagePerSubPage => splitPagesList
      .asMap()
      .entries
      .expand((entry) => List.filled(entry.value.length, entry.key))
      .toList();

  int get currentPageIndex =>
      pagePerSubPage[min(currentSubPageIndex, lastSubPageIndex)];

  DiaryPage get currentPage => pages[currentPageIndex];

  int get lastSubPageIndex => splitPages.length - 1;
}

@freezed
abstract class ViewDiaryParams with _$ViewDiaryParams {
  factory ViewDiaryParams({
    @Default('') String diaryId,
    @Default(TextScaler.noScaling) TextScaler textScaler,
  }) = _ViewDiaryParams;
}

final viewDiaryNotifierProvider =
    StateNotifierProvider.family<
      ViewDiaryNotifier,
      AsyncValue<ViewDiaryState>,
      ViewDiaryParams
    >((ref, params) {
      final repository = ref.read(diaryRepositoryProvider);

      return ViewDiaryNotifier(
        repository: repository,
        diaryId: params.diaryId,
        textScaler: params.textScaler,
      );
    });

class ViewDiaryNotifier extends StateNotifier<AsyncValue<ViewDiaryState>> {
  final DiaryRepository _repository;
  static const TextStyle textStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    inherit: false,
  );

  ViewDiaryNotifier({
    required DiaryRepository repository,
    required String diaryId,
    required TextScaler textScaler,
  }) : _repository = repository,
       super(AsyncLoading()) {
    _onStart(diaryId, textScaler);
  }

  Future<void> _onStart(String diaryId, TextScaler textScaler) async {
    final diary = await _repository.getDiary(diaryId);
    final pagesMap = {
      for (var pageId in diary.pageIds)
        pageId: await _repository.getPage(pageId),
    };

    state = AsyncData(
      ViewDiaryState(diary: diary, pagesMap: pagesMap, textScaler: textScaler),
    );
    state = state.whenData(
      (s) => s.copyWith(
        pageController: PageController(initialPage: s.lastSubPageIndex),
      ),
    );
  }

  void jumpToFirstPage() {
    state.asData?.value.pageController.jumpTo(0);
  }

  void jumpToPreviousPage() {
    state.asData?.value.pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void jumpToNextPage() {
    state.asData?.value.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void jumpToLastPage() {
    final s = state.asData?.value;
    s?.pageController.jumpToPage(s.lastSubPageIndex);
  }

  void overwritePage(DiaryPage? page) {
    if (page == null) return;

    state = state.whenData((s) {
      final pagesMap = Map<String, DiaryPage>.from(s.pagesMap);

      pagesMap[page.id] = page;
      return s.copyWith(pagesMap: pagesMap);
    });
  }

  void refreshState() {
    state = state.whenData((s) => s);
  }
}

List<String> splitText({
  required String text,
  required TextStyle textStyle,
  required Size pageSize,
  required TextScaler textScaler,
}) {
  final List<String> pageTexts = [];
  final textSpan = TextSpan(text: text, style: textStyle);
  final textPainter = TextPainter(
    text: textSpan,
    textDirection: TextDirection.ltr,
    textScaler: textScaler,
  );

  textPainter.layout(minWidth: 0, maxWidth: pageSize.width);
  final lines = textPainter.computeLineMetrics();

  if (lines.isEmpty) return [text];

  final lineHeight = lines.first.ascent + lines.first.descent;

  double currentPageBottom = pageSize.height + lineHeight;
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
