import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../utils.dart';

part 'diary.freezed.dart';
part 'diary.g.dart';

@freezed
abstract class Diary with _$Diary {
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) final Timestamp creationDate;

  Diary._({Timestamp? creationDate}) : creationDate = creationDate ?? Timestamp.now();

  factory Diary({
    @JsonKey(includeToJson: false) @Default('') String id,
    @Default('') String uid,
    @Default('') String title,
    @Default('') String description,
    @Default('') String coverId,
    @Default(<String>[]) List<String> pageIds,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) Timestamp? creationDate,
  }) = _Diary;

  factory Diary.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>? ?? {};
    data['id'] = doc.id;
    return Diary.fromJson(data);
  }

  factory Diary.fromJson(Map<String, dynamic> json) => _$DiaryFromJson(json);
}