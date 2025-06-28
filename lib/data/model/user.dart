import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String email;
  final String username;
  final String name;
  final String surname;
  final List<String> diaryIds;
  final List<String> sentTimeCapsuleIds;
  final List<String> receivedTimeCapsuleIds;

  User({
    this.id = '',
    this.email = '',
    required this.username,
    required this.name,
    required this.surname,
    required this.diaryIds,
    required this.sentTimeCapsuleIds,
    required this.receivedTimeCapsuleIds,
  });

  factory User.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return User(
      id: doc.id,
      email: data['email'] ?? '',
      username: data['username'] ?? '',
      name: data['name'] ?? '',
      surname: data['surname'] ?? '',
      diaryIds: List<String>.from(data['diaryIds'] ?? []),
      sentTimeCapsuleIds: List<String>.from(data['sentTimeCapsuleIds'] ?? []),
      receivedTimeCapsuleIds: List<String>.from(
          data['receivedTimeCapsuleIds'] ?? []),
    );
  }
}