import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverieflutter/data/model/diary.dart';
import 'package:reverieflutter/l10n/app_localizations.dart';
import 'package:reverieflutter/ui/components/content_text_field.dart';
import 'package:reverieflutter/ui/components/single_field.dart';
import 'package:reverieflutter/ui/screens/all_diaries_screen.dart';
import '../../notifier/edit_diary_notifier.dart';


class EditDiaryScreen extends ConsumerWidget {
  static const String editName = 'edit_diary';
  static const String editPath = '/edit/:diaryId';
  static const String editFullPath = AllDiariesScreen.path + editPath;
  static const String createName = 'create_diary';
  static const String createPath = '/create';
  static const String createFullPath = AllDiariesScreen.path + createPath;

  final String diaryId;
  final void Function(Diary) onComplete;

  const EditDiaryScreen({
    super.key,
    required this.diaryId,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editDiaryNotifierProvider(diaryId));
    final notifier = ref.read(editDiaryNotifierProvider(diaryId).notifier);
    final localizations = AppLocalizations.of(context)!;

    return state.when(
      data: (data) {
        final diary = data.diary;
        final allCoversList = data.allCoversList;

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    diary.id.isEmpty
                        ? localizations.createDiary
                        : localizations.editDiary,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                SingleLineFieldWithError(
                  value: diary.title,
                  errorMessage: data.titleError,
                  onNewValue: notifier.onTitleChange,
                  label: localizations.title,
                ),
                const SizedBox(height: 20),
                ContentTextFieldWithError(
                  value: diary.description,
                  errorMessage: data.descriptionError,
                  onNewValue: notifier.onDescriptionChange,
                  label: localizations.description,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: 1,
                    ),
                    itemCount: allCoversList.length,
                    itemBuilder: (context, index) {
                      final cover = allCoversList[index];
                      final isSelected = diary.coverId == cover.id;

                      return GestureDetector(
                        onTap: () => ref.read(editDiaryNotifierProvider(diaryId).notifier).updateCover(cover.id),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blue : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: DiaryCoverPreview(coverUrl: cover.url),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () => notifier.onSaveDiary(onComplete),
                  child: Text(localizations.save),
                ),
                const SizedBox(height: 12),
              ],
            ),
          )
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

class DiaryCoverPreview extends StatelessWidget {
  final String coverUrl;

  const DiaryCoverPreview({
    super.key,
    required this.coverUrl
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(coverUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
    );
  }
}