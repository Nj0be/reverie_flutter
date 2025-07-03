// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_diaries_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AllDiariesState {

 List<Diary> get diaries; Map<String, DiaryCover> get diaryCoversMap; bool get deleteDialogState; int get currentIndex;
/// Create a copy of AllDiariesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllDiariesStateCopyWith<AllDiariesState> get copyWith => _$AllDiariesStateCopyWithImpl<AllDiariesState>(this as AllDiariesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllDiariesState&&const DeepCollectionEquality().equals(other.diaries, diaries)&&const DeepCollectionEquality().equals(other.diaryCoversMap, diaryCoversMap)&&(identical(other.deleteDialogState, deleteDialogState) || other.deleteDialogState == deleteDialogState)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(diaries),const DeepCollectionEquality().hash(diaryCoversMap),deleteDialogState,currentIndex);

@override
String toString() {
  return 'AllDiariesState(diaries: $diaries, diaryCoversMap: $diaryCoversMap, deleteDialogState: $deleteDialogState, currentIndex: $currentIndex)';
}


}

/// @nodoc
abstract mixin class $AllDiariesStateCopyWith<$Res>  {
  factory $AllDiariesStateCopyWith(AllDiariesState value, $Res Function(AllDiariesState) _then) = _$AllDiariesStateCopyWithImpl;
@useResult
$Res call({
 List<Diary> diaries, Map<String, DiaryCover> diaryCoversMap, bool deleteDialogState, int currentIndex
});




}
/// @nodoc
class _$AllDiariesStateCopyWithImpl<$Res>
    implements $AllDiariesStateCopyWith<$Res> {
  _$AllDiariesStateCopyWithImpl(this._self, this._then);

  final AllDiariesState _self;
  final $Res Function(AllDiariesState) _then;

/// Create a copy of AllDiariesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? diaries = null,Object? diaryCoversMap = null,Object? deleteDialogState = null,Object? currentIndex = null,}) {
  return _then(_self.copyWith(
diaries: null == diaries ? _self.diaries : diaries // ignore: cast_nullable_to_non_nullable
as List<Diary>,diaryCoversMap: null == diaryCoversMap ? _self.diaryCoversMap : diaryCoversMap // ignore: cast_nullable_to_non_nullable
as Map<String, DiaryCover>,deleteDialogState: null == deleteDialogState ? _self.deleteDialogState : deleteDialogState // ignore: cast_nullable_to_non_nullable
as bool,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _AllDiariesState implements AllDiariesState {
  const _AllDiariesState({final  List<Diary> diaries = const [], final  Map<String, DiaryCover> diaryCoversMap = const {}, this.deleteDialogState = false, this.currentIndex = 0}): _diaries = diaries,_diaryCoversMap = diaryCoversMap;
  

 final  List<Diary> _diaries;
@override@JsonKey() List<Diary> get diaries {
  if (_diaries is EqualUnmodifiableListView) return _diaries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_diaries);
}

 final  Map<String, DiaryCover> _diaryCoversMap;
@override@JsonKey() Map<String, DiaryCover> get diaryCoversMap {
  if (_diaryCoversMap is EqualUnmodifiableMapView) return _diaryCoversMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_diaryCoversMap);
}

@override@JsonKey() final  bool deleteDialogState;
@override@JsonKey() final  int currentIndex;

/// Create a copy of AllDiariesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AllDiariesStateCopyWith<_AllDiariesState> get copyWith => __$AllDiariesStateCopyWithImpl<_AllDiariesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllDiariesState&&const DeepCollectionEquality().equals(other._diaries, _diaries)&&const DeepCollectionEquality().equals(other._diaryCoversMap, _diaryCoversMap)&&(identical(other.deleteDialogState, deleteDialogState) || other.deleteDialogState == deleteDialogState)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_diaries),const DeepCollectionEquality().hash(_diaryCoversMap),deleteDialogState,currentIndex);

@override
String toString() {
  return 'AllDiariesState(diaries: $diaries, diaryCoversMap: $diaryCoversMap, deleteDialogState: $deleteDialogState, currentIndex: $currentIndex)';
}


}

/// @nodoc
abstract mixin class _$AllDiariesStateCopyWith<$Res> implements $AllDiariesStateCopyWith<$Res> {
  factory _$AllDiariesStateCopyWith(_AllDiariesState value, $Res Function(_AllDiariesState) _then) = __$AllDiariesStateCopyWithImpl;
@override @useResult
$Res call({
 List<Diary> diaries, Map<String, DiaryCover> diaryCoversMap, bool deleteDialogState, int currentIndex
});




}
/// @nodoc
class __$AllDiariesStateCopyWithImpl<$Res>
    implements _$AllDiariesStateCopyWith<$Res> {
  __$AllDiariesStateCopyWithImpl(this._self, this._then);

  final _AllDiariesState _self;
  final $Res Function(_AllDiariesState) _then;

/// Create a copy of AllDiariesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? diaries = null,Object? diaryCoversMap = null,Object? deleteDialogState = null,Object? currentIndex = null,}) {
  return _then(_AllDiariesState(
diaries: null == diaries ? _self._diaries : diaries // ignore: cast_nullable_to_non_nullable
as List<Diary>,diaryCoversMap: null == diaryCoversMap ? _self._diaryCoversMap : diaryCoversMap // ignore: cast_nullable_to_non_nullable
as Map<String, DiaryCover>,deleteDialogState: null == deleteDialogState ? _self.deleteDialogState : deleteDialogState // ignore: cast_nullable_to_non_nullable
as bool,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
