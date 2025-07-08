// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 Diary get diary; PageController get pageController; GlobalKey<State<StatefulWidget>> get pageKey; Map<String, DiaryPage> get pagesMap; TextScaler get textScaler;
/// Create a copy of ViewDiaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewDiaryStateCopyWith<ViewDiaryState> get copyWith => _$ViewDiaryStateCopyWithImpl<ViewDiaryState>(this as ViewDiaryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewDiaryState&&(identical(other.diary, diary) || other.diary == diary)&&(identical(other.pageController, pageController) || other.pageController == pageController)&&(identical(other.pageKey, pageKey) || other.pageKey == pageKey)&&const DeepCollectionEquality().equals(other.pagesMap, pagesMap)&&(identical(other.textScaler, textScaler) || other.textScaler == textScaler));
}


@override
int get hashCode => Object.hash(runtimeType,diary,pageController,pageKey,const DeepCollectionEquality().hash(pagesMap),textScaler);

@override
String toString() {
  return 'ViewDiaryState(diary: $diary, pageController: $pageController, pageKey: $pageKey, pagesMap: $pagesMap, textScaler: $textScaler)';
}


}

/// @nodoc
abstract mixin class $ViewDiaryStateCopyWith<$Res>  {
  factory $ViewDiaryStateCopyWith(ViewDiaryState value, $Res Function(ViewDiaryState) _then) = _$ViewDiaryStateCopyWithImpl;
@useResult
$Res call({
 Diary? diary, Map<String, DiaryPage> pagesMap, PageController? pageController, GlobalKey<State<StatefulWidget>>? pageKey, TextScaler textScaler
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
@pragma('vm:prefer-inline') @override $Res call({Object? diary = freezed,Object? pagesMap = null,Object? pageController = freezed,Object? pageKey = freezed,Object? textScaler = null,}) {
  return _then(_self.copyWith(
diary: freezed == diary ? _self.diary : diary // ignore: cast_nullable_to_non_nullable
as Diary?,pagesMap: null == pagesMap ? _self.pagesMap : pagesMap // ignore: cast_nullable_to_non_nullable
as Map<String, DiaryPage>,pageController: freezed == pageController ? _self.pageController : pageController // ignore: cast_nullable_to_non_nullable
as PageController?,pageKey: freezed == pageKey ? _self.pageKey : pageKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<State<StatefulWidget>>?,textScaler: null == textScaler ? _self.textScaler : textScaler // ignore: cast_nullable_to_non_nullable
as TextScaler,
  ));
}
/// Create a copy of ViewDiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryCopyWith<$Res>? get diary {
    return $DiaryCopyWith<$Res>(_self.diary, (value) {
    return _then(_self.copyWith(diary: value));
  });
}
}


/// Adds pattern-matching-related methods to [ViewDiaryState].
extension ViewDiaryStatePatterns on ViewDiaryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ViewDiaryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ViewDiaryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ViewDiaryState value)  $default,){
final _that = this;
switch (_that) {
case _ViewDiaryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ViewDiaryState value)?  $default,){
final _that = this;
switch (_that) {
case _ViewDiaryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Diary? diary,  Map<String, DiaryPage> pagesMap,  PageController? pageController,  GlobalKey<State<StatefulWidget>>? pageKey,  TextScaler textScaler)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ViewDiaryState() when $default != null:
return $default(_that.diary,_that.pagesMap,_that.pageController,_that.pageKey,_that.textScaler);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Diary? diary,  Map<String, DiaryPage> pagesMap,  PageController? pageController,  GlobalKey<State<StatefulWidget>>? pageKey,  TextScaler textScaler)  $default,) {final _that = this;
switch (_that) {
case _ViewDiaryState():
return $default(_that.diary,_that.pagesMap,_that.pageController,_that.pageKey,_that.textScaler);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Diary? diary,  Map<String, DiaryPage> pagesMap,  PageController? pageController,  GlobalKey<State<StatefulWidget>>? pageKey,  TextScaler textScaler)?  $default,) {final _that = this;
switch (_that) {
case _ViewDiaryState() when $default != null:
return $default(_that.diary,_that.pagesMap,_that.pageController,_that.pageKey,_that.textScaler);case _:
  return null;

}
}

}

