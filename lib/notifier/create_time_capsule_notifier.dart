import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/time_capsule.dart';
import 'package:reverie_flutter/data/model/user.dart';
import 'package:reverie_flutter/data/repository/time_capsule_repository.dart';
import 'package:reverie_flutter/data/repository/user_repository.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/l10n/localizations_provider.dart';
import 'package:reverie_flutter/storage_service.dart';

part 'create_time_capsule_notifier.freezed.dart';

@freezed
abstract class CreateTimeCapsuleState with _$CreateTimeCapsuleState {
  @override
  final TimeCapsule timeCapsule;

  CreateTimeCapsuleState._({TimeCapsule? timeCapsule})
      : timeCapsule = timeCapsule ?? TimeCapsule();

  factory CreateTimeCapsuleState({
    TimeCapsule? timeCapsule,
    @Default('') String titleError,
    @Default('') String contentError,
    @Default('') String deadlineError,
    @Default('') String phoneNumber,
    @Default('') String phoneNumberError,
    @Default('') String email,
    @Default('') String emailError,
    @Default('') String partialUsername,
    @Default('') String formError,
    @Default([]) List<User> matchingUsers,
    @Default([]) List<User> userReceivers,
  }) = _CreateTimeCapsuleState;
}

final createTimeCapsuleNotifierProvider = StateNotifierProvider<CreateTimeCapsuleNotifier, CreateTimeCapsuleState>((ref) {
  final repository = ref.read(timeCapsuleRepositoryProvider);
  final userRepository = ref.read(userRepositoryProvider);
  final auth = ref.read(firebaseAuthInstanceProvider);
  final localizations = ref.read(appLocalizationsProvider); // You’ll need to provide a BuildContext or localization provider

  return CreateTimeCapsuleNotifier(
    repository: repository,
    userRepository: userRepository,
    auth: auth,
    localizations: localizations,
  );
});

class CreateTimeCapsuleNotifier extends StateNotifier<CreateTimeCapsuleState> {
  final TimeCapsuleRepository _repository;
  final UserRepository _userRepository;
  final FirebaseAuth _auth;
  final AppLocalizations _localizations;  // For localization and resources

  CreateTimeCapsuleNotifier({
    required TimeCapsuleRepository repository,
    required UserRepository userRepository,
    required FirebaseAuth auth,
    required AppLocalizations localizations,
  }) : _repository = repository, _userRepository = userRepository, _auth = auth, _localizations = localizations, super(CreateTimeCapsuleState()) {
    _onStart();
  }

  void _onStart() {
    final userId = _auth.currentUser?.uid ?? '';
    state = CreateTimeCapsuleState(timeCapsule: TimeCapsule(userId: userId));
  }

  // Validation helpers
  String validateTitle(String title) {
    return title.trim().isEmpty ? _localizations.titleMandatory : '';
  }

  String validateContent(String content) {
    return content.trim().isEmpty ? _localizations.contentMandatory : '';
  }

  String validateDeadline(Timestamp deadline) {
    return deadline.toDate().isBefore(DateTime.now()) ? _localizations.deadlineMandatory : '';
  }

