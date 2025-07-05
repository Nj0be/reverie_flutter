// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_time_capsule_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateTimeCapsuleState {

 TimeCapsule get timeCapsule; String get titleError; String get contentError; String get deadlineError; String get phoneNumber; String get phoneNumberError; String get email; String get emailError; String get partialUsername; String get formError; List<User> get matchingUsers; List<User> get userReceivers;
/// Create a copy of CreateTimeCapsuleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTimeCapsuleStateCopyWith<CreateTimeCapsuleState> get copyWith => _$CreateTimeCapsuleStateCopyWithImpl<CreateTimeCapsuleState>(this as CreateTimeCapsuleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTimeCapsuleState&&(identical(other.timeCapsule, timeCapsule) || other.timeCapsule == timeCapsule)&&(identical(other.titleError, titleError) || other.titleError == titleError)&&(identical(other.contentError, contentError) || other.contentError == contentError)&&(identical(other.deadlineError, deadlineError) || other.deadlineError == deadlineError)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.phoneNumberError, phoneNumberError) || other.phoneNumberError == phoneNumberError)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.partialUsername, partialUsername) || other.partialUsername == partialUsername)&&(identical(other.formError, formError) || other.formError == formError)&&const DeepCollectionEquality().equals(other.matchingUsers, matchingUsers)&&const DeepCollectionEquality().equals(other.userReceivers, userReceivers));
}


@override
int get hashCode => Object.hash(runtimeType,timeCapsule,titleError,contentError,deadlineError,phoneNumber,phoneNumberError,email,emailError,partialUsername,formError,const DeepCollectionEquality().hash(matchingUsers),const DeepCollectionEquality().hash(userReceivers));

@override
String toString() {
  return 'CreateTimeCapsuleState(timeCapsule: $timeCapsule, titleError: $titleError, contentError: $contentError, deadlineError: $deadlineError, phoneNumber: $phoneNumber, phoneNumberError: $phoneNumberError, email: $email, emailError: $emailError, partialUsername: $partialUsername, formError: $formError, matchingUsers: $matchingUsers, userReceivers: $userReceivers)';
}


}

