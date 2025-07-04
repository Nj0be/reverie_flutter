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

 Diary get diary; PageController get pageController; GlobalKey<State<StatefulWidget>> get pageKey; Map<String, DiaryPage> get pagesMap; TextStyle get textStyle;
/// Create a copy of ViewDiaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewDiaryStateCopyWith<ViewDiaryState> get copyWith => _$ViewDiaryStateCopyWithImpl<ViewDiaryState>(this as ViewDiaryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewDiaryState&&(identical(other.diary, diary) || other.diary == diary)&&(identical(other.pageController, pageController) || other.pageController == pageController)&&(identical(other.pageKey, pageKey) || other.pageKey == pageKey)&&const DeepCollectionEquality().equals(other.pagesMap, pagesMap)&&(identical(other.textStyle, textStyle) || other.textStyle == textStyle));
}


@override
int get hashCode => Object.hash(runtimeType,diary,pageController,pageKey,const DeepCollectionEquality().hash(pagesMap),textStyle);

@override
String toString() {
  return 'ViewDiaryState(diary: $diary, pageController: $pageController, pageKey: $pageKey, pagesMap: $pagesMap, textStyle: $textStyle)';
}


}

/// @nodoc
abstract mixin class $ViewDiaryStateCopyWith<$Res>  {
  factory $ViewDiaryStateCopyWith(ViewDiaryState value, $Res Function(ViewDiaryState) _then) = _$ViewDiaryStateCopyWithImpl;
@useResult
$Res call({
 Diary? diary, Map<String, DiaryPage> pagesMap, PageController? pageController, TextStyle textStyle, GlobalKey<State<StatefulWidget>>? pageKey
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
@pragma('vm:prefer-inline') @override $Res call({Object? diary = freezed,Object? pagesMap = null,Object? pageController = freezed,Object? textStyle = null,Object? pageKey = freezed,}) {
  return _then(_self.copyWith(
diary: freezed == diary ? _self.diary! : diary // ignore: cast_nullable_to_non_nullable
as Diary?,pagesMap: null == pagesMap ? _self.pagesMap : pagesMap // ignore: cast_nullable_to_non_nullable
as Map<String, DiaryPage>,pageController: freezed == pageController ? _self.pageController! : pageController // ignore: cast_nullable_to_non_nullable
as PageController?,textStyle: null == textStyle ? _self.textStyle : textStyle // ignore: cast_nullable_to_non_nullable
as TextStyle,pageKey: freezed == pageKey ? _self.pageKey! : pageKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<State<StatefulWidget>>?,
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
   _ViewDiaryState({final  Diary? diary, final  Map<String, DiaryPage> pagesMap = const {}, final  PageController? pageController, this.textStyle = const TextStyle(fontSize: 25, color: Colors.black), final  GlobalKey<State<StatefulWidget>>? pageKey}): _pagesMap = pagesMap,super._(diary: diary, pageController: pageController, pageKey: pageKey);
  

 final  Map<String, DiaryPage> _pagesMap;
@override@JsonKey() Map<String, DiaryPage> get pagesMap {
  if (_pagesMap is EqualUnmodifiableMapView) return _pagesMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_pagesMap);
}

@override@JsonKey() final  TextStyle textStyle;

/// Create a copy of ViewDiaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewDiaryStateCopyWith<_ViewDiaryState> get copyWith => __$ViewDiaryStateCopyWithImpl<_ViewDiaryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewDiaryState&&(identical(other.diary, diary) || other.diary == diary)&&const DeepCollectionEquality().equals(other._pagesMap, _pagesMap)&&(identical(other.pageController, pageController) || other.pageController == pageController)&&(identical(other.textStyle, textStyle) || other.textStyle == textStyle)&&(identical(other.pageKey, pageKey) || other.pageKey == pageKey));
}


@override
int get hashCode => Object.hash(runtimeType,diary,const DeepCollectionEquality().hash(_pagesMap),pageController,textStyle,pageKey);

@override
String toString() {
  return 'ViewDiaryState(diary: $diary, pagesMap: $pagesMap, pageController: $pageController, textStyle: $textStyle, pageKey: $pageKey)';
}


}

/// @nodoc
abstract mixin class _$ViewDiaryStateCopyWith<$Res> implements $ViewDiaryStateCopyWith<$Res> {
  factory _$ViewDiaryStateCopyWith(_ViewDiaryState value, $Res Function(_ViewDiaryState) _then) = __$ViewDiaryStateCopyWithImpl;
@override @useResult
$Res call({
 Diary? diary, Map<String, DiaryPage> pagesMap, PageController? pageController, TextStyle textStyle, GlobalKey<State<StatefulWidget>>? pageKey
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
@override @pragma('vm:prefer-inline') $Res call({Object? diary = freezed,Object? pagesMap = null,Object? pageController = freezed,Object? textStyle = null,Object? pageKey = freezed,}) {
  return _then(_ViewDiaryState(
diary: freezed == diary ? _self.diary : diary // ignore: cast_nullable_to_non_nullable
as Diary?,pagesMap: null == pagesMap ? _self._pagesMap : pagesMap // ignore: cast_nullable_to_non_nullable
as Map<String, DiaryPage>,pageController: freezed == pageController ? _self.pageController : pageController // ignore: cast_nullable_to_non_nullable
as PageController?,textStyle: null == textStyle ? _self.textStyle : textStyle // ignore: cast_nullable_to_non_nullable
as TextStyle,pageKey: freezed == pageKey ? _self.pageKey : pageKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<State<StatefulWidget>>?,
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
mixin _$ViewDiaryParams {

 String get diaryId; Size get pageSize;
/// Create a copy of ViewDiaryParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewDiaryParamsCopyWith<ViewDiaryParams> get copyWith => _$ViewDiaryParamsCopyWithImpl<ViewDiaryParams>(this as ViewDiaryParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewDiaryParams&&(identical(other.diaryId, diaryId) || other.diaryId == diaryId)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}


@override
int get hashCode => Object.hash(runtimeType,diaryId,pageSize);

@override
String toString() {
  return 'ViewDiaryParams(diaryId: $diaryId, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $ViewDiaryParamsCopyWith<$Res>  {
  factory $ViewDiaryParamsCopyWith(ViewDiaryParams value, $Res Function(ViewDiaryParams) _then) = _$ViewDiaryParamsCopyWithImpl;
@useResult
$Res call({
 String diaryId, Size pageSize
});




}
/// @nodoc
class _$ViewDiaryParamsCopyWithImpl<$Res>
    implements $ViewDiaryParamsCopyWith<$Res> {
  _$ViewDiaryParamsCopyWithImpl(this._self, this._then);

  final ViewDiaryParams _self;
  final $Res Function(ViewDiaryParams) _then;

/// Create a copy of ViewDiaryParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? diaryId = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
diaryId: null == diaryId ? _self.diaryId : diaryId // ignore: cast_nullable_to_non_nullable
as String,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as Size,
  ));
}

}


/// @nodoc


class _ViewDiaryParams implements ViewDiaryParams {
   _ViewDiaryParams({this.diaryId = '', this.pageSize = const Size(0, 0)});
  

@override@JsonKey() final  String diaryId;
@override@JsonKey() final  Size pageSize;

/// Create a copy of ViewDiaryParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewDiaryParamsCopyWith<_ViewDiaryParams> get copyWith => __$ViewDiaryParamsCopyWithImpl<_ViewDiaryParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewDiaryParams&&(identical(other.diaryId, diaryId) || other.diaryId == diaryId)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}


@override
int get hashCode => Object.hash(runtimeType,diaryId,pageSize);

@override
String toString() {
  return 'ViewDiaryParams(diaryId: $diaryId, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$ViewDiaryParamsCopyWith<$Res> implements $ViewDiaryParamsCopyWith<$Res> {
  factory _$ViewDiaryParamsCopyWith(_ViewDiaryParams value, $Res Function(_ViewDiaryParams) _then) = __$ViewDiaryParamsCopyWithImpl;
@override @useResult
$Res call({
 String diaryId, Size pageSize
});




}
/// @nodoc
class __$ViewDiaryParamsCopyWithImpl<$Res>
    implements _$ViewDiaryParamsCopyWith<$Res> {
  __$ViewDiaryParamsCopyWithImpl(this._self, this._then);

  final _ViewDiaryParams _self;
  final $Res Function(_ViewDiaryParams) _then;

/// Create a copy of ViewDiaryParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? diaryId = null,Object? pageSize = null,}) {
  return _then(_ViewDiaryParams(
diaryId: null == diaryId ? _self.diaryId : diaryId // ignore: cast_nullable_to_non_nullable
as String,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as Size,
  ));
}


}

// dart format on
