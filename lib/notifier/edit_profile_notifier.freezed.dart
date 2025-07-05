// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 User get profile; String get username; String get usernameError; String get nameError; String get surnameError; String get formError;
/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditProfileStateCopyWith<EditProfileState> get copyWith => _$EditProfileStateCopyWithImpl<EditProfileState>(this as EditProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditProfileState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.username, username) || other.username == username)&&(identical(other.usernameError, usernameError) || other.usernameError == usernameError)&&(identical(other.nameError, nameError) || other.nameError == nameError)&&(identical(other.surnameError, surnameError) || other.surnameError == surnameError)&&(identical(other.formError, formError) || other.formError == formError));
}


@override
int get hashCode => Object.hash(runtimeType,profile,username,usernameError,nameError,surnameError,formError);

@override
String toString() {
  return 'EditProfileState(profile: $profile, username: $username, usernameError: $usernameError, nameError: $nameError, surnameError: $surnameError, formError: $formError)';
}


}

/// @nodoc
abstract mixin class $EditProfileStateCopyWith<$Res>  {
  factory $EditProfileStateCopyWith(EditProfileState value, $Res Function(EditProfileState) _then) = _$EditProfileStateCopyWithImpl;
@useResult
$Res call({
 User profile, String username, String usernameError, String nameError, String surnameError, String formError
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
@pragma('vm:prefer-inline') @override $Res call({Object? profile = null,Object? username = null,Object? usernameError = null,Object? nameError = null,Object? surnameError = null,Object? formError = null,}) {
  return _then(_self.copyWith(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as User,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,usernameError: null == usernameError ? _self.usernameError : usernameError // ignore: cast_nullable_to_non_nullable
as String,nameError: null == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String,surnameError: null == surnameError ? _self.surnameError : surnameError // ignore: cast_nullable_to_non_nullable
as String,formError: null == formError ? _self.formError : formError // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [EditProfileState].
extension EditProfileStatePatterns on EditProfileState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditProfileState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditProfileState value)  $default,){
final _that = this;
switch (_that) {
case _EditProfileState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _EditProfileState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( User profile,  String username,  String usernameError,  String nameError,  String surnameError,  String formError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditProfileState() when $default != null:
return $default(_that.profile,_that.username,_that.usernameError,_that.nameError,_that.surnameError,_that.formError);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( User profile,  String username,  String usernameError,  String nameError,  String surnameError,  String formError)  $default,) {final _that = this;
switch (_that) {
case _EditProfileState():
return $default(_that.profile,_that.username,_that.usernameError,_that.nameError,_that.surnameError,_that.formError);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( User profile,  String username,  String usernameError,  String nameError,  String surnameError,  String formError)?  $default,) {final _that = this;
switch (_that) {
case _EditProfileState() when $default != null:
return $default(_that.profile,_that.username,_that.usernameError,_that.nameError,_that.surnameError,_that.formError);case _:
  return null;

}
}

}

/// @nodoc


class _EditProfileState implements EditProfileState {
  const _EditProfileState({this.profile = const User(), this.username = '', this.usernameError = '', this.nameError = '', this.surnameError = '', this.formError = ''});
  

@override@JsonKey() final  User profile;
@override@JsonKey() final  String username;
@override@JsonKey() final  String usernameError;
@override@JsonKey() final  String nameError;
@override@JsonKey() final  String surnameError;
@override@JsonKey() final  String formError;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditProfileStateCopyWith<_EditProfileState> get copyWith => __$EditProfileStateCopyWithImpl<_EditProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditProfileState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.username, username) || other.username == username)&&(identical(other.usernameError, usernameError) || other.usernameError == usernameError)&&(identical(other.nameError, nameError) || other.nameError == nameError)&&(identical(other.surnameError, surnameError) || other.surnameError == surnameError)&&(identical(other.formError, formError) || other.formError == formError));
}


@override
int get hashCode => Object.hash(runtimeType,profile,username,usernameError,nameError,surnameError,formError);

@override
String toString() {
  return 'EditProfileState(profile: $profile, username: $username, usernameError: $usernameError, nameError: $nameError, surnameError: $surnameError, formError: $formError)';
}


}

/// @nodoc
abstract mixin class _$EditProfileStateCopyWith<$Res> implements $EditProfileStateCopyWith<$Res> {
  factory _$EditProfileStateCopyWith(_EditProfileState value, $Res Function(_EditProfileState) _then) = __$EditProfileStateCopyWithImpl;
@override @useResult
$Res call({
 User profile, String username, String usernameError, String nameError, String surnameError, String formError
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
@override @pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? username = null,Object? usernameError = null,Object? nameError = null,Object? surnameError = null,Object? formError = null,}) {
  return _then(_EditProfileState(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as User,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,usernameError: null == usernameError ? _self.usernameError : usernameError // ignore: cast_nullable_to_non_nullable
as String,nameError: null == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String,surnameError: null == surnameError ? _self.surnameError : surnameError // ignore: cast_nullable_to_non_nullable
as String,formError: null == formError ? _self.formError : formError // ignore: cast_nullable_to_non_nullable
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
