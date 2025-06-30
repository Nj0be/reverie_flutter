import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'username.freezed.dart';
part 'username.g.dart';

@freezed
abstract class Username with _$Username {
  const factory Username({
    @JsonKey(includeToJson: false) @Default('') String username,
    @Default('') String uid,
  }) = _Username;

  factory Username.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>? ?? {};
    data['username'] = doc.id;
    return Username.fromJson(data);
  }

  factory Username.fromJson(Map<String, dynamic> json) => _$UsernameFromJson(json);
}