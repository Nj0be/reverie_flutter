import 'package:cloud_firestore/cloud_firestore.dart';

class Email {
  final String email;
  final String uid;

  Email({
    required this.email,
    required this.uid,
  });

  factory Email.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Email(
      email: data['email'] ?? '',
      uid: data['uid'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'uid': uid,
    };
  }
}