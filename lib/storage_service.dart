import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/diary.dart';
import 'package:reverie_flutter/data/model/time_capsule.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/l10n/localizations_provider.dart';
import 'dart:async';

import 'data/model/user.dart';


final firestoreInstanceProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final firebaseAuthInstanceProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final storageServiceProvider = Provider<StorageService>((ref) {
  final firestore = ref.read(firestoreInstanceProvider);
  final localizations = ref.read(appLocalizationsProvider);

  return StorageService(firestore: firestore, localizations: localizations);
});

class StorageService {
  StorageService({
    required FirebaseFirestore firestore,
    required AppLocalizations localizations,
  })
      : _firestore = firestore,
        _localizations = localizations;

  late final FirebaseFirestore _firestore;
  late final AppLocalizations _localizations;


  final String usersCollection = 'users';
  final String diariesCollection = 'diaries';
  final String usernamesCollection = 'usernames';
  final String emailsCollection = 'emails';
  final String diaryImagesBucket = 'diaryImages';
  final String timeCapsulesCollection = "timeCapsules";

  Future<User?> getUser(String userId) async {
    final doc = await _firestore.collection(usersCollection).doc(userId).get();
    if (!doc.exists) return null;
    return User.fromFirestore(doc);
  }

  Future<User?> saveUser(User user) async {
    final firestore = FirebaseFirestore.instance;

    try {
      final userRef = firestore.collection(usersCollection).doc();
      final userWithId = user.copyWith(id: userRef.id);

      await firestore.runTransaction((transaction) async {
        final usernameRef = firestore.collection(usernamesCollection).doc(userWithId.username);
        final emailRef = firestore.collection(emailsCollection).doc(userWithId.email);

        final usernameSnapshot = await transaction.get(usernameRef);
        if (usernameSnapshot.exists) {
          throw Exception(_localizations.usernameAlreadyTaken);
        }

        final emailSnapshot = await transaction.get(emailRef);
        if (emailSnapshot.exists) {
          throw Exception(_localizations.emailAlreadyTaken);
        }

        transaction.set(usernameRef, {'uid': userRef.id});
        transaction.set(emailRef, {'uid': userRef.id});
        transaction.set(userRef, userWithId.toJson());
      });

      return userWithId;
    } catch (e) {
      return null;
    }
  }

  Future<void> updateUser(User user) async {

    final userRef = _firestore.collection(usersCollection).doc(user.id);

    await _firestore.runTransaction((transaction) async {
      final oldUserSnapshot = await transaction.get(userRef);
      final oldUser = oldUserSnapshot.exists ? User.fromFirestore(oldUserSnapshot) : null;

      if (oldUser != null && user.username != oldUser.username) {
        final usernameRef = _firestore.collection(usersCollection).doc(user.username);

        final usernameSnapshot = await transaction.get(usernameRef);
        if (usernameSnapshot.exists) {
          throw Exception(_localizations.usernameAlreadyTaken);
        }

        final oldUsernameRef = _firestore.collection(usersCollection).doc(oldUser.username);
        transaction.delete(oldUsernameRef);

        transaction.set(usernameRef, {'uid': user.id});
      }

      transaction.set(userRef, user.toJson());
    });
  }

  Future<Diary?> getDiary(String diaryId) async {
    final doc = await _firestore.collection(diariesCollection).doc(diaryId).get();
    if (!doc.exists) return null;
    return Diary.fromFirestore(doc);
  }

  Future<bool> isUsernameTaken(String username) async {
    final docSnapshot = await _firestore.collection(usernamesCollection).doc(username).get();
    return docSnapshot.data() != null;
  }

  Future<bool> isEmailTaken(String email) async {
    final docSnapshot = await _firestore.collection(emailsCollection).doc(email).get();
    return docSnapshot.data() != null;
  }

  Future<TimeCapsule?> getTimeCapsule(String timeCapsuleId) async {
    final doc = await _firestore.collection(timeCapsulesCollection).doc(timeCapsuleId).get();
    if (!doc.exists) return null;
    return TimeCapsule.fromFirestore(doc);
  }

  Future<TimeCapsule> saveTimeCapsule(TimeCapsule timeCapsule) async {
    final docRef = await _firestore.collection(timeCapsulesCollection).add(timeCapsule.toJson());
    return timeCapsule.copyWith(id: docRef.id);
  }

  Future<void> deleteTimeCapsule(String timeCapsuleId) async {
    await _firestore.collection(timeCapsulesCollection).doc(timeCapsuleId).delete();
  }
}
