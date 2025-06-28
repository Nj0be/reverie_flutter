import 'package:cloud_firestore/cloud_firestore.dart';

class DiarySubPage {
  final String id;
  final String pageId;
  final String diaryId;
  final List<String> imageIds;

  DiarySubPage({
    this.id = '',
    required this.pageId,
    required this.diaryId,
    required this.imageIds,
  });

  factory DiarySubPage.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return DiarySubPage(
      id: doc.id,
      pageId: data['pageId'] ?? '',
      diaryId: data['diaryId'] ?? '',
      imageIds: List<String>.from(data['imageIds'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'pageId': pageId,
      'diaryId': diaryId,
      'imageIds': imageIds,
    };
  }
}
