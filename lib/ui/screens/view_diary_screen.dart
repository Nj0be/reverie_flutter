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
    final state = ref.watch(pageControllerProvider);
    final textStyle = ref.read(pageControllerProvider.notifier).textStyle;
    final pageControllerNotifier = ref.read(pageControllerProvider.notifier);

    return asyncState.when(
      data: (data) {

      return LayoutBuilder(
        builder: (context, constraints) {
          final size = Size(constraints.maxWidth, constraints.maxHeight);

          WidgetsBinding.instance.addPostFrameCallback((_) {
            final notifier = ref.read(pageControllerProvider.notifier);
            notifier.updatePageSize(size);
            notifier.paginate(data.pages.first.content);
          });

          return Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.yellowAccent.withValues(alpha: 0.2),
                  child: PageView.builder(
                    controller: state.pageController,
                    itemCount: state.pages.length,
                    onPageChanged: (index) {
                      pageControllerNotifier.changePage(index);
                    },
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(state.pages[index], style: textStyle),
                    ),
                  ),
                ),
              ),
              _pageControls(state),
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
        Text('${state.currentPage + 1}/${state.pages.length}'),
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
