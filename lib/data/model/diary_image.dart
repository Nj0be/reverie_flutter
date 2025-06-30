import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_image.freezed.dart';
part 'diary_image.g.dart';

@freezed
abstract class DiaryImage with _$DiaryImage {
  const factory DiaryImage({
    @JsonKey(includeToJson: false) @Default('') String id,
    @Default('') String subPageId,
    @Default('') String diaryId,
    @Default(0) int offsetX,
    @Default(0) int offsetY,
    @Default(1) double scale,
    @Default(0) double rotation,
    @Default('') String url,
  }) = _DiaryImage;

  factory DiaryImage.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>? ?? {};
    data['id'] = doc.id;
    return DiaryImage.fromJson(data);
  }

  factory DiaryImage.fromJson(Map<String, dynamic> json) => _$DiaryImageFromJson(json);
}