import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/notifier/all_time_capsules_notifier.dart';
import 'package:reverie_flutter/notifier/view_time_capsule_notifier.dart';
import 'package:reverie_flutter/utils.dart';

class ViewTimeCapsuleScreen extends ConsumerWidget {
  static const String name = 'view_time_capsule';
  static const String path = '/view_time_capsule/:id/:type';

  final ViewTimeCapsuleParams viewTimeCapsuleParams;
  final void Function(String) onViewProfile;

  const ViewTimeCapsuleScreen({
    super.key,
    required this.viewTimeCapsuleParams,
    required this.onViewProfile
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final state = ref.watch(
      viewTimeCapsuleNotifierProvider(viewTimeCapsuleParams),
    );

    return state.when(
      data: (data) {
        final timeCapsule = data.timeCapsule;
        final timeCapsuleType = data.timeCapsuleType;
        final receiversUsername = data.receiversUsername;

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Title
              Text(
                timeCapsule.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),

              const SizedBox(height: 50),

              /// Content
              if (timeCapsuleType != TimeCapsuleType.scheduled) ...[
                Text(
                  '${localizations.letterContent}:',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(timeCapsule.content, textAlign: TextAlign.justify),
              ] else ...[
                Text(
                  '${localizations.contentNotAvailable}.',
                  textAlign: TextAlign.center,
                ),
              ],

              const SizedBox(height: 50),

              /// Sender
              Text(
                '${localizations.sender}:',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(timeCapsule.userId),

              /// Receivers
              if (timeCapsuleType != TimeCapsuleType.received) ...[
                const SizedBox(height: 50),
                Text(
                  (timeCapsule.phones.length +
                              timeCapsule.emails.length +
                              timeCapsule.receiversIds.length) ==
                          1
                      ? '${localizations.receiver}:'
                      : '${localizations.receivers}:',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                ...timeCapsule.phones.map((phone) => Text(phone)),
                ...timeCapsule.emails.map((email) => Text(email)),
                ...receiversUsername.map(
                  (receiver) => InkWell(
                    onTap: () => onViewProfile(receiver.uid),
                    child: Text(
                      receiver.username,
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 50),

              /// Dates
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '${localizations.creationDate}:',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            formatDate(timeCapsule.creationDate.toDate()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '${localizations.arrivalDate}:',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            formatDate(timeCapsule.deadline.toDate()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
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
}
