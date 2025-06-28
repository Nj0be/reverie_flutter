import 'package:cloud_firestore/cloud_firestore.dart';

class TimeCapsule {
  final String id;
  final String userId;
  final String title;
  final String content;
  final Timestamp deadline;
  final List<String> emails;
  final List<String> phones;
  final List<String> receiversIds;
  final Timestamp creationDate;
  final bool isSent;

  TimeCapsule({
    this.id = '',
    required this.userId,
    required this.title,
    required this.content,
    required this.deadline,
    required this.emails,
    required this.phones,
    required this.receiversIds,
    required this.creationDate,
    this.isSent = false,
  });

  factory TimeCapsule.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TimeCapsule(
      id: doc.id,
      userId: data['userId'] ?? '',
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      deadline: data['deadline'] ?? Timestamp.now(),
      emails: List<String>.from(data['emails'] ?? []),
      phones: List<String>.from(data['phones'] ?? []),
      receiversIds: List<String>.from(data['receiversIds'] ?? []),
      creationDate: data['creationDate'] ?? Timestamp.now(),
      isSent: data['isSent'] ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'title': title,
      'content': content,
      'deadline': deadline,
      'emails': emails,
      'phones': phones,
      'receiversIds': receiversIds,
      'creationDate': creationDate,
      'isSent': isSent,
    };
  }
}