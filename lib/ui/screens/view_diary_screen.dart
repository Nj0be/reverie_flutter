import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/diary_page.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/notifier/view_diary_notifier.dart';
import 'package:reverie_flutter/ui/screens/all_diaries_screen.dart';

class ViewDiaryScreen extends ConsumerStatefulWidget {
  static const String name = 'view_diary';
  static const String path = '/view/:diaryId';
  static const String fullPath = AllDiariesScreen.path + path;

  final String diaryId;
  final Future<DiaryPage> Function(String) onNavigateToEditDiaryPage;
  final void Function() onComplete;

  const ViewDiaryScreen({
    super.key,
    required this.diaryId,
    required this.onNavigateToEditDiaryPage,
    required this.onComplete,
  });

  @override
  ConsumerState<ViewDiaryScreen> createState() => _ViewDiaryScreenState();
}

class _ViewDiaryScreenState extends ConsumerState<ViewDiaryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final pageSize = Size(constraints.maxWidth, constraints.maxHeight);

        final state = ref.watch(viewDiaryNotifierProvider(
          ViewDiaryParams(diaryId: widget.diaryId, pageSize: pageSize),
        ));
        final notifier = ref.read(viewDiaryNotifierProvider(
          ViewDiaryParams(diaryId: widget.diaryId, pageSize: pageSize),
        ).notifier);

        //debugPrint("${splitText(text: '', textStyle: TextStyle(), pageSize: pageSize)}");

        return state.when(
          data: (data) => Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.yellowAccent.withValues(alpha: 0.2),
                  child: PageView.builder(
                    controller: data.pageController,
                    itemCount: data.splitPages.length,
                    onPageChanged: notifier.changeSubPage,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(data.splitPages[index], style: data.textStyle),
                    ),
                  ),
                ),
              ),
              _pageControls(data.currentSubPage, data.splitPages.length, data.pageController),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () async {
                  final updatedPage = await widget.onNavigateToEditDiaryPage(data.currentPage.id);
                  notifier.overwritePage(updatedPage);
                },
              ),
            ],
          ),
          error: (error, _) => Center(
            child: Text('${localizations.error}: ${error.toString()}'),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _pageControls(int currentSubPage, int pagesLength, PageController pageController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.first_page),
          onPressed: () => pageController.jumpToPage(0),
        ),
        IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () => pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
        ),
        Text('${currentSubPage + 1}/$pagesLength'),
        IconButton(
          icon: const Icon(Icons.navigate_next),
          onPressed: () => pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.last_page),
          onPressed: () => pageController.jumpToPage(pagesLength - 1),
        ),
      ],
    );
  }
}
