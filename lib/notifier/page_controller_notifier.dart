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
    required int currentPage,
    required List<String> pages,
    PageController? pageController,
  }) = _PageState;

  factory PageState.initial() => PageState(currentPage: 0, pages: []);
}

final pageControllerProvider = NotifierProvider<PageControllerNotifier, PageState>(
  PageControllerNotifier.new,
);

class PageControllerNotifier extends Notifier<PageState> {
  final TextSplitter _splitter = TextSplitter();

  Size? _pageSize;
  final TextStyle _textStyle = const TextStyle(fontSize: 25, color: Colors.black);

  @override
  PageState build() => PageState.initial();

  void updatePageSize(Size size) {
    _pageSize = size;
  }

  void paginate(String text) {
    if (_pageSize == null) return;
    final pages = _splitter.splitText(
      text: text,
      textStyle: _textStyle,
      pageSize: _pageSize!,
    );
    state = state.copyWith(pages: pages);
  }

  void changePage(int index) {
    state = state.copyWith(currentPage: index);
  }

  TextStyle get textStyle => _textStyle;
}
