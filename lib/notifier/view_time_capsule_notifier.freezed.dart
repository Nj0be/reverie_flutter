// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_time_capsule_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ViewTimeCapsuleState {

 TimeCapsule get timeCapsule; TimeCapsuleType get timeCapsuleType; List<Username> get receiversUsername;
/// Create a copy of ViewTimeCapsuleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewTimeCapsuleStateCopyWith<ViewTimeCapsuleState> get copyWith => _$ViewTimeCapsuleStateCopyWithImpl<ViewTimeCapsuleState>(this as ViewTimeCapsuleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewTimeCapsuleState&&(identical(other.timeCapsule, timeCapsule) || other.timeCapsule == timeCapsule)&&(identical(other.timeCapsuleType, timeCapsuleType) || other.timeCapsuleType == timeCapsuleType)&&const DeepCollectionEquality().equals(other.receiversUsername, receiversUsername));
}


@override
int get hashCode => Object.hash(runtimeType,timeCapsule,timeCapsuleType,const DeepCollectionEquality().hash(receiversUsername));

@override
String toString() {
  return 'ViewTimeCapsuleState(timeCapsule: $timeCapsule, timeCapsuleType: $timeCapsuleType, receiversUsername: $receiversUsername)';
}


}

/// @nodoc
abstract mixin class $ViewTimeCapsuleStateCopyWith<$Res>  {
  factory $ViewTimeCapsuleStateCopyWith(ViewTimeCapsuleState value, $Res Function(ViewTimeCapsuleState) _then) = _$ViewTimeCapsuleStateCopyWithImpl;
@useResult
$Res call({
 TimeCapsule? timeCapsule, TimeCapsuleType timeCapsuleType, List<Username> receiversUsername
});


$TimeCapsuleCopyWith<$Res>? get timeCapsule;

}
/// @nodoc
class _$ViewTimeCapsuleStateCopyWithImpl<$Res>
    implements $ViewTimeCapsuleStateCopyWith<$Res> {
  _$ViewTimeCapsuleStateCopyWithImpl(this._self, this._then);

  final ViewTimeCapsuleState _self;
  final $Res Function(ViewTimeCapsuleState) _then;

/// Create a copy of ViewTimeCapsuleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timeCapsule = freezed,Object? timeCapsuleType = null,Object? receiversUsername = null,}) {
  return _then(_self.copyWith(
timeCapsule: freezed == timeCapsule ? _self.timeCapsule! : timeCapsule // ignore: cast_nullable_to_non_nullable
as TimeCapsule?,timeCapsuleType: null == timeCapsuleType ? _self.timeCapsuleType : timeCapsuleType // ignore: cast_nullable_to_non_nullable
as TimeCapsuleType,receiversUsername: null == receiversUsername ? _self.receiversUsername : receiversUsername // ignore: cast_nullable_to_non_nullable
as List<Username>,
  ));
}
/// Create a copy of ViewTimeCapsuleState
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


/// @nodoc


class _ViewTimeCapsuleState extends ViewTimeCapsuleState {
   _ViewTimeCapsuleState({final  TimeCapsule? timeCapsule, this.timeCapsuleType = TimeCapsuleType.scheduled, final  List<Username> receiversUsername = const []}): _receiversUsername = receiversUsername,super._(timeCapsule: timeCapsule);
  

@override@JsonKey() final  TimeCapsuleType timeCapsuleType;
 final  List<Username> _receiversUsername;
@override@JsonKey() List<Username> get receiversUsername {
  if (_receiversUsername is EqualUnmodifiableListView) return _receiversUsername;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_receiversUsername);
}


/// Create a copy of ViewTimeCapsuleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewTimeCapsuleStateCopyWith<_ViewTimeCapsuleState> get copyWith => __$ViewTimeCapsuleStateCopyWithImpl<_ViewTimeCapsuleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewTimeCapsuleState&&(identical(other.timeCapsule, timeCapsule) || other.timeCapsule == timeCapsule)&&(identical(other.timeCapsuleType, timeCapsuleType) || other.timeCapsuleType == timeCapsuleType)&&const DeepCollectionEquality().equals(other._receiversUsername, _receiversUsername));
}


@override
int get hashCode => Object.hash(runtimeType,timeCapsule,timeCapsuleType,const DeepCollectionEquality().hash(_receiversUsername));

@override
String toString() {
  return 'ViewTimeCapsuleState(timeCapsule: $timeCapsule, timeCapsuleType: $timeCapsuleType, receiversUsername: $receiversUsername)';
}


}

/// @nodoc
abstract mixin class _$ViewTimeCapsuleStateCopyWith<$Res> implements $ViewTimeCapsuleStateCopyWith<$Res> {
  factory _$ViewTimeCapsuleStateCopyWith(_ViewTimeCapsuleState value, $Res Function(_ViewTimeCapsuleState) _then) = __$ViewTimeCapsuleStateCopyWithImpl;
@override @useResult
$Res call({
 TimeCapsule? timeCapsule, TimeCapsuleType timeCapsuleType, List<Username> receiversUsername
});


@override $TimeCapsuleCopyWith<$Res>? get timeCapsule;

}
/// @nodoc
class __$ViewTimeCapsuleStateCopyWithImpl<$Res>
    implements _$ViewTimeCapsuleStateCopyWith<$Res> {
  __$ViewTimeCapsuleStateCopyWithImpl(this._self, this._then);

  final _ViewTimeCapsuleState _self;
  final $Res Function(_ViewTimeCapsuleState) _then;

/// Create a copy of ViewTimeCapsuleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timeCapsule = freezed,Object? timeCapsuleType = null,Object? receiversUsername = null,}) {
  return _then(_ViewTimeCapsuleState(
timeCapsule: freezed == timeCapsule ? _self.timeCapsule : timeCapsule // ignore: cast_nullable_to_non_nullable
as TimeCapsule?,timeCapsuleType: null == timeCapsuleType ? _self.timeCapsuleType : timeCapsuleType // ignore: cast_nullable_to_non_nullable
as TimeCapsuleType,receiversUsername: null == receiversUsername ? _self._receiversUsername : receiversUsername // ignore: cast_nullable_to_non_nullable
as List<Username>,
  ));
}

