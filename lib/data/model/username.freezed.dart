// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'username.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Username {

@JsonKey(includeToJson: false) String get username; String get uid;
/// Create a copy of Username
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsernameCopyWith<Username> get copyWith => _$UsernameCopyWithImpl<Username>(this as Username, _$identity);

  /// Serializes this Username to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Username&&(identical(other.username, username) || other.username == username)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,uid);

@override
String toString() {
  return 'Username(username: $username, uid: $uid)';
}


}

/// @nodoc
abstract mixin class $UsernameCopyWith<$Res>  {
  factory $UsernameCopyWith(Username value, $Res Function(Username) _then) = _$UsernameCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String username, String uid
});




}
/// @nodoc
class _$UsernameCopyWithImpl<$Res>
    implements $UsernameCopyWith<$Res> {
  _$UsernameCopyWithImpl(this._self, this._then);

  final Username _self;
  final $Res Function(Username) _then;

/// Create a copy of Username
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? uid = null,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Username implements Username {
  const _Username({@JsonKey(includeToJson: false) this.username = '', this.uid = ''});
  factory _Username.fromJson(Map<String, dynamic> json) => _$UsernameFromJson(json);

@override@JsonKey(includeToJson: false) final  String username;
@override@JsonKey() final  String uid;

/// Create a copy of Username
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsernameCopyWith<_Username> get copyWith => __$UsernameCopyWithImpl<_Username>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsernameToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Username&&(identical(other.username, username) || other.username == username)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,uid);

@override
String toString() {
  return 'Username(username: $username, uid: $uid)';
}


}

/// @nodoc
abstract mixin class _$UsernameCopyWith<$Res> implements $UsernameCopyWith<$Res> {
  factory _$UsernameCopyWith(_Username value, $Res Function(_Username) _then) = __$UsernameCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String username, String uid
});




}
/// @nodoc
class __$UsernameCopyWithImpl<$Res>
    implements _$UsernameCopyWith<$Res> {
  __$UsernameCopyWithImpl(this._self, this._then);

  final _Username _self;
  final $Res Function(_Username) _then;

/// Create a copy of Username
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? uid = null,}) {
  return _then(_Username(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
