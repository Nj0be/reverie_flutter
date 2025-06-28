import 'package:cloud_firestore/cloud_firestore.dart';

class Username {
  final String username;
  final String uid;

  Username({
    required this.username,
    required this.uid,
  });

  factory Username.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Username(
      username: data['username'] ?? '',
      uid: data['uid'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'username': username,
      'uid': uid,
    };
  }
}