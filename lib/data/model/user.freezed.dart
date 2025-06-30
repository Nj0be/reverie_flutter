// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

@JsonKey(includeToJson: false) String get id; String get email; String get username; String get name; String get surname; List<String> get diaryIds; List<String> get sentTimeCapsuleIds; List<String> get receivedTimeCapsuleIds;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&const DeepCollectionEquality().equals(other.diaryIds, diaryIds)&&const DeepCollectionEquality().equals(other.sentTimeCapsuleIds, sentTimeCapsuleIds)&&const DeepCollectionEquality().equals(other.receivedTimeCapsuleIds, receivedTimeCapsuleIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,username,name,surname,const DeepCollectionEquality().hash(diaryIds),const DeepCollectionEquality().hash(sentTimeCapsuleIds),const DeepCollectionEquality().hash(receivedTimeCapsuleIds));

@override
String toString() {
  return 'User(id: $id, email: $email, username: $username, name: $name, surname: $surname, diaryIds: $diaryIds, sentTimeCapsuleIds: $sentTimeCapsuleIds, receivedTimeCapsuleIds: $receivedTimeCapsuleIds)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String id, String email, String username, String name, String surname, List<String> diaryIds, List<String> sentTimeCapsuleIds, List<String> receivedTimeCapsuleIds
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? username = null,Object? name = null,Object? surname = null,Object? diaryIds = null,Object? sentTimeCapsuleIds = null,Object? receivedTimeCapsuleIds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,diaryIds: null == diaryIds ? _self.diaryIds : diaryIds // ignore: cast_nullable_to_non_nullable
as List<String>,sentTimeCapsuleIds: null == sentTimeCapsuleIds ? _self.sentTimeCapsuleIds : sentTimeCapsuleIds // ignore: cast_nullable_to_non_nullable
as List<String>,receivedTimeCapsuleIds: null == receivedTimeCapsuleIds ? _self.receivedTimeCapsuleIds : receivedTimeCapsuleIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({@JsonKey(includeToJson: false) this.id = '', this.email = '', this.username = '', this.name = '', this.surname = '', final  List<String> diaryIds = const <String>[], final  List<String> sentTimeCapsuleIds = const <String>[], final  List<String> receivedTimeCapsuleIds = const <String>[]}): _diaryIds = diaryIds,_sentTimeCapsuleIds = sentTimeCapsuleIds,_receivedTimeCapsuleIds = receivedTimeCapsuleIds;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override@JsonKey(includeToJson: false) final  String id;
@override@JsonKey() final  String email;
@override@JsonKey() final  String username;
@override@JsonKey() final  String name;
@override@JsonKey() final  String surname;
 final  List<String> _diaryIds;
@override@JsonKey() List<String> get diaryIds {
  if (_diaryIds is EqualUnmodifiableListView) return _diaryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_diaryIds);
}

 final  List<String> _sentTimeCapsuleIds;
@override@JsonKey() List<String> get sentTimeCapsuleIds {
  if (_sentTimeCapsuleIds is EqualUnmodifiableListView) return _sentTimeCapsuleIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sentTimeCapsuleIds);
}

 final  List<String> _receivedTimeCapsuleIds;
@override@JsonKey() List<String> get receivedTimeCapsuleIds {
  if (_receivedTimeCapsuleIds is EqualUnmodifiableListView) return _receivedTimeCapsuleIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_receivedTimeCapsuleIds);
}


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&const DeepCollectionEquality().equals(other._diaryIds, _diaryIds)&&const DeepCollectionEquality().equals(other._sentTimeCapsuleIds, _sentTimeCapsuleIds)&&const DeepCollectionEquality().equals(other._receivedTimeCapsuleIds, _receivedTimeCapsuleIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,username,name,surname,const DeepCollectionEquality().hash(_diaryIds),const DeepCollectionEquality().hash(_sentTimeCapsuleIds),const DeepCollectionEquality().hash(_receivedTimeCapsuleIds));

@override
String toString() {
  return 'User(id: $id, email: $email, username: $username, name: $name, surname: $surname, diaryIds: $diaryIds, sentTimeCapsuleIds: $sentTimeCapsuleIds, receivedTimeCapsuleIds: $receivedTimeCapsuleIds)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String id, String email, String username, String name, String surname, List<String> diaryIds, List<String> sentTimeCapsuleIds, List<String> receivedTimeCapsuleIds
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? username = null,Object? name = null,Object? surname = null,Object? diaryIds = null,Object? sentTimeCapsuleIds = null,Object? receivedTimeCapsuleIds = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,diaryIds: null == diaryIds ? _self._diaryIds : diaryIds // ignore: cast_nullable_to_non_nullable
as List<String>,sentTimeCapsuleIds: null == sentTimeCapsuleIds ? _self._sentTimeCapsuleIds : sentTimeCapsuleIds // ignore: cast_nullable_to_non_nullable
as List<String>,receivedTimeCapsuleIds: null == receivedTimeCapsuleIds ? _self._receivedTimeCapsuleIds : receivedTimeCapsuleIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
