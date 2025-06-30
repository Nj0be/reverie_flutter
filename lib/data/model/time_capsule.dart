import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../utils.dart';

part 'time_capsule.freezed.dart';
part 'time_capsule.g.dart';

@freezed
abstract class TimeCapsule with _$TimeCapsule {
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) final Timestamp deadline;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) final Timestamp creationDate;

  TimeCapsule._({Timestamp? deadline, Timestamp? creationDate})
      : deadline = deadline ?? Timestamp.now(),
        creationDate = creationDate ?? Timestamp.now();

  factory TimeCapsule({
    @JsonKey(includeToJson: false) @Default('') String id,
    @Default('') String userId,
    @Default('') String title,
    @Default('') String content,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) Timestamp? deadline,
    @Default(<String>[]) List<String> emails,
    @Default(<String>[]) List<String> phones,
    @Default(<String>[]) List<String> receiversIds,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) Timestamp? creationDate,
    @Default(false) bool isSent,
  }) = _TimeCapsule;

  factory TimeCapsule.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    data['id'] = doc.id;
    return TimeCapsule.fromJson(data);
  }

  factory TimeCapsule.fromJson(Map<String, dynamic> json) => _$TimeCapsuleFromJson(json);
}