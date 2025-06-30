import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @JsonKey(includeToJson: false) @Default('') String id,
    @Default('') String email,
    @Default('') String username,
    @Default('') String name,
    @Default('') String surname,
    @Default(<String>[]) List<String> diaryIds,
    @Default(<String>[]) List<String> sentTimeCapsuleIds,
    @Default(<String>[]) List<String> receivedTimeCapsuleIds,
  }) = _User;

  factory User.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>? ?? {};
    data['id'] = doc.id;
    return User.fromJson(data);
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}