/// @nodoc

@override
class _ViewDiaryState extends ViewDiaryState {
   _ViewDiaryState({final  Diary? diary, final  Map<String, DiaryPage> pagesMap = const {}, final  PageController? pageController, final  GlobalKey<State<StatefulWidget>>? pageKey, this.textScaler = TextScaler.noScaling}): _pagesMap = pagesMap,super._(diary: diary, pageController: pageController, pageKey: pageKey);
  

 final  Map<String, DiaryPage> _pagesMap;
@override@JsonKey() Map<String, DiaryPage> get pagesMap {
  if (_pagesMap is EqualUnmodifiableMapView) return _pagesMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_pagesMap);
}

@override@JsonKey() final  TextScaler textScaler;

/// Create a copy of ViewDiaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewDiaryStateCopyWith<_ViewDiaryState> get copyWith => __$ViewDiaryStateCopyWithImpl<_ViewDiaryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewDiaryState&&(identical(other.diary, diary) || other.diary == diary)&&const DeepCollectionEquality().equals(other._pagesMap, _pagesMap)&&(identical(other.pageController, pageController) || other.pageController == pageController)&&(identical(other.pageKey, pageKey) || other.pageKey == pageKey)&&(identical(other.textScaler, textScaler) || other.textScaler == textScaler));
}


@override
int get hashCode => Object.hash(runtimeType,diary,const DeepCollectionEquality().hash(_pagesMap),pageController,pageKey,textScaler);

@override
String toString() {
  return 'ViewDiaryState(diary: $diary, pagesMap: $pagesMap, pageController: $pageController, pageKey: $pageKey, textScaler: $textScaler)';
}


}

/// @nodoc
abstract mixin class _$ViewDiaryStateCopyWith<$Res> implements $ViewDiaryStateCopyWith<$Res> {
  factory _$ViewDiaryStateCopyWith(_ViewDiaryState value, $Res Function(_ViewDiaryState) _then) = __$ViewDiaryStateCopyWithImpl;
@override @useResult
$Res call({
 Diary? diary, Map<String, DiaryPage> pagesMap, PageController? pageController, GlobalKey<State<StatefulWidget>>? pageKey, TextScaler textScaler
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
@override @pragma('vm:prefer-inline') $Res call({Object? diary = freezed,Object? pagesMap = null,Object? pageController = freezed,Object? pageKey = freezed,Object? textScaler = null,}) {
  return _then(_ViewDiaryState(
diary: freezed == diary ? _self.diary : diary // ignore: cast_nullable_to_non_nullable
as Diary?,pagesMap: null == pagesMap ? _self._pagesMap : pagesMap // ignore: cast_nullable_to_non_nullable
as Map<String, DiaryPage>,pageController: freezed == pageController ? _self.pageController : pageController // ignore: cast_nullable_to_non_nullable
as PageController?,pageKey: freezed == pageKey ? _self.pageKey : pageKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<State<StatefulWidget>>?,textScaler: null == textScaler ? _self.textScaler : textScaler // ignore: cast_nullable_to_non_nullable
as TextScaler,
  ));
}

/// Create a copy of ViewDiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryCopyWith<$Res>? get diary {
    return $DiaryCopyWith<$Res>(_self.diary, (value) {
    return _then(_self.copyWith(diary: value));
  });
}
}

/// @nodoc
mixin _$ViewDiaryParams {

 String get diaryId; TextScaler get textScaler;
/// Create a copy of ViewDiaryParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewDiaryParamsCopyWith<ViewDiaryParams> get copyWith => _$ViewDiaryParamsCopyWithImpl<ViewDiaryParams>(this as ViewDiaryParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewDiaryParams&&(identical(other.diaryId, diaryId) || other.diaryId == diaryId)&&(identical(other.textScaler, textScaler) || other.textScaler == textScaler));
}


@override
int get hashCode => Object.hash(runtimeType,diaryId,textScaler);

@override
String toString() {
  return 'ViewDiaryParams(diaryId: $diaryId, textScaler: $textScaler)';
}


}