/// @nodoc
abstract mixin class $CreateTimeCapsuleStateCopyWith<$Res>  {
  factory $CreateTimeCapsuleStateCopyWith(CreateTimeCapsuleState value, $Res Function(CreateTimeCapsuleState) _then) = _$CreateTimeCapsuleStateCopyWithImpl;
@useResult
$Res call({
 TimeCapsule? timeCapsule, String titleError, String contentError, String deadlineError, String phoneNumber, String phoneNumberError, String email, String emailError, String partialUsername, String formError, List<User> matchingUsers, List<User> userReceivers
});


$TimeCapsuleCopyWith<$Res>? get timeCapsule;

}
/// @nodoc
class _$CreateTimeCapsuleStateCopyWithImpl<$Res>
    implements $CreateTimeCapsuleStateCopyWith<$Res> {
  _$CreateTimeCapsuleStateCopyWithImpl(this._self, this._then);

  final CreateTimeCapsuleState _self;
  final $Res Function(CreateTimeCapsuleState) _then;

/// Create a copy of CreateTimeCapsuleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timeCapsule = freezed,Object? titleError = null,Object? contentError = null,Object? deadlineError = null,Object? phoneNumber = null,Object? phoneNumberError = null,Object? email = null,Object? emailError = null,Object? partialUsername = null,Object? formError = null,Object? matchingUsers = null,Object? userReceivers = null,}) {
  return _then(_self.copyWith(
timeCapsule: freezed == timeCapsule ? _self.timeCapsule! : timeCapsule // ignore: cast_nullable_to_non_nullable
as TimeCapsule?,titleError: null == titleError ? _self.titleError : titleError // ignore: cast_nullable_to_non_nullable
as String,contentError: null == contentError ? _self.contentError : contentError // ignore: cast_nullable_to_non_nullable
as String,deadlineError: null == deadlineError ? _self.deadlineError : deadlineError // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,phoneNumberError: null == phoneNumberError ? _self.phoneNumberError : phoneNumberError // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailError: null == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String,partialUsername: null == partialUsername ? _self.partialUsername : partialUsername // ignore: cast_nullable_to_non_nullable
as String,formError: null == formError ? _self.formError : formError // ignore: cast_nullable_to_non_nullable
as String,matchingUsers: null == matchingUsers ? _self.matchingUsers : matchingUsers // ignore: cast_nullable_to_non_nullable
as List<User>,userReceivers: null == userReceivers ? _self.userReceivers : userReceivers // ignore: cast_nullable_to_non_nullable
as List<User>,
  ));
}
/// Create a copy of CreateTimeCapsuleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCapsuleCopyWith<$Res>? get timeCapsule {
    if (_self.timeCapsule == null) {
    return null;
  }

  return $TimeCapsuleCopyWith<$Res>(_self.timeCapsule!, (value) {
    return _then(_self.copyWith(timeCapsule: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateTimeCapsuleState].
extension CreateTimeCapsuleStatePatterns on CreateTimeCapsuleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTimeCapsuleState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTimeCapsuleState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTimeCapsuleState value)  $default,){
final _that = this;
switch (_that) {
case _CreateTimeCapsuleState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTimeCapsuleState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTimeCapsuleState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TimeCapsule? timeCapsule,  String titleError,  String contentError,  String deadlineError,  String phoneNumber,  String phoneNumberError,  String email,  String emailError,  String partialUsername,  String formError,  List<User> matchingUsers,  List<User> userReceivers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTimeCapsuleState() when $default != null:
return $default(_that.timeCapsule,_that.titleError,_that.contentError,_that.deadlineError,_that.phoneNumber,_that.phoneNumberError,_that.email,_that.emailError,_that.partialUsername,_that.formError,_that.matchingUsers,_that.userReceivers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TimeCapsule? timeCapsule,  String titleError,  String contentError,  String deadlineError,  String phoneNumber,  String phoneNumberError,  String email,  String emailError,  String partialUsername,  String formError,  List<User> matchingUsers,  List<User> userReceivers)  $default,) {final _that = this;
switch (_that) {
case _CreateTimeCapsuleState():
return $default(_that.timeCapsule,_that.titleError,_that.contentError,_that.deadlineError,_that.phoneNumber,_that.phoneNumberError,_that.email,_that.emailError,_that.partialUsername,_that.formError,_that.matchingUsers,_that.userReceivers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TimeCapsule? timeCapsule,  String titleError,  String contentError,  String deadlineError,  String phoneNumber,  String phoneNumberError,  String email,  String emailError,  String partialUsername,  String formError,  List<User> matchingUsers,  List<User> userReceivers)?  $default,) {final _that = this;
switch (_that) {
case _CreateTimeCapsuleState() when $default != null:
return $default(_that.timeCapsule,_that.titleError,_that.contentError,_that.deadlineError,_that.phoneNumber,_that.phoneNumberError,_that.email,_that.emailError,_that.partialUsername,_that.formError,_that.matchingUsers,_that.userReceivers);case _:
  return null;

}
}

}

/// @nodoc


class _CreateTimeCapsuleState extends CreateTimeCapsuleState {
   _CreateTimeCapsuleState({final  TimeCapsule? timeCapsule, this.titleError = '', this.contentError = '', this.deadlineError = '', this.phoneNumber = '', this.phoneNumberError = '', this.email = '', this.emailError = '', this.partialUsername = '', this.formError = '', final  List<User> matchingUsers = const [], final  List<User> userReceivers = const []}): _matchingUsers = matchingUsers,_userReceivers = userReceivers,super._(timeCapsule: timeCapsule);
  

@override@JsonKey() final  String titleError;
@override@JsonKey() final  String contentError;
@override@JsonKey() final  String deadlineError;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String phoneNumberError;
@override@JsonKey() final  String email;
@override@JsonKey() final  String emailError;
@override@JsonKey() final  String partialUsername;
@override@JsonKey() final  String formError;
 final  List<User> _matchingUsers;
@override@JsonKey() List<User> get matchingUsers {
  if (_matchingUsers is EqualUnmodifiableListView) return _matchingUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_matchingUsers);
}

 final  List<User> _userReceivers;
@override@JsonKey() List<User> get userReceivers {
  if (_userReceivers is EqualUnmodifiableListView) return _userReceivers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userReceivers);
}


/// Create a copy of CreateTimeCapsuleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTimeCapsuleStateCopyWith<_CreateTimeCapsuleState> get copyWith => __$CreateTimeCapsuleStateCopyWithImpl<_CreateTimeCapsuleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTimeCapsuleState&&(identical(other.timeCapsule, timeCapsule) || other.timeCapsule == timeCapsule)&&(identical(other.titleError, titleError) || other.titleError == titleError)&&(identical(other.contentError, contentError) || other.contentError == contentError)&&(identical(other.deadlineError, deadlineError) || other.deadlineError == deadlineError)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.phoneNumberError, phoneNumberError) || other.phoneNumberError == phoneNumberError)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.partialUsername, partialUsername) || other.partialUsername == partialUsername)&&(identical(other.formError, formError) || other.formError == formError)&&const DeepCollectionEquality().equals(other._matchingUsers, _matchingUsers)&&const DeepCollectionEquality().equals(other._userReceivers, _userReceivers));
}


