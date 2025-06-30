// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String? ?? '',
  email: json['email'] as String? ?? '',
  username: json['username'] as String? ?? '',
  name: json['name'] as String? ?? '',
  surname: json['surname'] as String? ?? '',
  diaryIds:
      (json['diaryIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  sentTimeCapsuleIds:
      (json['sentTimeCapsuleIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  receivedTimeCapsuleIds:
      (json['receivedTimeCapsuleIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'email': instance.email,
  'username': instance.username,
  'name': instance.name,
  'surname': instance.surname,
  'diaryIds': instance.diaryIds,
  'sentTimeCapsuleIds': instance.sentTimeCapsuleIds,
  'receivedTimeCapsuleIds': instance.receivedTimeCapsuleIds,
};
