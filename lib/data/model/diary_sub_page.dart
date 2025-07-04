import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_sub_page.freezed.dart';
part 'diary_sub_page.g.dart';

@freezed
abstract class DiarySubPage with _$DiarySubPage {
  const factory DiarySubPage({
    @JsonKey(includeToJson: false) @Default('') String id,
    @Default('') String pageId,
    @Default('') String diaryId,
    @Default(<String>[]) List<String> imageIds,
  }) = _DiarySubPage;

  factory DiarySubPage.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>? ?? {};
    data['id'] = doc.id;
    return DiarySubPage.fromJson(data);
  }

  factory DiarySubPage.fromJson(Map<String, dynamic> json) => _$DiarySubPageFromJson(json);
}