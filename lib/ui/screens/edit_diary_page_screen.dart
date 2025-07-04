import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/diary_page.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/notifier/edit_diary_page_notifier.dart';
import 'package:reverie_flutter/ui/components/content_text_field.dart';
import 'package:reverie_flutter/ui/screens/all_diaries_screen.dart';


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
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(localizations.editDiaryPageMessage, style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                ContentTextField(
                  value: page.content,
                  onNewValue: notifier.onUpdateContent,
                  label: localizations.content,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => notifier.onUpdatePage(onComplete),
                  child: Text(localizations.save),
                ),
                const SizedBox(height: 12),
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
