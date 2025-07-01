// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResetPasswordState {

 String get email; String get emailError; String get formError;
/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordStateCopyWith<ResetPasswordState> get copyWith => _$ResetPasswordStateCopyWithImpl<ResetPasswordState>(this as ResetPasswordState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordState&&(identical(other.email, email) || other.email == email)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.formError, formError) || other.formError == formError));
}


@override
int get hashCode => Object.hash(runtimeType,email,emailError,formError);

@override
String toString() {
  return 'ResetPasswordState(email: $email, emailError: $emailError, formError: $formError)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordStateCopyWith<$Res>  {
  factory $ResetPasswordStateCopyWith(ResetPasswordState value, $Res Function(ResetPasswordState) _then) = _$ResetPasswordStateCopyWithImpl;
@useResult
$Res call({
 String email, String emailError, String formError
});




}
/// @nodoc
class _$ResetPasswordStateCopyWithImpl<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  _$ResetPasswordStateCopyWithImpl(this._self, this._then);

  final ResetPasswordState _self;
  final $Res Function(ResetPasswordState) _then;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? emailError = null,Object? formError = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailError: null == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String,formError: null == formError ? _self.formError : formError // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _ResetPasswordState implements ResetPasswordState {
  const _ResetPasswordState({this.email = '', this.emailError = '', this.formError = ''});
  

@override@JsonKey() final  String email;
@override@JsonKey() final  String emailError;
@override@JsonKey() final  String formError;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPasswordStateCopyWith<_ResetPasswordState> get copyWith => __$ResetPasswordStateCopyWithImpl<_ResetPasswordState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPasswordState&&(identical(other.email, email) || other.email == email)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.formError, formError) || other.formError == formError));
}


@override
int get hashCode => Object.hash(runtimeType,email,emailError,formError);

@override
String toString() {
  return 'ResetPasswordState(email: $email, emailError: $emailError, formError: $formError)';
}


}

/// @nodoc
abstract mixin class _$ResetPasswordStateCopyWith<$Res> implements $ResetPasswordStateCopyWith<$Res> {
  factory _$ResetPasswordStateCopyWith(_ResetPasswordState value, $Res Function(_ResetPasswordState) _then) = __$ResetPasswordStateCopyWithImpl;
@override @useResult
$Res call({
 String email, String emailError, String formError
});




}
/// @nodoc
class __$ResetPasswordStateCopyWithImpl<$Res>
    implements _$ResetPasswordStateCopyWith<$Res> {
  __$ResetPasswordStateCopyWithImpl(this._self, this._then);

  final _ResetPasswordState _self;
  final $Res Function(_ResetPasswordState) _then;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? emailError = null,Object? formError = null,}) {
  return _then(_ResetPasswordState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailError: null == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String,formError: null == formError ? _self.formError : formError // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