/// @nodoc
abstract mixin class $ViewDiaryParamsCopyWith<$Res>  {
  factory $ViewDiaryParamsCopyWith(ViewDiaryParams value, $Res Function(ViewDiaryParams) _then) = _$ViewDiaryParamsCopyWithImpl;
@useResult
$Res call({
 String diaryId, TextScaler textScaler
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
@pragma('vm:prefer-inline') @override $Res call({Object? diaryId = null,Object? textScaler = null,}) {
  return _then(_self.copyWith(
diaryId: null == diaryId ? _self.diaryId : diaryId // ignore: cast_nullable_to_non_nullable
as String,textScaler: null == textScaler ? _self.textScaler : textScaler // ignore: cast_nullable_to_non_nullable
as TextScaler,
  ));
}

}


/// Adds pattern-matching-related methods to [ViewDiaryParams].
extension ViewDiaryParamsPatterns on ViewDiaryParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ViewDiaryParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ViewDiaryParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ViewDiaryParams value)  $default,){
final _that = this;
switch (_that) {
case _ViewDiaryParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ViewDiaryParams value)?  $default,){
final _that = this;
switch (_that) {
case _ViewDiaryParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String diaryId,  TextScaler textScaler)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ViewDiaryParams() when $default != null:
return $default(_that.diaryId,_that.textScaler);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String diaryId,  TextScaler textScaler)  $default,) {final _that = this;
switch (_that) {
case _ViewDiaryParams():
return $default(_that.diaryId,_that.textScaler);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String diaryId,  TextScaler textScaler)?  $default,) {final _that = this;
switch (_that) {
case _ViewDiaryParams() when $default != null:
return $default(_that.diaryId,_that.textScaler);case _:
  return null;

}
}

}

/// @nodoc


class _ViewDiaryParams implements ViewDiaryParams {
   _ViewDiaryParams({this.diaryId = '', this.textScaler = TextScaler.noScaling});
  

@override@JsonKey() final  String diaryId;
@override@JsonKey() final  TextScaler textScaler;

/// Create a copy of ViewDiaryParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewDiaryParamsCopyWith<_ViewDiaryParams> get copyWith => __$ViewDiaryParamsCopyWithImpl<_ViewDiaryParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewDiaryParams&&(identical(other.diaryId, diaryId) || other.diaryId == diaryId)&&(identical(other.textScaler, textScaler) || other.textScaler == textScaler));
}


@override
int get hashCode => Object.hash(runtimeType,diaryId,textScaler);

@override
String toString() {
  return 'ViewDiaryParams(diaryId: $diaryId, textScaler: $textScaler)';
}


}

/// @nodoc
abstract mixin class _$ViewDiaryParamsCopyWith<$Res> implements $ViewDiaryParamsCopyWith<$Res> {
  factory _$ViewDiaryParamsCopyWith(_ViewDiaryParams value, $Res Function(_ViewDiaryParams) _then) = __$ViewDiaryParamsCopyWithImpl;
@override @useResult
$Res call({
 String diaryId, TextScaler textScaler
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
@override @pragma('vm:prefer-inline') $Res call({Object? diaryId = null,Object? textScaler = null,}) {
  return _then(_ViewDiaryParams(
diaryId: null == diaryId ? _self.diaryId : diaryId // ignore: cast_nullable_to_non_nullable
as String,textScaler: null == textScaler ? _self.textScaler : textScaler // ignore: cast_nullable_to_non_nullable
as TextScaler,
  ));
}


}

// dart format on