/// Create a copy of ViewTimeCapsuleState
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

/// @nodoc
mixin _$ViewTimeCapsuleParams {

 String get timeCapsuleId; TimeCapsuleType get timeCapsuleType;
/// Create a copy of ViewTimeCapsuleParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewTimeCapsuleParamsCopyWith<ViewTimeCapsuleParams> get copyWith => _$ViewTimeCapsuleParamsCopyWithImpl<ViewTimeCapsuleParams>(this as ViewTimeCapsuleParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewTimeCapsuleParams&&(identical(other.timeCapsuleId, timeCapsuleId) || other.timeCapsuleId == timeCapsuleId)&&(identical(other.timeCapsuleType, timeCapsuleType) || other.timeCapsuleType == timeCapsuleType));
}


@override
int get hashCode => Object.hash(runtimeType,timeCapsuleId,timeCapsuleType);

@override
String toString() {
  return 'ViewTimeCapsuleParams(timeCapsuleId: $timeCapsuleId, timeCapsuleType: $timeCapsuleType)';
}


}

/// @nodoc
abstract mixin class $ViewTimeCapsuleParamsCopyWith<$Res>  {
  factory $ViewTimeCapsuleParamsCopyWith(ViewTimeCapsuleParams value, $Res Function(ViewTimeCapsuleParams) _then) = _$ViewTimeCapsuleParamsCopyWithImpl;
@useResult
$Res call({
 String timeCapsuleId, TimeCapsuleType timeCapsuleType
});




}
/// @nodoc
class _$ViewTimeCapsuleParamsCopyWithImpl<$Res>
    implements $ViewTimeCapsuleParamsCopyWith<$Res> {
  _$ViewTimeCapsuleParamsCopyWithImpl(this._self, this._then);

  final ViewTimeCapsuleParams _self;
  final $Res Function(ViewTimeCapsuleParams) _then;

/// Create a copy of ViewTimeCapsuleParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timeCapsuleId = null,Object? timeCapsuleType = null,}) {
  return _then(_self.copyWith(
timeCapsuleId: null == timeCapsuleId ? _self.timeCapsuleId : timeCapsuleId // ignore: cast_nullable_to_non_nullable
as String,timeCapsuleType: null == timeCapsuleType ? _self.timeCapsuleType : timeCapsuleType // ignore: cast_nullable_to_non_nullable
as TimeCapsuleType,
  ));
}

}


/// @nodoc


class _ViewTimeCapsuleParams implements ViewTimeCapsuleParams {
   _ViewTimeCapsuleParams({this.timeCapsuleId = '', this.timeCapsuleType = TimeCapsuleType.scheduled});
  

@override@JsonKey() final  String timeCapsuleId;
@override@JsonKey() final  TimeCapsuleType timeCapsuleType;

/// Create a copy of ViewTimeCapsuleParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewTimeCapsuleParamsCopyWith<_ViewTimeCapsuleParams> get copyWith => __$ViewTimeCapsuleParamsCopyWithImpl<_ViewTimeCapsuleParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewTimeCapsuleParams&&(identical(other.timeCapsuleId, timeCapsuleId) || other.timeCapsuleId == timeCapsuleId)&&(identical(other.timeCapsuleType, timeCapsuleType) || other.timeCapsuleType == timeCapsuleType));
}


@override
int get hashCode => Object.hash(runtimeType,timeCapsuleId,timeCapsuleType);

@override
String toString() {
  return 'ViewTimeCapsuleParams(timeCapsuleId: $timeCapsuleId, timeCapsuleType: $timeCapsuleType)';
}


}

/// @nodoc
abstract mixin class _$ViewTimeCapsuleParamsCopyWith<$Res> implements $ViewTimeCapsuleParamsCopyWith<$Res> {
  factory _$ViewTimeCapsuleParamsCopyWith(_ViewTimeCapsuleParams value, $Res Function(_ViewTimeCapsuleParams) _then) = __$ViewTimeCapsuleParamsCopyWithImpl;
@override @useResult
$Res call({
 String timeCapsuleId, TimeCapsuleType timeCapsuleType
});




}
/// @nodoc
class __$ViewTimeCapsuleParamsCopyWithImpl<$Res>
    implements _$ViewTimeCapsuleParamsCopyWith<$Res> {
  __$ViewTimeCapsuleParamsCopyWithImpl(this._self, this._then);

  final _ViewTimeCapsuleParams _self;
  final $Res Function(_ViewTimeCapsuleParams) _then;

/// Create a copy of ViewTimeCapsuleParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timeCapsuleId = null,Object? timeCapsuleType = null,}) {
  return _then(_ViewTimeCapsuleParams(
timeCapsuleId: null == timeCapsuleId ? _self.timeCapsuleId : timeCapsuleId // ignore: cast_nullable_to_non_nullable
as String,timeCapsuleType: null == timeCapsuleType ? _self.timeCapsuleType : timeCapsuleType // ignore: cast_nullable_to_non_nullable
as TimeCapsuleType,
  ));
}


}

// dart format on
