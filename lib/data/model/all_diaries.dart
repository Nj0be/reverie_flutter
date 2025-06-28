import 'package:cloud_firestore/cloud_firestore.dart';

class AllDiaries {
  final String userId;
  final List<String> diaryIds;

  AllDiaries({
    required this.userId,
    required this.diaryIds,
  });

  factory AllDiaries.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AllDiaries(
      userId: data['userId'] ?? '',
      diaryIds: List<String>.from(data['diaryIds'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'diaryIds': diaryIds,
    };
  }
}


// Model for Diary

// Model for DiaryPage

// Model for DiarySubPage

// Remaining models follow similar conversion: User, Username, Email, TimeCapsule
