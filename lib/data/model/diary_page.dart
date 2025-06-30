import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../utils.dart';

part 'diary_page.freezed.dart';
part 'diary_page.g.dart';

@freezed
abstract class DiaryPage with _$DiaryPage {
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) final Timestamp timestamp;

  DiaryPage._({Timestamp? timestamp}) : timestamp = timestamp ?? Timestamp.now();

  factory DiaryPage({
    @JsonKey(includeToJson: false) @Default('') String id,
    @Default('') String diaryId,
    @Default('') String content,
    @Default(<String>[]) List<String> subPageIds,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) Timestamp? timestamp,
  }) = _DiaryPage;

  factory DiaryPage.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>? ?? {};
    data['id'] = doc.id;
    return DiaryPage.fromJson(data);
  }

  factory DiaryPage.fromJson(Map<String, dynamic> json) => _$DiaryPageFromJson(json);
}