import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/diary_page.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/main.dart';
import 'package:reverie_flutter/notifier/view_diary_notifier.dart';
import 'package:reverie_flutter/ui/screens/all_diaries_screen.dart';
import 'package:reverie_flutter/ui/themes/colors.dart';
import 'package:reverie_flutter/utils.dart';

class ViewDiaryScreen extends ConsumerStatefulWidget {
  static const String name = 'view_diary';
  static const String path = '/view/:diaryId';
  static const String fullPath = AllDiariesScreen.path + path;

  final String diaryId;
  final Future<DiaryPage?> Function(String) onNavigateToEditDiaryPage;
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

    final pageSize = Size(0, 0);

    final state = ref.watch(viewDiaryNotifierProvider(
      ViewDiaryParams(diaryId: widget.diaryId, pageSize: pageSize),
    ));
    final notifier = ref.read(viewDiaryNotifierProvider(
      ViewDiaryParams(diaryId: widget.diaryId, pageSize: pageSize),
    ).notifier);

    // TODO: bad (?) but it works
    var lastPageSize = state.asData?.value.pageSize;
    var lastCurrentSubPageIndex = state.asData?.value.currentSubPageIndex;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final newLastPageSize = state.asData?.value.pageSize;
      final newLastCurrentSubPageIndex = state.asData?.value.currentSubPageIndex;
      if (lastPageSize != newLastPageSize || lastCurrentSubPageIndex != newLastCurrentSubPageIndex) {
        lastPageSize = newLastPageSize;
        lastCurrentSubPageIndex = newLastCurrentSubPageIndex;
        notifier.refreshState();
      }
    });

    return state.when(
      data: (data) => Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Text(
              data.diary.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Expanded(
              child: Card(
                elevation: 8,
                color: AppColors.diaryPaperWhite,
                child: PageView.builder(
                  key: data.pageKey,
                  controller: data.pageController,
                  itemCount: data.splitPages.length,
                  onPageChanged: (_) { notifier.refreshState(); },
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(16), // 👈 padding applicato a ogni pagina
                    child: Text(
                      data.splitPages[index],
                      style: data.textStyle,
                    ),
                  )
                ),
              ),
            ),
            _pageControls(data, notifier),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formatDate(data.currentPage.timestamp.toDate(), pattern: 'dd MMMM'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    final updatedPage = await widget.onNavigateToEditDiaryPage(data.currentPage.id);
                    notifier.overwritePage(updatedPage);
                  },
                ),
              ],
            )
          ],
        ),
      ),
      error: (error, _) => Center(
        child: Text('${localizations.error}: ${error.toString()}'),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _pageControls(ViewDiaryState state, ViewDiaryNotifier notifier) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.first_page),
          onPressed: () => notifier.jumpToFirstPage(),
        ),
        IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () => notifier.jumpToPreviousPage(),
        ),
        Text('${state.currentSubPageIndex + 1}/${state.splitPages.length}'),
        IconButton(
          icon: const Icon(Icons.navigate_next),
          onPressed: () => notifier.jumpToNextPage(),
        ),
        IconButton(
          icon: const Icon(Icons.last_page),
          onPressed: () => notifier.jumpToLastPage(),
        ),
      ],
    );
  }
}