@override
int get hashCode => Object.hash(runtimeType,timeCapsule,titleError,contentError,deadlineError,phoneNumber,phoneNumberError,email,emailError,partialUsername,formError,const DeepCollectionEquality().hash(_matchingUsers),const DeepCollectionEquality().hash(_userReceivers));

@override
String toString() {
  return 'CreateTimeCapsuleState(timeCapsule: $timeCapsule, titleError: $titleError, contentError: $contentError, deadlineError: $deadlineError, phoneNumber: $phoneNumber, phoneNumberError: $phoneNumberError, email: $email, emailError: $emailError, partialUsername: $partialUsername, formError: $formError, matchingUsers: $matchingUsers, userReceivers: $userReceivers)';
}


}

/// @nodoc
abstract mixin class _$CreateTimeCapsuleStateCopyWith<$Res> implements $CreateTimeCapsuleStateCopyWith<$Res> {
  factory _$CreateTimeCapsuleStateCopyWith(_CreateTimeCapsuleState value, $Res Function(_CreateTimeCapsuleState) _then) = __$CreateTimeCapsuleStateCopyWithImpl;
@override @useResult
$Res call({
 TimeCapsule? timeCapsule, String titleError, String contentError, String deadlineError, String phoneNumber, String phoneNumberError, String email, String emailError, String partialUsername, String formError, List<User> matchingUsers, List<User> userReceivers
});


@override $TimeCapsuleCopyWith<$Res>? get timeCapsule;

}
/// @nodoc
class __$CreateTimeCapsuleStateCopyWithImpl<$Res>
    implements _$CreateTimeCapsuleStateCopyWith<$Res> {
  __$CreateTimeCapsuleStateCopyWithImpl(this._self, this._then);

  final _CreateTimeCapsuleState _self;
  final $Res Function(_CreateTimeCapsuleState) _then;

/// Create a copy of CreateTimeCapsuleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timeCapsule = freezed,Object? titleError = null,Object? contentError = null,Object? deadlineError = null,Object? phoneNumber = null,Object? phoneNumberError = null,Object? email = null,Object? emailError = null,Object? partialUsername = null,Object? formError = null,Object? matchingUsers = null,Object? userReceivers = null,}) {
  return _then(_CreateTimeCapsuleState(
timeCapsule: freezed == timeCapsule ? _self.timeCapsule : timeCapsule // ignore: cast_nullable_to_non_nullable
as TimeCapsule?,titleError: null == titleError ? _self.titleError : titleError // ignore: cast_nullable_to_non_nullable
as String,contentError: null == contentError ? _self.contentError : contentError // ignore: cast_nullable_to_non_nullable
as String,deadlineError: null == deadlineError ? _self.deadlineError : deadlineError // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,phoneNumberError: null == phoneNumberError ? _self.phoneNumberError : phoneNumberError // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailError: null == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String,partialUsername: null == partialUsername ? _self.partialUsername : partialUsername // ignore: cast_nullable_to_non_nullable
as String,formError: null == formError ? _self.formError : formError // ignore: cast_nullable_to_non_nullable
as String,matchingUsers: null == matchingUsers ? _self._matchingUsers : matchingUsers // ignore: cast_nullable_to_non_nullable
as List<User>,userReceivers: null == userReceivers ? _self._userReceivers : userReceivers // ignore: cast_nullable_to_non_nullable
as List<User>,
  ));
}

/// Create a copy of CreateTimeCapsuleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCapsuleCopyWith<$Res>? get timeCapsule {
    if (_self.timeCapsule == null) {
    return null;
  }

  return $TimeCapsuleCopyWith<$Res>(_self.timeCapsule!, (value) {
    return _then(_self.copyWith(timeCapsule: value));
  });
}
}

// dart format on
