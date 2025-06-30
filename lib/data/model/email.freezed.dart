// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Email {

@JsonKey(includeToJson: false) String get email; String get uid;
/// Create a copy of Email
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailCopyWith<Email> get copyWith => _$EmailCopyWithImpl<Email>(this as Email, _$identity);

  /// Serializes this Email to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Email&&(identical(other.email, email) || other.email == email)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,uid);

@override
String toString() {
  return 'Email(email: $email, uid: $uid)';
}


}

/// @nodoc
abstract mixin class $EmailCopyWith<$Res>  {
  factory $EmailCopyWith(Email value, $Res Function(Email) _then) = _$EmailCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String email, String uid
});




}
/// @nodoc
class _$EmailCopyWithImpl<$Res>
    implements $EmailCopyWith<$Res> {
  _$EmailCopyWithImpl(this._self, this._then);

  final Email _self;
  final $Res Function(Email) _then;

/// Create a copy of Email
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? uid = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Email implements Email {
  const _Email({@JsonKey(includeToJson: false) this.email = '', this.uid = ''});
  factory _Email.fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);

@override@JsonKey(includeToJson: false) final  String email;
@override@JsonKey() final  String uid;

/// Create a copy of Email
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailCopyWith<_Email> get copyWith => __$EmailCopyWithImpl<_Email>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Email&&(identical(other.email, email) || other.email == email)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,uid);

@override
String toString() {
  return 'Email(email: $email, uid: $uid)';
}


}

/// @nodoc
abstract mixin class _$EmailCopyWith<$Res> implements $EmailCopyWith<$Res> {
  factory _$EmailCopyWith(_Email value, $Res Function(_Email) _then) = __$EmailCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String email, String uid
});




}
/// @nodoc
class __$EmailCopyWithImpl<$Res>
    implements _$EmailCopyWith<$Res> {
  __$EmailCopyWithImpl(this._self, this._then);

  final _Email _self;
  final $Res Function(_Email) _then;

/// Create a copy of Email
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? uid = null,}) {
  return _then(_Email(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
