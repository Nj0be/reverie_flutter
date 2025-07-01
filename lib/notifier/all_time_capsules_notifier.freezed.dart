// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_time_capsules_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AllTimeCapsulesState {

@protected Map<String, TimeCapsule> get sentTimeCapsules;@protected Map<String, TimeCapsule> get receivedTimeCapsules; TimeCapsuleType get buttonState; String get deleteDialogCapsuleId;
/// Create a copy of AllTimeCapsulesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllTimeCapsulesStateCopyWith<AllTimeCapsulesState> get copyWith => _$AllTimeCapsulesStateCopyWithImpl<AllTimeCapsulesState>(this as AllTimeCapsulesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllTimeCapsulesState&&const DeepCollectionEquality().equals(other.sentTimeCapsules, sentTimeCapsules)&&const DeepCollectionEquality().equals(other.receivedTimeCapsules, receivedTimeCapsules)&&(identical(other.buttonState, buttonState) || other.buttonState == buttonState)&&(identical(other.deleteDialogCapsuleId, deleteDialogCapsuleId) || other.deleteDialogCapsuleId == deleteDialogCapsuleId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sentTimeCapsules),const DeepCollectionEquality().hash(receivedTimeCapsules),buttonState,deleteDialogCapsuleId);

@override
String toString() {
  return 'AllTimeCapsulesState(sentTimeCapsules: $sentTimeCapsules, receivedTimeCapsules: $receivedTimeCapsules, buttonState: $buttonState, deleteDialogCapsuleId: $deleteDialogCapsuleId)';
}


}

/// @nodoc
abstract mixin class $AllTimeCapsulesStateCopyWith<$Res>  {
  factory $AllTimeCapsulesStateCopyWith(AllTimeCapsulesState value, $Res Function(AllTimeCapsulesState) _then) = _$AllTimeCapsulesStateCopyWithImpl;
@useResult
$Res call({
@protected Map<String, TimeCapsule> sentTimeCapsules,@protected Map<String, TimeCapsule> receivedTimeCapsules, TimeCapsuleType buttonState, String deleteDialogCapsuleId
});




}
/// @nodoc
class _$AllTimeCapsulesStateCopyWithImpl<$Res>
    implements $AllTimeCapsulesStateCopyWith<$Res> {
  _$AllTimeCapsulesStateCopyWithImpl(this._self, this._then);

  final AllTimeCapsulesState _self;
  final $Res Function(AllTimeCapsulesState) _then;

/// Create a copy of AllTimeCapsulesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sentTimeCapsules = null,Object? receivedTimeCapsules = null,Object? buttonState = null,Object? deleteDialogCapsuleId = null,}) {
  return _then(_self.copyWith(
sentTimeCapsules: null == sentTimeCapsules ? _self.sentTimeCapsules : sentTimeCapsules // ignore: cast_nullable_to_non_nullable
as Map<String, TimeCapsule>,receivedTimeCapsules: null == receivedTimeCapsules ? _self.receivedTimeCapsules : receivedTimeCapsules // ignore: cast_nullable_to_non_nullable
as Map<String, TimeCapsule>,buttonState: null == buttonState ? _self.buttonState : buttonState // ignore: cast_nullable_to_non_nullable
as TimeCapsuleType,deleteDialogCapsuleId: null == deleteDialogCapsuleId ? _self.deleteDialogCapsuleId : deleteDialogCapsuleId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _AllTimeCapsulesState extends AllTimeCapsulesState {
  const _AllTimeCapsulesState({@protected final  Map<String, TimeCapsule> sentTimeCapsules = const {}, @protected final  Map<String, TimeCapsule> receivedTimeCapsules = const {}, this.buttonState = TimeCapsuleType.scheduled, this.deleteDialogCapsuleId = ""}): _sentTimeCapsules = sentTimeCapsules,_receivedTimeCapsules = receivedTimeCapsules,super._();
  

 final  Map<String, TimeCapsule> _sentTimeCapsules;
@override@JsonKey()@protected Map<String, TimeCapsule> get sentTimeCapsules {
  if (_sentTimeCapsules is EqualUnmodifiableMapView) return _sentTimeCapsules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_sentTimeCapsules);
}

 final  Map<String, TimeCapsule> _receivedTimeCapsules;
@override@JsonKey()@protected Map<String, TimeCapsule> get receivedTimeCapsules {
  if (_receivedTimeCapsules is EqualUnmodifiableMapView) return _receivedTimeCapsules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_receivedTimeCapsules);
}

@override@JsonKey() final  TimeCapsuleType buttonState;
@override@JsonKey() final  String deleteDialogCapsuleId;

/// Create a copy of AllTimeCapsulesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AllTimeCapsulesStateCopyWith<_AllTimeCapsulesState> get copyWith => __$AllTimeCapsulesStateCopyWithImpl<_AllTimeCapsulesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllTimeCapsulesState&&const DeepCollectionEquality().equals(other._sentTimeCapsules, _sentTimeCapsules)&&const DeepCollectionEquality().equals(other._receivedTimeCapsules, _receivedTimeCapsules)&&(identical(other.buttonState, buttonState) || other.buttonState == buttonState)&&(identical(other.deleteDialogCapsuleId, deleteDialogCapsuleId) || other.deleteDialogCapsuleId == deleteDialogCapsuleId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sentTimeCapsules),const DeepCollectionEquality().hash(_receivedTimeCapsules),buttonState,deleteDialogCapsuleId);

@override
String toString() {
  return 'AllTimeCapsulesState(sentTimeCapsules: $sentTimeCapsules, receivedTimeCapsules: $receivedTimeCapsules, buttonState: $buttonState, deleteDialogCapsuleId: $deleteDialogCapsuleId)';
}


}

/// @nodoc
abstract mixin class _$AllTimeCapsulesStateCopyWith<$Res> implements $AllTimeCapsulesStateCopyWith<$Res> {
  factory _$AllTimeCapsulesStateCopyWith(_AllTimeCapsulesState value, $Res Function(_AllTimeCapsulesState) _then) = __$AllTimeCapsulesStateCopyWithImpl;
@override @useResult
$Res call({
@protected Map<String, TimeCapsule> sentTimeCapsules,@protected Map<String, TimeCapsule> receivedTimeCapsules, TimeCapsuleType buttonState, String deleteDialogCapsuleId
});




}
/// @nodoc
class __$AllTimeCapsulesStateCopyWithImpl<$Res>
    implements _$AllTimeCapsulesStateCopyWith<$Res> {
  __$AllTimeCapsulesStateCopyWithImpl(this._self, this._then);

  final _AllTimeCapsulesState _self;
  final $Res Function(_AllTimeCapsulesState) _then;

/// Create a copy of AllTimeCapsulesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sentTimeCapsules = null,Object? receivedTimeCapsules = null,Object? buttonState = null,Object? deleteDialogCapsuleId = null,}) {
  return _then(_AllTimeCapsulesState(
sentTimeCapsules: null == sentTimeCapsules ? _self._sentTimeCapsules : sentTimeCapsules // ignore: cast_nullable_to_non_nullable
as Map<String, TimeCapsule>,receivedTimeCapsules: null == receivedTimeCapsules ? _self._receivedTimeCapsules : receivedTimeCapsules // ignore: cast_nullable_to_non_nullable
as Map<String, TimeCapsule>,buttonState: null == buttonState ? _self.buttonState : buttonState // ignore: cast_nullable_to_non_nullable
as TimeCapsuleType,deleteDialogCapsuleId: null == deleteDialogCapsuleId ? _self.deleteDialogCapsuleId : deleteDialogCapsuleId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
