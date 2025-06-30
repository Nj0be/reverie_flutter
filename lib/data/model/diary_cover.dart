import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_cover.freezed.dart';
part 'diary_cover.g.dart';

@freezed
abstract class DiaryCover with _$DiaryCover {
  const factory DiaryCover({
    @JsonKey(includeToJson: false) @Default('') String id,
    @Default('') String name,
    @Default('') String url,
  }) = _DiaryCover;

  factory DiaryCover.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>? ?? {};
    data['id'] = doc.id;
    return DiaryCover.fromJson(data);
  }

  factory DiaryCover.fromJson(Map<String, dynamic> json) => _$DiaryCoverFromJson(json);
}