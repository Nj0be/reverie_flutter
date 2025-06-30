// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiaryPage _$DiaryPageFromJson(Map<String, dynamic> json) => _DiaryPage(
  id: json['id'] as String? ?? '',
  diaryId: json['diaryId'] as String? ?? '',
  content: json['content'] as String? ?? '',
  subPageIds:
      (json['subPageIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  timestamp: timestampFromJson(json['timestamp'] as Object),
);

Map<String, dynamic> _$DiaryPageToJson(_DiaryPage instance) =>
    <String, dynamic>{
      'timestamp': timestampToJson(instance.timestamp),
      'diaryId': instance.diaryId,
      'content': instance.content,
      'subPageIds': instance.subPageIds,
    };
