import 'package:cloud_firestore/cloud_firestore.dart';

class Diary {
  final String id;
  final String uid;
  final String title;
  final String description;
  final String coverId;
  final List<String> pageIds;
  final Timestamp creationDate;

  Diary({
    this.id = '',
    required this.uid,
    required this.title,
    required this.description,
    required this.coverId,
    required this.pageIds,
    Timestamp? creationDate,
  }) : creationDate = creationDate ?? Timestamp.now();

  factory Diary.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Diary(
      id: doc.id,
      uid: data['uid'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      coverId: data['coverId'] ?? '',
      pageIds: List<String>.from(data['pageIds'] ?? []),
      creationDate: data['creationDate'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'title': title,
      'description': description,
      'coverId': coverId,
      'pageIds': pageIds,
      'creationDate': creationDate,
    };
  }
}
