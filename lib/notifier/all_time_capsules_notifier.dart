import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reverie_flutter/data/model/time_capsule.dart';
import 'package:reverie_flutter/data/repository/time_capsule_repository.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/l10n/localizations_provider.dart';
import 'package:reverie_flutter/storage_service.dart';
import 'package:riverpod/riverpod.dart';

part 'all_time_capsules_notifier.freezed.dart';

enum TimeCapsuleType { scheduled, sent, received }

@freezed
abstract class AllTimeCapsulesState with _$AllTimeCapsulesState {
  const factory AllTimeCapsulesState({
    @protected @Default({}) Map<String, TimeCapsule> sentTimeCapsules,
    @protected @Default({}) Map<String, TimeCapsule> receivedTimeCapsules,
    @Default(TimeCapsuleType.scheduled) TimeCapsuleType buttonState,
    @Default("") String deleteDialogCapsuleId,
  }) = _AllTimeCapsulesState;

  const AllTimeCapsulesState._();

  Map<String, TimeCapsule> get timeCapsuleScheduledMap => Map.fromEntries(
    sentTimeCapsules.entries.where(
      (entry) => entry.value.deadline.toDate().isAfter(DateTime.now()),
    ),
  );

  List<TimeCapsule> get timeCapsuleScheduled =>
      timeCapsuleScheduledMap.values.toList()
        ..sort((a, b) => a.deadline.compareTo(b.deadline));

  Map<String, TimeCapsule> get timeCapsuleSentMap => Map.fromEntries(
    sentTimeCapsules.entries.where(
      (entry) => entry.value.deadline.toDate().isBefore(DateTime.now()),
    ),
  );

  List<TimeCapsule> get timeCapsuleSent =>
      timeCapsuleSentMap.values.toList()
        ..sort((a, b) => a.deadline.compareTo(b.deadline));

  Map<String, TimeCapsule> get timeCapsuleReceivedMap => Map.fromEntries(
    receivedTimeCapsules.entries.where(
      (entry) => entry.value.deadline.toDate().isBefore(DateTime.now()),
    ),
  );

  List<TimeCapsule> get timeCapsuleReceived =>
      timeCapsuleReceivedMap.values.toList()
        ..sort((a, b) => a.deadline.compareTo(b.deadline));

  List<TimeCapsuleType> get buttonElements => TimeCapsuleType.values;
}

final allTimeCapsulesNotifierProvider =
    StateNotifierProvider<
      AllTimeCapsulesNotifier,
      AsyncValue<AllTimeCapsulesState>
    >((ref) {
      final repository = ref.read(timeCapsuleRepositoryProvider);
      final auth = ref.read(firebaseAuthInstanceProvider);
      final localizations = ref.read(appLocalizationsProvider);

      return AllTimeCapsulesNotifier(repository: repository, auth: auth, localizations: localizations);
    });

class AllTimeCapsulesNotifier
    extends StateNotifier<AsyncValue<AllTimeCapsulesState>> {
  final TimeCapsuleRepository _repository;
  final FirebaseAuth _auth;
  final AppLocalizations _localizations;

  AllTimeCapsulesNotifier({
    required TimeCapsuleRepository repository,
    required FirebaseAuth auth,
    required AppLocalizations localizations,
  })
    : _auth = auth, _repository = repository,
        _localizations = localizations, super(const AsyncLoading()) {
    _loadTimeCapsules();
  }

  Future<void> _loadTimeCapsules() async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) {
      state = AsyncValue.error(_localizations.userNotSignedIn, StackTrace.current);
      return;
    }

    try {
      final sentTimeCapsules = await _repository.getUserSentTimeCapsules(
          userId);
      final receivedTimeCapsules = await _repository
          .getUserReceivedTimeCapsules(
        userId,
      );
      final sentTimeCapsulesMap = {
        for (var capsule in sentTimeCapsules) capsule.id: capsule,
      };
      final receivedTimeCapsulesMap = {
        for (var capsule in receivedTimeCapsules) capsule.id: capsule,
      };

      // Update UI state
      state = AsyncValue.data(
          AllTimeCapsulesState(
              sentTimeCapsules: sentTimeCapsulesMap,
              receivedTimeCapsules: receivedTimeCapsulesMap
          )
      );
    } catch(error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  Null onButtonStateUpdate(TimeCapsuleType newButtonState) {
    state = state.whenData((s) => s.copyWith(
      buttonState: newButtonState
    ));
  }

  void addNewTimeCapsule(TimeCapsule? newTimeCapsule) {
    final currentState = state.value;
    if (currentState == null || newTimeCapsule == null) return;

    final sentTimeCapsules = Map<String, TimeCapsule>.from(currentState.sentTimeCapsules);
    final receivedTimeCapsules = Map<String, TimeCapsule>.from(currentState.receivedTimeCapsules);

    sentTimeCapsules[newTimeCapsule.id] = newTimeCapsule;

    if (newTimeCapsule.receiversIds.contains(_auth.currentUser?.uid)) {
      receivedTimeCapsules[newTimeCapsule.id] = newTimeCapsule;
    }

    state = AsyncValue.data(
      currentState.copyWith(
        sentTimeCapsules: sentTimeCapsules,
        receivedTimeCapsules: receivedTimeCapsules,
      ),
    );
  }

  void _onUpdateDeleteTimeCapsuleDialog(String newTimeCapsuleId) {
    state = state.whenData((currentState) => currentState.copyWith(
      deleteDialogCapsuleId: newTimeCapsuleId,
    ));
  }

  void onCloseDeleteTimeCapsuleDialog() {
    _onUpdateDeleteTimeCapsuleDialog("");
  }

  void onOpenDeleteTimeCapsuleDialog(String timeCapsuleId) {
    _onUpdateDeleteTimeCapsuleDialog(timeCapsuleId);
  }

  Future<void> onDeleteTimeCapsule() async {
    final currentState = state.value;
    if (currentState == null || currentState.deleteDialogCapsuleId.isEmpty) return;

    final capsuleIdToDelete = currentState.deleteDialogCapsuleId;

    try {
      await _repository.deleteTimeCapsule(capsuleIdToDelete);

      final updatedSentTimeCapsules = Map<String, TimeCapsule>.from(currentState.sentTimeCapsules)
        ..remove(capsuleIdToDelete);

      state = AsyncValue.data(
        currentState.copyWith(
          sentTimeCapsules: updatedSentTimeCapsules,
          deleteDialogCapsuleId: "",
        ),
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
