import 'package:cloud_firestore/cloud_firestore.dart';

// Helpers to handle Timestamp serialization
Timestamp timestampFromJson(Object json) {
  if (json is Timestamp) return json;
  throw Exception('Invalid Timestamp format');
}

Timestamp? timestampToJson(Timestamp? timestamp) => timestamp;

bool isEmailValid(String email) {
  final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  return emailRegex.hasMatch(email);
}
