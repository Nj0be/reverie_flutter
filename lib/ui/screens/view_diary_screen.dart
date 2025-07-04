import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/notifier/page_controller_notifier.dart';
import 'package:reverie_flutter/notifier/view_diary_notifier.dart';
import 'package:reverie_flutter/ui/screens/all_diaries_screen.dart';

class ViewDiaryScreen extends ConsumerStatefulWidget {
  static const String name = 'view_diary';
  static const String path = '/view/:id';
  static const String fullPath = AllDiariesScreen.path + path;

  final String diaryId;

  const ViewDiaryScreen({
    super.key,
    required this.diaryId,
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
    final asyncState = ref.watch(viewDiaryNotifierProvider(widget.diaryId));

    return asyncState.when(
      data: (data) {

      return LayoutBuilder(
        builder: (context, constraints) {
          final pageSize = Size(constraints.maxWidth, constraints.maxHeight);

          final pageController = pageControllerProvider(
            PageControllerParams(
              pageSize: pageSize,
              texts: data.pages.map((p) => p.content).toList()
            )
          );

          // Watch provider state and notifier directly
          final pageControllerState = ref.watch(pageController);
          final pageControllerNotifier = ref.read(pageController.notifier);

          return Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.yellowAccent.withValues(alpha: 0.2),
                  child: PageView.builder(
                    controller: pageControllerState.pageController,
                    itemCount: pageControllerState.pages.length,
                    onPageChanged: (index) {
                      pageControllerNotifier.changeSubPage(index);
                    },
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(pageControllerState.pages[index], style: pageControllerState.textStyle),
                    ),
                  ),
                ),
              ),
              _pageControls(pageControllerState),
            ],
          );
        },
      );
      },
      error: (error, _) {
        return Center(
          child: Text('${localizations.error}: ${error.toString()}'),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _pageControls(PageState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.first_page),
          onPressed: () => state.pageController.jumpToPage(0),
        ),
        IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () => state.pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
        ),
        Text('${state.currentSubPage + 1}/${state.pages.length}'),
        IconButton(
          icon: const Icon(Icons.navigate_next),
          onPressed: () => state.pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.last_page),
          onPressed: () => state.pageController.jumpToPage(state.pages.length - 1),
        ),
      ],
    );
  }
}
