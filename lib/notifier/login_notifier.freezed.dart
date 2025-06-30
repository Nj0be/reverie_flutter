// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {

 String get email; String get emailError; String get password; String get passwordError; String get formError;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.email, email) || other.email == email)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.formError, formError) || other.formError == formError));
}


@override
int get hashCode => Object.hash(runtimeType,email,emailError,password,passwordError,formError);

@override
String toString() {
  return 'LoginState(email: $email, emailError: $emailError, password: $password, passwordError: $passwordError, formError: $formError)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 String email, String emailError, String password, String passwordError, String formError
});




}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? emailError = null,Object? password = null,Object? passwordError = null,Object? formError = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailError: null == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordError: null == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String,formError: null == formError ? _self.formError : formError // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _LoginState implements LoginState {
  const _LoginState({this.email = '', this.emailError = '', this.password = '', this.passwordError = '', this.formError = ''});
  

@override@JsonKey() final  String email;
@override@JsonKey() final  String emailError;
@override@JsonKey() final  String password;
@override@JsonKey() final  String passwordError;
@override@JsonKey() final  String formError;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginStateCopyWith<_LoginState> get copyWith => __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginState&&(identical(other.email, email) || other.email == email)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.formError, formError) || other.formError == formError));
}


@override
int get hashCode => Object.hash(runtimeType,email,emailError,password,passwordError,formError);

@override
String toString() {
  return 'LoginState(email: $email, emailError: $emailError, password: $password, passwordError: $passwordError, formError: $formError)';
}


}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(_LoginState value, $Res Function(_LoginState) _then) = __$LoginStateCopyWithImpl;
@override @useResult
$Res call({
 String email, String emailError, String password, String passwordError, String formError
});




}
/// @nodoc
class __$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? emailError = null,Object? password = null,Object? passwordError = null,Object? formError = null,}) {
  return _then(_LoginState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailError: null == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordError: null == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String,formError: null == formError ? _self.formError : formError // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
