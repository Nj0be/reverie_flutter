// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_sub_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiarySubPage _$DiarySubPageFromJson(Map<String, dynamic> json) =>
    _DiarySubPage(
      id: json['id'] as String? ?? '',
      pageId: json['pageId'] as String? ?? '',
      diaryId: json['diaryId'] as String? ?? '',
      imageIds:
          (json['imageIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$DiarySubPageToJson(_DiarySubPage instance) =>
    <String, dynamic>{
      'pageId': instance.pageId,
      'diaryId': instance.diaryId,
      'imageIds': instance.imageIds,
    };
