// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_capsule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimeCapsule _$TimeCapsuleFromJson(Map<String, dynamic> json) => _TimeCapsule(
  id: json['id'] as String? ?? '',
  userId: json['userId'] as String? ?? '',
  title: json['title'] as String? ?? '',
  content: json['content'] as String? ?? '',
  deadline: timestampFromJson(json['deadline'] as Object),
  emails:
      (json['emails'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  phones:
      (json['phones'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  receiversIds:
      (json['receiversIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  creationDate: timestampFromJson(json['creationDate'] as Object),
  isSent: json['isSent'] as bool? ?? false,
);

Map<String, dynamic> _$TimeCapsuleToJson(_TimeCapsule instance) =>
    <String, dynamic>{
      'deadline': timestampToJson(instance.deadline),
      'creationDate': timestampToJson(instance.creationDate),
      'userId': instance.userId,
      'title': instance.title,
      'content': instance.content,
      'emails': instance.emails,
      'phones': instance.phones,
      'receiversIds': instance.receiversIds,
      'isSent': instance.isSent,
    };
