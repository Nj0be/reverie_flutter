import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryCover {
  final String id;
  final String name;
  final String url;

  DiaryCover({
    this.id = '',
    required this.name,
    required this.url,
  });

  factory DiaryCover.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return DiaryCover(
      id: doc.id,
      name: data['name'] ?? '',
      url: data['url'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'url': url,
    };
  }
}

