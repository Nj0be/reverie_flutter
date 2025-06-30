// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiaryImage _$DiaryImageFromJson(Map<String, dynamic> json) => _DiaryImage(
  id: json['id'] as String? ?? '',
  subPageId: json['subPageId'] as String? ?? '',
  diaryId: json['diaryId'] as String? ?? '',
  offsetX: (json['offsetX'] as num?)?.toInt() ?? 0,
  offsetY: (json['offsetY'] as num?)?.toInt() ?? 0,
  scale: (json['scale'] as num?)?.toDouble() ?? 1,
  rotation: (json['rotation'] as num?)?.toDouble() ?? 0,
  url: json['url'] as String? ?? '',
);

Map<String, dynamic> _$DiaryImageToJson(_DiaryImage instance) =>
    <String, dynamic>{
      'subPageId': instance.subPageId,
      'diaryId': instance.diaryId,
      'offsetX': instance.offsetX,
      'offsetY': instance.offsetY,
      'scale': instance.scale,
      'rotation': instance.rotation,
      'url': instance.url,
    };
