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

  factory User.empty() => User(
    id: '',
    email: '',
    username: '',
    name: '',
    surname: '',
    diaryIds: [],
    sentTimeCapsuleIds: [],
    receivedTimeCapsuleIds: [],
  );

  User copyWith({
    String? id,
    String? email,
    String? username,
    String? name,
    String? surname,
    List<String>? diaryIds,
    List<String>? sentTimeCapsuleIds,
    List<String>? receivedTimeCapsuleIds,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      diaryIds: diaryIds ?? this.diaryIds,
      sentTimeCapsuleIds: sentTimeCapsuleIds ?? this.sentTimeCapsuleIds,
      receivedTimeCapsuleIds: receivedTimeCapsuleIds ?? this.receivedTimeCapsuleIds,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'name': name,
      'surname': surname,
      'diaryIds': diaryIds,
      'sentTimeCapsuleIds': sentTimeCapsuleIds,
      'receivedTimeCapsuleIds': receivedTimeCapsuleIds,
    };
  }
}