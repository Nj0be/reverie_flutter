import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryImage {
  final String id;
  final String subPageId;
  final String diaryId;
  final int offsetX;
  final int offsetY;
  final double scale;
  final double rotation;
  final String url;

  DiaryImage({
    this.id = '',
    required this.subPageId,
    required this.diaryId,
    required this.offsetX,
    required this.offsetY,
    required this.scale,
    required this.rotation,
    required this.url,
  });

  factory DiaryImage.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return DiaryImage(
      id: doc.id,
      subPageId: data['subPageId'] ?? '',
      diaryId: data['diaryId'] ?? '',
      offsetX: data['offsetX'] ?? 0,
      offsetY: data['offsetY'] ?? 0,
      scale: (data['scale'] ?? 1.0).toDouble(),
      rotation: (data['rotation'] ?? 0.0).toDouble(),
      url: data['url'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'subPageId': subPageId,
      'diaryId': diaryId,
      'offsetX': offsetX,
      'offsetY': offsetY,
      'scale': scale,
      'rotation': rotation,
      'url': url,
    };
  }
}
