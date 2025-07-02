// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_diary_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ViewDiaryState {

 Diary get diary; Map<String, DiaryPage> get pagesMap; Map<String, DiarySubPage> get subPagesMap;
/// Create a copy of ViewDiaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewDiaryStateCopyWith<ViewDiaryState> get copyWith => _$ViewDiaryStateCopyWithImpl<ViewDiaryState>(this as ViewDiaryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewDiaryState&&(identical(other.diary, diary) || other.diary == diary)&&const DeepCollectionEquality().equals(other.pagesMap, pagesMap)&&const DeepCollectionEquality().equals(other.subPagesMap, subPagesMap));
}


@override
int get hashCode => Object.hash(runtimeType,diary,const DeepCollectionEquality().hash(pagesMap),const DeepCollectionEquality().hash(subPagesMap));

@override
String toString() {
  return 'ViewDiaryState(diary: $diary, pagesMap: $pagesMap, subPagesMap: $subPagesMap)';
}


}

/// @nodoc
abstract mixin class $ViewDiaryStateCopyWith<$Res>  {
  factory $ViewDiaryStateCopyWith(ViewDiaryState value, $Res Function(ViewDiaryState) _then) = _$ViewDiaryStateCopyWithImpl;
@useResult
$Res call({
 Diary? diary, Map<String, DiaryPage> pagesMap, Map<String, DiarySubPage> subPagesMap
});


$DiaryCopyWith<$Res>? get diary;

}
/// @nodoc
class _$ViewDiaryStateCopyWithImpl<$Res>
    implements $ViewDiaryStateCopyWith<$Res> {
  _$ViewDiaryStateCopyWithImpl(this._self, this._then);

  final ViewDiaryState _self;
  final $Res Function(ViewDiaryState) _then;

/// Create a copy of ViewDiaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? diary = freezed,Object? pagesMap = null,Object? subPagesMap = null,}) {
  return _then(_self.copyWith(
diary: freezed == diary ? _self.diary! : diary // ignore: cast_nullable_to_non_nullable
as Diary?,pagesMap: null == pagesMap ? _self.pagesMap : pagesMap // ignore: cast_nullable_to_non_nullable
as Map<String, DiaryPage>,subPagesMap: null == subPagesMap ? _self.subPagesMap : subPagesMap // ignore: cast_nullable_to_non_nullable
as Map<String, DiarySubPage>,
  ));
}
/// Create a copy of ViewDiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryCopyWith<$Res>? get diary {
    if (_self.diary == null) {
    return null;
  }

  return $DiaryCopyWith<$Res>(_self.diary!, (value) {
    return _then(_self.copyWith(diary: value));
  });
}
}


/// @nodoc

@override
class _ViewDiaryState extends ViewDiaryState {
   _ViewDiaryState({final  Diary? diary, final  Map<String, DiaryPage> pagesMap = const {}, final  Map<String, DiarySubPage> subPagesMap = const {}}): _pagesMap = pagesMap,_subPagesMap = subPagesMap,super._(diary: diary);
  

 final  Map<String, DiaryPage> _pagesMap;
@override@JsonKey() Map<String, DiaryPage> get pagesMap {
  if (_pagesMap is EqualUnmodifiableMapView) return _pagesMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_pagesMap);
}

 final  Map<String, DiarySubPage> _subPagesMap;
@override@JsonKey() Map<String, DiarySubPage> get subPagesMap {
  if (_subPagesMap is EqualUnmodifiableMapView) return _subPagesMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_subPagesMap);
}


/// Create a copy of ViewDiaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewDiaryStateCopyWith<_ViewDiaryState> get copyWith => __$ViewDiaryStateCopyWithImpl<_ViewDiaryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewDiaryState&&(identical(other.diary, diary) || other.diary == diary)&&const DeepCollectionEquality().equals(other._pagesMap, _pagesMap)&&const DeepCollectionEquality().equals(other._subPagesMap, _subPagesMap));
}


@override
int get hashCode => Object.hash(runtimeType,diary,const DeepCollectionEquality().hash(_pagesMap),const DeepCollectionEquality().hash(_subPagesMap));

@override
String toString() {
  return 'ViewDiaryState(diary: $diary, pagesMap: $pagesMap, subPagesMap: $subPagesMap)';
}


}

/// @nodoc
abstract mixin class _$ViewDiaryStateCopyWith<$Res> implements $ViewDiaryStateCopyWith<$Res> {
  factory _$ViewDiaryStateCopyWith(_ViewDiaryState value, $Res Function(_ViewDiaryState) _then) = __$ViewDiaryStateCopyWithImpl;
@override @useResult
$Res call({
 Diary? diary, Map<String, DiaryPage> pagesMap, Map<String, DiarySubPage> subPagesMap
});


@override $DiaryCopyWith<$Res>? get diary;

}
/// @nodoc
class __$ViewDiaryStateCopyWithImpl<$Res>
    implements _$ViewDiaryStateCopyWith<$Res> {
  __$ViewDiaryStateCopyWithImpl(this._self, this._then);

  final _ViewDiaryState _self;
  final $Res Function(_ViewDiaryState) _then;

/// Create a copy of ViewDiaryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? diary = freezed,Object? pagesMap = null,Object? subPagesMap = null,}) {
  return _then(_ViewDiaryState(
diary: freezed == diary ? _self.diary : diary // ignore: cast_nullable_to_non_nullable
as Diary?,pagesMap: null == pagesMap ? _self._pagesMap : pagesMap // ignore: cast_nullable_to_non_nullable
as Map<String, DiaryPage>,subPagesMap: null == subPagesMap ? _self._subPagesMap : subPagesMap // ignore: cast_nullable_to_non_nullable
as Map<String, DiarySubPage>,
  ));
}

/// Create a copy of ViewDiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryCopyWith<$Res>? get diary {
    if (_self.diary == null) {
    return null;
  }

  return $DiaryCopyWith<$Res>(_self.diary!, (value) {
    return _then(_self.copyWith(diary: value));
  });
}
}

// dart format on
