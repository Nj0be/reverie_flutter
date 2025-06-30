import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email.freezed.dart';
part 'email.g.dart';

@freezed
abstract class Email with _$Email {
  const factory Email({
    @JsonKey(includeToJson: false) @Default('') String email,
    @Default('') String uid,
  }) = _Email;

  factory Email.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>? ?? {};
    data['email'] = doc.id;
    return Email.fromJson(data);
  }

  factory Email.fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);
}