import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverieflutter/data/model/diary.dart';
import 'package:reverieflutter/l10n/app_localizations.dart';
import 'package:reverieflutter/utils.dart';
import '../../notifier/all_diaries_notifier.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class AllDiariesScreen extends ConsumerWidget {
  static const String name = 'all_diaries';
  static const String path = '/diaries';

  final String profileId;
  final void Function(String) onNavigateToDiary;
  final Future<Diary?> Function(String) onNavigateToEditDiary;
  final Future<Diary?> Function() onNavigateToCreateDiary;

  const AllDiariesScreen({
    super.key,
    required this.profileId,
    required this.onNavigateToDiary,
    required this.onNavigateToCreateDiary,
    required this.onNavigateToEditDiary,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(allDiariesNotifierProvider(profileId));
    final notifier = ref.read(allDiariesNotifierProvider(profileId).notifier);

    // Gestione dialog tramite listener
    ref.listen<AsyncValue<AllDiariesState>>(allDiariesNotifierProvider(profileId), (previous, next) {
      next.whenData((data) {
        if (data.deleteDialogState) {
          final currentDiaryId = data.diaries[data.currentIndex].id;

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(AppLocalizations.of(context)!.confirmDiaryDeletion),
              content: Text(AppLocalizations.of(context)!.deleteDiary),
              actions: [
                TextButton(
                  onPressed: () {
                    notifier.closeDeleteDialog();
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.cancel),
                ),
                TextButton(
                  onPressed: () {
                    notifier.deleteDiary(currentDiaryId);
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.delete),
                ),
              ],
            ),
          );
        }
      });
    });

    final localizations = AppLocalizations.of(context)!;

    return state.when(
      data: (data) {
        final diaries = data.diaries;
        final diaryCoversMap = data.diaryCoversMap;
        final currentIndex = data.currentIndex;
        final controller = data.pageController;

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final updatedDiary = await onNavigateToCreateDiary();
              notifier.overwriteDiary(updatedDiary);
            },
            child: const Icon(Icons.add),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: data.diaries.isEmpty
              ? [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.createFirstDiary,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                )
              ]
              : [
              Flexible(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: notifier.onChangeIndex,
                  itemCount: diaries.length,
                  itemBuilder: (context, index) {
                    final diary = diaries[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      child: GestureDetector(
                        onTap: () => onNavigateToDiary(diary.id), // Naviga a visualizza diario
                        child: Card(
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DiaryCoverWidget(imageUrl: diaryCoversMap[diary.coverId]!.url),
                                Text(
                                  diary.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                if (diary.description.isNotEmpty)
                                  Text(
                                    diary.description,
                                    textAlign: TextAlign.center,
                                  ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () async {
                                        final updatedDiary = await onNavigateToEditDiary(diary.id);
                                        notifier.overwriteDiary(updatedDiary);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete_outline),
                                      onPressed: () {
                                        notifier.openDeleteDialog();
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
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
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "${localizations.generalInfo}:",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "${localizations.creationDate}:",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(formatDate(diaries[currentIndex].creationDate.toDate())),
                    const SizedBox(height: 16),
                    Text(
                      "${localizations.pageNumber}:",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(diaries[currentIndex].pageIds.length.toString()),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      error: (error, _) => Center(
        child: Text(
          '${AppLocalizations.of(context)!.errorMessage}: $error',
          style: const TextStyle(color: Colors.red),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
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
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16),
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
