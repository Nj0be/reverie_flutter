import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/notifier/split_text_notifier.dart';

part 'page_controller_notifier.freezed.dart';

@freezed
abstract class PageState with _$PageState {
  @override
  final PageController pageController;

  PageState._({PageController? pageController})
      : pageController = pageController ?? PageController();

  factory PageState({
    @Default(0) int currentSubPage,
    @Default([]) List<String> pages,
    PageController? pageController,
    @Default(Size(0, 0)) Size pageSize,
    @Default([]) List<String> texts,
    @Default(TextStyle(fontSize: 25, color: Colors.black)) TextStyle textStyle,
  }) = _PageState;
}

@freezed
abstract class PageControllerParams with _$PageControllerParams{
  factory PageControllerParams({
    @Default(Size(0, 0)) Size pageSize,
    @Default([]) List<String> texts,
  }) = _PageControllerParams;
}

final pageControllerProvider = StateNotifierProvider.family<PageControllerNotifier, PageState, PageControllerParams>((ref, params) {
  return PageControllerNotifier(pageSize: params.pageSize, texts: params.texts);
});

class PageControllerNotifier extends StateNotifier<PageState> {
  PageControllerNotifier({
    required Size pageSize,
    required List<String> texts,
  }) : super(PageState(pageSize: pageSize)) {
    final pages = texts.map((text) => splitText(
      text: text,
      textStyle: state.textStyle,
      pageSize: state.pageSize,
    )).toList().expand((e) => e).toList();
    state = state.copyWith(pages: pages, texts: texts);
  }

  void changeSubPage(int index) {
    state = state.copyWith(currentSubPage: index);
  }
}
