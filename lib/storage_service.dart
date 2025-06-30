import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverie_flutter/data/model/diary.dart';
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
  return StorageService(firestore: firestore);
});

class StorageService {
  StorageService({required FirebaseFirestore firestore})
          : _firestore = firestore;

  late final FirebaseFirestore _firestore;


  final String usersCollection = 'users';
  final String diariesCollection = 'diaries';
  final String usernamesCollection = 'usernames';
  final String emailsCollection = 'emails';
  final String diaryImagesBucket = 'diary-images';

  Future<User?> getUser(String userId) async {
    final doc = await _firestore.collection(usersCollection).doc(userId).get();
    if (!doc.exists) return null;
    return User.fromFirestore(doc);
  }

  Future<Diary?> getDiary(String diaryId) async {
    final doc = await _firestore.collection(diariesCollection).doc(diaryId).get();
    if (!doc.exists) return null;
    return Diary.fromFirestore(doc);
  }

  Future<bool> isUsernameTaken(String username) async {
    final docSnapshot = await _firestore.collection(emailsCollection).doc(username).get();
    return docSnapshot.data() != null;
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
          throw Exception('Username già in uso');
        }

        final oldUsernameRef = _firestore.collection(usersCollection).doc(oldUser.username);
        transaction.delete(oldUsernameRef);

        transaction.set(usernameRef, {'uid': user.id});
      }

      transaction.set(userRef, user.toJson());
    });
  }
/*
  Future<String?> saveUser(User user) async {
    try {
      final docRef = firestore.collection(usersCollection).doc();
      final userWithId = user.copyWith(id: docRef.id);
      await docRef.set(userWithId.toFirestore());
      return docRef.id;
    } catch (e) {
      print('Failed to save user: $e');
      return null;
    }
  }

  Future<void> updateUser(User user) async {
    await firestore.collection(usersCollection).doc(user.id).set(user.toFirestore());
  }

  Future<void> deleteUser(String userId) async {
    await firestore.collection(usersCollection).doc(userId).delete();
  }

  Future<bool> isUsernameTaken(String username) async {
    final doc = await firestore.collection(usernamesCollection).doc(username).get();
    return doc.exists;
  }

  Future<bool> isEmailTaken(String email) async {
    final doc = await firestore.collection(emailsCollection).doc(email).get();
    return doc.exists;
  }

  Future<List<User>> getUsersMatchingPartialUsername(String partialUsername) async {
    final end = partialUsername + '\uf8ff'; // Unicode limit for range queries
    final querySnapshot = await firestore
        .collection(usersCollection)
        .where('username', isGreaterThanOrEqualTo: partialUsername)
        .where('username', isLessThan: end)
        .get();

    return querySnapshot.docs
        .map((doc) => User.fromFirestore(doc.id, doc.data()))
        .toList();
  }

  // DIARY METHODS

  Future<Diary?> getDiary(String diaryId) async {
    final doc = await firestore.collection(diariesCollection).doc(diaryId).get();
    if (!doc.exists) return null;
    return Diary.fromFirestore(doc.id, doc.data()!);
  }

  Future<String?> saveDiary(Diary diary) async {
    try {
      final docRef = await firestore.collection(diariesCollection).add(diary.toFirestore());
      return docRef.id;
    } catch (e) {
      print('Failed to save diary: $e');
      return null;
    }
  }

  Future<void> updateDiary(Diary diary) async {
    await firestore.collection(diariesCollection).doc(diary.id).set(diary.toFirestore());
  }

  Future<void> deleteDiary(String diaryId) async {
    await firestore.collection(diariesCollection).doc(diaryId).delete();
  }

  // IMAGE UPLOAD METHOD (example placeholder)
  Future<String> saveImage(File imageFile) async {
    // Implement upload with Firebase Storage or Supabase Storage here
    // Return the public URL after upload
    throw UnimplementedError('saveImage() is not implemented');
  }
*/

// Add other methods for pages, subpages, diary images, time capsules, etc.
}
