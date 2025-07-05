import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverieflutter/data/model/diary_page.dart';
import 'package:reverieflutter/l10n/app_localizations.dart';
import 'package:reverieflutter/notifier/edit_diary_page_notifier.dart';
import 'package:reverieflutter/ui/components/content_text_field.dart';
import 'package:reverieflutter/ui/screens/all_diaries_screen.dart';


class EditDiaryPageScreen extends ConsumerWidget {
  static const String name = 'edit_diary_page';
  static const String path = '/edit/:pageId';
  static const String fullPath = AllDiariesScreen.path + path;

  final String pageId;
  final void Function(DiaryPage) onComplete;

  const EditDiaryPageScreen({
    super.key,
    required this.pageId,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editDiaryPageNotifierProvider(pageId));
    final notifier = ref.read(editDiaryPageNotifierProvider(pageId).notifier);
    final localizations = AppLocalizations.of(context)!;

    return state.when(
      data: (data) {
        final page = data.page;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  localizations.editDiaryPageMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(vertical: 16),
                  child: ContentTextField(
                    value: page.content,
                    onNewValue: notifier.onUpdateContent,
                    label: localizations.content,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => notifier.onUpdatePage(onComplete),
                  child: Text(localizations.save),
                ),
              ],
            ),
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

class DiaryCoverPreview extends StatelessWidget {
  final String coverUrl;

  const DiaryCoverPreview({
    super.key,
    required this.coverUrl
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(coverUrl, fit: BoxFit.cover);
  }
}
