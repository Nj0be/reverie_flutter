import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/diary.dart';
import 'package:reverie_flutter/data/model/diary_cover.dart';
import 'package:reverie_flutter/data/model/diary_image.dart';
import 'package:reverie_flutter/data/model/diary_page.dart';
import 'package:reverie_flutter/data/model/diary_sub_page.dart';
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
  final String pagesCollection = 'pages';
  final String subPagesCollection = 'subPages';
  final String diaryCoversCollection = 'diaryCovers';
  final String usernamesCollection = 'usernames';
  final String emailsCollection = 'emails';
  final String diaryImagesCollection = 'diaryImages';
  final String timeCapsulesCollection = "timeCapsules";

  final String diaryImagesBucket = 'diary-images';

  final String usernameField = 'username';

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
        final usernameRef = _firestore.collection(usernamesCollection).doc(user.username);

        final usernameSnapshot = await transaction.get(usernameRef);
        if (usernameSnapshot.exists) {
          throw Exception(_localizations.usernameAlreadyTaken);
        }

        final oldUsernameRef = _firestore.collection(usernamesCollection).doc(oldUser.username);
        transaction.delete(oldUsernameRef);

        transaction.set(usernameRef, {'uid': user.id});
      }

      transaction.set(userRef, user.toJson());
    });
  }

  Future<List<User>> getUsersMatchingPartialUsername(String partialUsername) async {
    final end = '$partialUsername\uf8ff'; // Unicode to limit results

    final querySnapshot = await FirebaseFirestore.instance
        .collection(usersCollection) // Replace USERS_COLLECTION if needed
        .where(usernameField, isGreaterThanOrEqualTo: partialUsername)
        .where(usernameField, isLessThan: end)
        .get();

    return querySnapshot.docs.map((doc) {
      return User.fromFirestore(doc);
    }).toList();
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

  Future<DiaryCover?> getDiaryCover(String diaryCoverId) async {
    final doc = await FirebaseFirestore.instance.collection(diaryCoversCollection).doc(diaryCoverId).get();
    if (!doc.exists) return null;
    return DiaryCover.fromFirestore(doc);
  }

  Future<Diary?> getDiary(String diaryId) async {
    final doc = await _firestore.collection(diariesCollection).doc(diaryId).get();
    if (!doc.exists) return null;
    return Diary.fromFirestore(doc);
  }

  Future<Diary> saveDiary(Diary diary) async {
    final docRef = await _firestore.collection(diariesCollection).add(diary.toJson());
    return diary.copyWith(id: docRef.id);
  }

  Future<void> updateDiary(Diary diary) async {
    await _firestore.collection(diariesCollection).doc(diary.id).set(diary.toJson());
  }

  Future<void> deleteDiary(Diary diary) async {
    await _firestore.collection(diariesCollection).doc(diary.id).delete();

    final userRef = FirebaseFirestore.instance.collection(usersCollection).doc(diary.uid);
    await userRef.update({
      'diaryIds': FieldValue.arrayRemove([diary.id]),
    });
  }

  Future<DiaryPage?> getPage(String pageId) async {
    final doc = await _firestore.collection(pagesCollection).doc(pageId).get();
    if (!doc.exists) return null;
    return DiaryPage.fromFirestore(doc);
  }

  Future<DiaryPage> savePage(DiaryPage page) async {
    final docRef = await _firestore.collection(pagesCollection).add(page.toJson());
    return page.copyWith(id: docRef.id);
  }

  Future<void> updatePage(DiaryPage page) async {
    await _firestore.collection(pagesCollection).doc(page.id).set(page.toJson());
  }

  Future<void> deletePage(DiaryPage page) async {
    await _firestore.collection(pagesCollection).doc(page.id).delete();

    final userRef = FirebaseFirestore.instance.collection(diariesCollection).doc(page.diaryId);
    await userRef.update({
      'pageIds': FieldValue.arrayRemove([page.id]),
    });
  }

  Future<DiarySubPage?> getSubPage(String subPageId) async {
    final doc = await _firestore.collection(subPagesCollection).doc(subPageId).get();
    if (!doc.exists) return null;
    return DiarySubPage.fromFirestore(doc);
  }

  Future<DiarySubPage> saveSubPage(DiarySubPage subPage) async {
    final docRef = await _firestore.collection(subPagesCollection).add(subPage.toJson());
    return subPage.copyWith(id: docRef.id);
  }

  Future<void> updateSubPage(DiarySubPage subPage) async {
    await _firestore.collection(subPagesCollection).doc(subPage.id).set(subPage.toJson());
  }

  Future<void> deleteSubPage(DiarySubPage subPage) async {
    await _firestore.collection(subPagesCollection).doc(subPage.id).delete();

    final pageRef = FirebaseFirestore.instance.collection(pagesCollection).doc(subPage.pageId);
    await pageRef.update({
      'subPageIds': FieldValue.arrayRemove([subPage.id]),
    });
  }

  Future<DiaryImage?> getDiaryImage(String diaryImageId) async {
    final doc = await _firestore.collection(diaryImagesCollection).doc(diaryImageId).get();
    if (!doc.exists) return null;
    return DiaryImage.fromFirestore(doc);
  }

  Future<void> deleteDiaryImage(DiaryImage diaryImage) async {
    await _firestore.collection(diaryImagesCollection).doc(diaryImage.id).delete();

    final subPageRef = FirebaseFirestore.instance.collection(subPagesCollection).doc(diaryImage.subPageId);
    await subPageRef.update({
      'imageIds': FieldValue.arrayRemove([diaryImage.id]),
    });
  }

  Future<List<DiaryCover>> getAllDiaryCovers() async {
    final querySnapshot = await _firestore.collection(diaryCoversCollection).get();

    return querySnapshot.docs.map((doc) {
      return DiaryCover.fromFirestore(doc);
    }).toList();
  }

  Future<TimeCapsule> saveTimeCapsule(TimeCapsule timeCapsule) async {
    final docRef = await _firestore.collection(timeCapsulesCollection).add(timeCapsule.toJson());
    return timeCapsule.copyWith(id: docRef.id);
  }

  Future<void> deleteTimeCapsule(TimeCapsule timeCapsule) async {
    await _firestore.collection(timeCapsulesCollection).doc(timeCapsule.id).delete();

    final senderRef = _firestore.collection(usersCollection).doc(timeCapsule.userId);
    await senderRef.update({
      'sentTimeCapsuleIds': FieldValue.arrayRemove([timeCapsule.id]),
    });

    for (final receiverId in timeCapsule.receiversIds) {
      final receiverRef = _firestore.collection(usersCollection).doc(receiverId);
      await receiverRef.update({
        'receivedTimeCapsuleIds': FieldValue.arrayRemove([timeCapsule.id]),
      });
    }
  }
}