  String validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) return '';

    if (state.timeCapsule.phones.contains(phoneNumber)) {
      return 'Phone number already selected';
    }
    final regExp = RegExp(r'^\+?\d+$'); // Simplified check
    if (!regExp.hasMatch(phoneNumber)) {
      return 'Phone number is not valid';
    }
    return '';
  }

  String validateEmail(String email) {
    if (email.isEmpty) return '';

    if (state.timeCapsule.emails.contains(email)) {
      return 'Email already selected';
    }
    final regExp = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!regExp.hasMatch(email)) {
      return 'Email is not valid';
    }
    return '';
  }

  // State update functions:

  void updateTitle(String newTitle) {
    final titleTrimmed = newTitle.trim();
    if (titleTrimmed == state.timeCapsule.title) return;

    final error = validateTitle(titleTrimmed);

    state = state.copyWith(
      timeCapsule: state.timeCapsule.copyWith(title: titleTrimmed),
      titleError: error,
    );
  }

  void updateContent(String newContent) {
    final contentTrimmed = newContent.trim();
    if (contentTrimmed == state.timeCapsule.content) return;

    final error = validateContent(contentTrimmed);

    state = state.copyWith(
      timeCapsule: state.timeCapsule.copyWith(content: contentTrimmed),
      contentError: error,
    );
  }

  void updateDeadline(Timestamp newDeadline) {
    if (newDeadline.toDate().isBefore(DateTime.now())) return;

    final error = validateDeadline(newDeadline);

    state = state.copyWith(
      timeCapsule: state.timeCapsule.copyWith(deadline: newDeadline),
      deadlineError: error,
    );
  }

  void updatePhoneNumber(String newPhoneNumber) {
    final regex = RegExp(r'(?<=^)[^+\d]|(?!^)[^0-9]');
    final stripped = newPhoneNumber.trim().replaceAll(regex, '');

    if (stripped == state.phoneNumber) return;

    final error = validatePhoneNumber(stripped);

    state = state.copyWith(
      phoneNumber: stripped,
      phoneNumberError: error,
    );
  }

  void updateEmail(String newEmail) {
    final emailTrimmed = newEmail.trim();
    if (emailTrimmed == state.email) return;

    final error = validateEmail(emailTrimmed);

    state = state.copyWith(
      email: emailTrimmed,
      emailError: error,
    );
  }

  void addUser(User user) {
    if (state.userReceivers.contains(user)) {
      return;
    }

    final updatedReceiverIds = List<String>.from(state.timeCapsule.receiversIds)
      ..add(user.id);

    final updatedUsers = List<User>.from(state.userReceivers)..add(user);

    final updatedTimeCapsule = state.timeCapsule.copyWith(receiversIds: updatedReceiverIds);

    state = state.copyWith(
      timeCapsule: updatedTimeCapsule,
      userReceivers: updatedUsers,
    );
  }

  void removeUser(User user) {
    final updatedReceiverIds = List<String>.from(state.timeCapsule.receiversIds)
      ..remove(user.id);

    final updatedUsers = List<User>.from(state.userReceivers)..remove(user);

    final updatedTimeCapsule = state.timeCapsule.copyWith(receiversIds: updatedReceiverIds);

    state = state.copyWith(
      timeCapsule: updatedTimeCapsule,
      userReceivers: updatedUsers,
    );
  }

  void addPhoneNumber() {
    if (state.timeCapsule.phones.contains(state.phoneNumber)) {
      return;
    }

    final updatedPhones = List<String>.from(state.timeCapsule.phones)
      ..add(state.phoneNumber);

    final updatedTimeCapsule = state.timeCapsule.copyWith(phones: updatedPhones);

    state = state.copyWith(timeCapsule: updatedTimeCapsule);
  }

  void removePhoneNumber(String phoneNumber) {
    final updatedPhones = List<String>.from(state.timeCapsule.phones)
      ..remove(phoneNumber);

    final updatedTimeCapsule = state.timeCapsule.copyWith(phones: updatedPhones);

    state = state.copyWith(timeCapsule: updatedTimeCapsule);
  }

  void addEmail() {
    if (state.timeCapsule.emails.contains(state.email)) {
      return;
    }

    final updatedEmails = List<String>.from(state.timeCapsule.emails)
      ..add(state.email);

    final updatedTimeCapsule = state.timeCapsule.copyWith(emails: updatedEmails);

    state = state.copyWith(timeCapsule: updatedTimeCapsule);
  }

  void removeEmail(String email) {
    final updatedEmails = List<String>.from(state.timeCapsule.emails)
      ..remove(email);

    final updatedTimeCapsule = state.timeCapsule.copyWith(emails: updatedEmails);

    state = state.copyWith(timeCapsule: updatedTimeCapsule);
  }

  CancelableOperation? _usernameCheckJob;

  // Async search for users matching partial username
  Future<void> updatePartialUsername(String partialUsername) async {
    final trimmed = partialUsername.trim();
    if (trimmed == state.partialUsername) return;

    // Cancel previous job if exists
    _usernameCheckJob?.cancel();

    state = state.copyWith(partialUsername: trimmed, matchingUsers: []);

    if (trimmed.isEmpty) return;

    _usernameCheckJob = CancelableOperation.fromFuture(
      (() async {
        final users = await _userRepository.getUsersMatchingPartialUsername(trimmed);
        state = state.copyWith(matchingUsers: users);
      })(),
    );
  }

  void createTimeCapsule(void Function(TimeCapsule) onComplete) async {
    // Validate fields
    state = state.copyWith(
      titleError: validateTitle(state.timeCapsule.title),
      contentError: validateContent(state.timeCapsule.content),
      deadlineError: validateDeadline(state.timeCapsule.deadline),
      formError: ''
    );

    if (state.timeCapsule.emails.isEmpty && state.timeCapsule.phones.isEmpty && state.timeCapsule.receiversIds.isEmpty) {
      state = state.copyWith(formError: _localizations.receiverMandatory);
    }

    if (state.titleError.isNotEmpty || state.contentError.isNotEmpty || state.deadlineError.isNotEmpty || state.formError.isNotEmpty) {
      return;
    }

    try {
      final savedCapsule = await _repository.saveTimeCapsule(state.timeCapsule);
      state = state.copyWith(timeCapsule: savedCapsule);

      onComplete(savedCapsule);
    } catch (e) {
      state = state.copyWith(formError: e.toString());
    }
  }
}
