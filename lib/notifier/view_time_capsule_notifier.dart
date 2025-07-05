import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverieflutter/data/model/time_capsule.dart';
import 'package:reverieflutter/data/model/username.dart';
import 'package:reverieflutter/data/repository/time_capsule_repository.dart';
import 'package:reverieflutter/data/repository/user_repository.dart';
import 'package:reverieflutter/notifier/all_time_capsules_notifier.dart';

part 'view_time_capsule_notifier.freezed.dart';

@freezed
abstract class ViewTimeCapsuleState with _$ViewTimeCapsuleState {
  @override
  final TimeCapsule timeCapsule;

  ViewTimeCapsuleState._({TimeCapsule? timeCapsule})
      : timeCapsule = timeCapsule ?? TimeCapsule();

  factory ViewTimeCapsuleState({
    TimeCapsule? timeCapsule,
    @Default(TimeCapsuleType.scheduled) TimeCapsuleType timeCapsuleType,
    @Default([]) List<Username> receiversUsername,
  }) = _ViewTimeCapsuleState;
}

@freezed
abstract class ViewTimeCapsuleParams with _$ViewTimeCapsuleParams{
  factory ViewTimeCapsuleParams({
    @Default('') String timeCapsuleId,
    @Default(TimeCapsuleType.scheduled) TimeCapsuleType timeCapsuleType,
  }) = _ViewTimeCapsuleParams;
}

final viewTimeCapsuleNotifierProvider = StateNotifierProvider.family<ViewTimeCapsuleNotifier, AsyncValue<ViewTimeCapsuleState>, ViewTimeCapsuleParams>((ref, params) {
  final repository = ref.read(timeCapsuleRepositoryProvider);
  final userRepository = ref.read(userRepositoryProvider);

  return ViewTimeCapsuleNotifier(
    repository: repository,
    userRepository: userRepository,
    timeCapsuleId: params.timeCapsuleId,
    timeCapsuleType: params.timeCapsuleType,
  );
});

class ViewTimeCapsuleNotifier extends StateNotifier<AsyncValue<ViewTimeCapsuleState>> {
  final TimeCapsuleRepository _repository;
  final UserRepository _userRepository;

  ViewTimeCapsuleNotifier({
    required TimeCapsuleRepository repository,
    required UserRepository userRepository,
    required String timeCapsuleId,
    required TimeCapsuleType timeCapsuleType
  }) : _repository = repository, _userRepository = userRepository, super(AsyncLoading()) {
    _onStart(timeCapsuleId, timeCapsuleType);
  }

  Future<void> _onStart(String timeCapsuleId, TimeCapsuleType timeCapsuleType) async {
    final timeCapsule = await _repository.getTimeCapsule(timeCapsuleId);

    // Fetch all users in parallel
    final receiverUsers = await Future.wait(timeCapsule.receiversIds.map((receiverId) async {
      final user = await _userRepository.getUser(receiverId);
      return Username(username: user.username, uid: receiverId);
    }));

    state = AsyncValue.data(ViewTimeCapsuleState(timeCapsule: timeCapsule, timeCapsuleType: timeCapsuleType, receiversUsername: receiverUsers));
  }
}