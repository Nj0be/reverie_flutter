// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Diary _$DiaryFromJson(Map<String, dynamic> json) => _Diary(
  id: json['id'] as String? ?? '',
  uid: json['uid'] as String? ?? '',
  title: json['title'] as String? ?? '',
  description: json['description'] as String? ?? '',
  coverId: json['coverId'] as String? ?? '',
  pageIds:
      (json['pageIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  creationDate: timestampFromJson(json['creationDate'] as Object),
);

Map<String, dynamic> _$DiaryToJson(_Diary instance) => <String, dynamic>{
  'creationDate': timestampToJson(instance.creationDate),
  'uid': instance.uid,
  'title': instance.title,
  'description': instance.description,
  'coverId': instance.coverId,
  'pageIds': instance.pageIds,
};
