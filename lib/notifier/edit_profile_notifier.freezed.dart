// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditProfileState {

 User get profile; String get username; String get usernameError; String get name; String get nameError; String get surname; String get surnameError; String get editError;
/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditProfileStateCopyWith<EditProfileState> get copyWith => _$EditProfileStateCopyWithImpl<EditProfileState>(this as EditProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditProfileState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.username, username) || other.username == username)&&(identical(other.usernameError, usernameError) || other.usernameError == usernameError)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameError, nameError) || other.nameError == nameError)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.surnameError, surnameError) || other.surnameError == surnameError)&&(identical(other.editError, editError) || other.editError == editError));
}


@override
int get hashCode => Object.hash(runtimeType,profile,username,usernameError,name,nameError,surname,surnameError,editError);

@override
String toString() {
  return 'EditProfileState(profile: $profile, username: $username, usernameError: $usernameError, name: $name, nameError: $nameError, surname: $surname, surnameError: $surnameError, editError: $editError)';
}


}

/// @nodoc
abstract mixin class $EditProfileStateCopyWith<$Res>  {
  factory $EditProfileStateCopyWith(EditProfileState value, $Res Function(EditProfileState) _then) = _$EditProfileStateCopyWithImpl;
@useResult
$Res call({
 User profile, String username, String usernameError, String name, String nameError, String surname, String surnameError, String editError
});


$UserCopyWith<$Res> get profile;

}
/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._self, this._then);

  final EditProfileState _self;
  final $Res Function(EditProfileState) _then;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = null,Object? username = null,Object? usernameError = null,Object? name = null,Object? nameError = null,Object? surname = null,Object? surnameError = null,Object? editError = null,}) {
  return _then(_self.copyWith(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as User,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,usernameError: null == usernameError ? _self.usernameError : usernameError // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameError: null == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,surnameError: null == surnameError ? _self.surnameError : surnameError // ignore: cast_nullable_to_non_nullable
as String,editError: null == editError ? _self.editError : editError // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get profile {
  
  return $UserCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// @nodoc


class _EditProfileState implements EditProfileState {
  const _EditProfileState({this.profile = const User(), this.username = '', this.usernameError = '', this.name = '', this.nameError = '', this.surname = '', this.surnameError = '', this.editError = ''});
  

@override@JsonKey() final  User profile;
@override@JsonKey() final  String username;
@override@JsonKey() final  String usernameError;
@override@JsonKey() final  String name;
@override@JsonKey() final  String nameError;
@override@JsonKey() final  String surname;
@override@JsonKey() final  String surnameError;
@override@JsonKey() final  String editError;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditProfileStateCopyWith<_EditProfileState> get copyWith => __$EditProfileStateCopyWithImpl<_EditProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditProfileState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.username, username) || other.username == username)&&(identical(other.usernameError, usernameError) || other.usernameError == usernameError)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameError, nameError) || other.nameError == nameError)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.surnameError, surnameError) || other.surnameError == surnameError)&&(identical(other.editError, editError) || other.editError == editError));
}


@override
int get hashCode => Object.hash(runtimeType,profile,username,usernameError,name,nameError,surname,surnameError,editError);

@override
String toString() {
  return 'EditProfileState(profile: $profile, username: $username, usernameError: $usernameError, name: $name, nameError: $nameError, surname: $surname, surnameError: $surnameError, editError: $editError)';
}


}

/// @nodoc
abstract mixin class _$EditProfileStateCopyWith<$Res> implements $EditProfileStateCopyWith<$Res> {
  factory _$EditProfileStateCopyWith(_EditProfileState value, $Res Function(_EditProfileState) _then) = __$EditProfileStateCopyWithImpl;
@override @useResult
$Res call({
 User profile, String username, String usernameError, String name, String nameError, String surname, String surnameError, String editError
});


@override $UserCopyWith<$Res> get profile;

}
/// @nodoc
class __$EditProfileStateCopyWithImpl<$Res>
    implements _$EditProfileStateCopyWith<$Res> {
  __$EditProfileStateCopyWithImpl(this._self, this._then);

  final _EditProfileState _self;
  final $Res Function(_EditProfileState) _then;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? username = null,Object? usernameError = null,Object? name = null,Object? nameError = null,Object? surname = null,Object? surnameError = null,Object? editError = null,}) {
  return _then(_EditProfileState(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as User,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,usernameError: null == usernameError ? _self.usernameError : usernameError // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameError: null == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,surnameError: null == surnameError ? _self.surnameError : surnameError // ignore: cast_nullable_to_non_nullable
as String,editError: null == editError ? _self.editError : editError // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get profile {
  
  return $UserCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

// dart format on
