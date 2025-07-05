import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:reverie_flutter/data/model/time_capsule.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/notifier/all_time_capsules_notifier.dart';
import 'package:reverie_flutter/ui/components/button_bar_widget.dart';
import 'package:reverie_flutter/ui/themes/colors.dart';

class AllTimeCapsulesScreen extends ConsumerWidget {
  static const String name = 'all_time_capsules';
  static const String path = '/time_capsules';

  final Future<TimeCapsule?> Function() _onNavigateToCreateTimeCapsule;
  final void Function(String, TimeCapsuleType) _onNavigateToViewTimeCapsule;

  const AllTimeCapsulesScreen({
    super.key,
    required Future<TimeCapsule?> Function() onNavigateToCreateTimeCapsule,
    required void Function(String, TimeCapsuleType) onNavigateToViewTimeCapsule,
  }) : _onNavigateToCreateTimeCapsule = onNavigateToCreateTimeCapsule,
       _onNavigateToViewTimeCapsule = onNavigateToViewTimeCapsule;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(allTimeCapsulesNotifierProvider);
    final notifier = ref.read(allTimeCapsulesNotifierProvider.notifier);
    final localizations = AppLocalizations.of(context)!;

    ref.listen<AsyncValue<AllTimeCapsulesState>>(allTimeCapsulesNotifierProvider, (prev, next) {
      final capsuleId = next.valueOrNull?.deleteDialogCapsuleId;

      if (capsuleId != null && capsuleId.isNotEmpty) {
        Future.microtask(() {
          showConfirmDeleteDialog(
            context: context,
            title: localizations.confirmDiaryDeletion,
            content: '',
            onDismiss: () => notifier.onCloseDeleteTimeCapsuleDialog(),
            onDelete: () => notifier.onDeleteTimeCapsule(),
          );
        });
      }
    });

    return state.when(
      data: (data) {
        final capsules = switch (data.buttonState) {
          TimeCapsuleType.scheduled => data.timeCapsuleScheduled,
          TimeCapsuleType.sent => data.timeCapsuleSent,
          TimeCapsuleType.received => data.timeCapsuleReceived,
        };

        return Scaffold(
          floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
              child: FloatingActionButton(
              onPressed: () async {
                final newCapsule = await _onNavigateToCreateTimeCapsule();
                notifier.addNewTimeCapsule(newCapsule);
              },
              child: Icon(Icons.add),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          body: SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16),
                  child: Card(
                    elevation: 8,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.0),
                          child: Image(
                            image: NetworkImage(
                                'https://wjecfnvsxxnvgheqdnpx.supabase.co/storage/v1/object/sign/time-capsules/letter.png?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV8xNTIwYmQ5Yy05ZTUxLTQ5MjMtODRmMy1kNzFiNTRkNTNjZjUiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJ0aW1lLWNhcHN1bGVzL2xldHRlci5wbmciLCJpYXQiOjE3NTA3NTc1MDQsImV4cCI6MTc4MjI5MzUwNH0.RTnD7Gu7q2mF6MlXhHmZXgn-xN4QJ3CVxUt4xf48s98'
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              Text(
                                localizations.letterForTheFuture,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                localizations.letterForTheFutureDescription,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
                ButtonBarWidget(
                  buttonState: data.buttonState,
                  buttonElements: data.buttonElements,
                  onButtonStateUpdate: notifier.onButtonStateUpdate,
                ),
                ...capsules.map((capsule) {
                  return Column(
                    children: [
                      TimeCapsuleCard(
                        timeCapsule: capsule,
                        timeCapsuleType: data.buttonState,
                        onClick: _onNavigateToViewTimeCapsule,
                        onOpenDeleteTimeCapsuleDialog: () => notifier.onOpenDeleteTimeCapsuleDialog(capsule.id),
                      ),
                      const Divider(),
                    ],
                  );
                }),
              ],
            ),
          ),
        );
      },
      error: (error, _) {
        return Center(
          child: Text(
            '${AppLocalizations.of(context)!.error}: ${error.toString()}',
          ),
        );
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<void> showConfirmDeleteDialog({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onDelete,
    required VoidCallback onDismiss,
  }) {
    final l10n = AppLocalizations.of(context)!;

    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // necessary to close the alertDialog
                Navigator.of(context).pop();
                onDismiss();
              },
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                onDelete(); // Trigger delete logic
              },
              child: Text(
                l10n.delete,
                style: TextStyle(color: AppColors.error),
              ),
            ),
          ],
        );
      },
    );
  }
}

class TimeCapsuleCard extends StatelessWidget {
  final TimeCapsule timeCapsule;
  final TimeCapsuleType timeCapsuleType;
  final void Function(String, TimeCapsuleType) onClick;
  final VoidCallback? onOpenDeleteTimeCapsuleDialog;

  const TimeCapsuleCard({
    super.key,
    required this.timeCapsule,
    required this.timeCapsuleType,
    required this.onClick,
    this.onOpenDeleteTimeCapsuleDialog,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final receiversCount = (timeCapsule.emails + timeCapsule.phones + timeCapsule.receiversIds).length;

    String formatDate(DateTime date) {
      return DateFormat.yMMMd().format(date);
    }

    return InkWell(
      onTap: () => onClick(timeCapsule.id, timeCapsuleType),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Image.network(
                  'https://wjecfnvsxxnvgheqdnpx.supabase.co/storage/v1/object/sign/time-capsules/letter.png?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV8xNTIwYmQ5Yy05ZTUxLTQ5MjMtODRmMy1kNzFiNTRkNTNjZjUiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJ0aW1lLWNhcHN1bGVzL2xldHRlci5wbmciLCJpYXQiOjE3NTA3NTc1MDQsImV4cCI6MTc4MjI5MzUwNH0.RTnD7Gu7q2mF6MlXhHmZXgn-xN4QJ3CVxUt4xf48s98',
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error); // fallback in caso di errore
                  },
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    timeCapsule.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$receiversCount ${receiversCount == 1 ? l10n.receiver : l10n.receivers}',
                  ),
                  Text(
                    '${l10n.createdOn} ${formatDate(timeCapsule.creationDate.toDate())}',
                  ),
                  Text(
                    '${timeCapsuleType == TimeCapsuleType.scheduled ? l10n.arrivingOn : l10n.arrivedOn} ${formatDate(timeCapsule.deadline.toDate())}',
                  ),
                ],
              ),
            ),
            if (timeCapsuleType == TimeCapsuleType.scheduled && onOpenDeleteTimeCapsuleDialog != null)
              IconButton(
                icon: const Icon(Icons.delete_outline),
                color: AppColors.primary,
                onPressed: onOpenDeleteTimeCapsuleDialog,
              ),
          ],
        ),
      ),
    );
  }
}