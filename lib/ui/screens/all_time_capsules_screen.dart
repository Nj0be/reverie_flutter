import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/time_capsule.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/notifier/all_time_capsules_notifier.dart';

class AllTimeCapsulesScreen extends ConsumerWidget {
  static const String name = 'all_time_capsules';
  static const String path = '/all_time_capsules';

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

    return state.when(
      data: (data) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final newTimeCapsule = await _onNavigateToCreateTimeCapsule();
                },
                child: Text("ciao")
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
