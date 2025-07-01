import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/diary.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/ui/screens/edit_profile_screen.dart';
import '../../notifier/all_diaries_notifier.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class AllDiariesScreen extends ConsumerWidget {
  static const String name = 'all_diaries';
  static const String path = '/';

  final Diary? updatedDiary;
  // List<DiaryImage>? updatedImages;
  final void Function(String) onNavigateToDiary;
  final void Function(String) onNavigateToEditDiary;
  final void Function() onNavigateToCreateDiary;

  const AllDiariesScreen({
    super.key,
    required this.updatedDiary,
    required this.onNavigateToDiary,
    required this.onNavigateToCreateDiary,
    required this.onNavigateToEditDiary
  });

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final state = ref.watch(allDiariesNotifierProvider);

    return state.when(
      data: (data) {
        final diaries = data.diaries;
        // final currentPage = data.currentPage;
        // final currentDiary = diaries[currentPage];
        final diaryCoversMap = data.diaryCoversMap;
        PageController controller = PageController();

        return Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                // Horizontal Pager
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: diaries.length,
                    itemBuilder: (context, index) {
                      final diary = diaries[index];
                      return GestureDetector(
                        onTap: () => {}, // onNavigateToDiary(diary.id),
                        child: Card(
                          elevation: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DiaryCoverWidget(imageUrl: diaryCoversMap[diary.coverId]!.url),
                              Text(diary.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                              if (diary.description.isNotEmpty)
                                Text(diary.description),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () => {} // onNavigateToEditDiary(diary.id),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline),
                                    onPressed: () => {} // viewModel.openDeleteDialog(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Page Indicator
                SmoothPageIndicator(
                  controller: controller,
                  count: diaries.length,
                  effect: const WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Colors.black,
                    dotColor: Colors.black26,
                  ),
                ),
              ],
            )
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Vai a crea diario
            },
            child: const Icon(Icons.add),
          ),

        );
      },
      error: (error, _) {
        return Center(
          child: Text
            (
            '${AppLocalizations.of(context)!.errorMessage}: $error',
            style: const TextStyle(color: Colors.red),
          ),
        );
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class DiaryCoverWidget extends StatelessWidget {
  final String imageUrl;

  const DiaryCoverWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}