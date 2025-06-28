import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryPage {
  final String id;
  final String diaryId;
  final String content;
  final List<String> subPageIds;
  final Timestamp timestamp;

  DiaryPage({
    this.id = '',
    required this.diaryId,
    required this.content,
    required this.subPageIds,
    Timestamp? timestamp,
  }) : timestamp = timestamp ?? Timestamp.now();

  factory DiaryPage.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return DiaryPage(
      id: doc.id,
      diaryId: data['diaryId'] ?? '',
      content: data['content'] ?? '',
      subPageIds: List<String>.from(data['subPageIds'] ?? []),
      timestamp: data['timestamp'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'diaryId': diaryId,
      'content': content,
      'subPageIds': subPageIds,
      'timestamp': timestamp,
    };
  }
}
