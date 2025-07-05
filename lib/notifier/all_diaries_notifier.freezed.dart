// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 PageController get pageController; List<Diary> get diaries; Map<String, DiaryCover> get diaryCoversMap; bool get deleteDialogState; int get currentIndex;
/// Create a copy of AllDiariesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllDiariesStateCopyWith<AllDiariesState> get copyWith => _$AllDiariesStateCopyWithImpl<AllDiariesState>(this as AllDiariesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllDiariesState&&(identical(other.pageController, pageController) || other.pageController == pageController)&&const DeepCollectionEquality().equals(other.diaries, diaries)&&const DeepCollectionEquality().equals(other.diaryCoversMap, diaryCoversMap)&&(identical(other.deleteDialogState, deleteDialogState) || other.deleteDialogState == deleteDialogState)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex));
}


@override
int get hashCode => Object.hash(runtimeType,pageController,const DeepCollectionEquality().hash(diaries),const DeepCollectionEquality().hash(diaryCoversMap),deleteDialogState,currentIndex);

@override
String toString() {
  return 'AllDiariesState(pageController: $pageController, diaries: $diaries, diaryCoversMap: $diaryCoversMap, deleteDialogState: $deleteDialogState, currentIndex: $currentIndex)';
}


}

/// @nodoc
abstract mixin class $AllDiariesStateCopyWith<$Res>  {
  factory $AllDiariesStateCopyWith(AllDiariesState value, $Res Function(AllDiariesState) _then) = _$AllDiariesStateCopyWithImpl;
@useResult
$Res call({
 List<Diary> diaries, Map<String, DiaryCover> diaryCoversMap, bool deleteDialogState, int currentIndex, PageController? pageController
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
@pragma('vm:prefer-inline') @override $Res call({Object? diaries = null,Object? diaryCoversMap = null,Object? deleteDialogState = null,Object? currentIndex = null,Object? pageController = freezed,}) {
  return _then(_self.copyWith(
diaries: null == diaries ? _self.diaries : diaries // ignore: cast_nullable_to_non_nullable
as List<Diary>,diaryCoversMap: null == diaryCoversMap ? _self.diaryCoversMap : diaryCoversMap // ignore: cast_nullable_to_non_nullable
as Map<String, DiaryCover>,deleteDialogState: null == deleteDialogState ? _self.deleteDialogState : deleteDialogState // ignore: cast_nullable_to_non_nullable
as bool,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,pageController: freezed == pageController ? _self.pageController! : pageController // ignore: cast_nullable_to_non_nullable
as PageController?,
  ));
}

}


/// Adds pattern-matching-related methods to [AllDiariesState].
extension AllDiariesStatePatterns on AllDiariesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AllDiariesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AllDiariesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AllDiariesState value)  $default,){
final _that = this;
switch (_that) {
case _AllDiariesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AllDiariesState value)?  $default,){
final _that = this;
switch (_that) {
case _AllDiariesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Diary> diaries,  Map<String, DiaryCover> diaryCoversMap,  bool deleteDialogState,  int currentIndex,  PageController? pageController)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AllDiariesState() when $default != null:
return $default(_that.diaries,_that.diaryCoversMap,_that.deleteDialogState,_that.currentIndex,_that.pageController);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Diary> diaries,  Map<String, DiaryCover> diaryCoversMap,  bool deleteDialogState,  int currentIndex,  PageController? pageController)  $default,) {final _that = this;
switch (_that) {
case _AllDiariesState():
return $default(_that.diaries,_that.diaryCoversMap,_that.deleteDialogState,_that.currentIndex,_that.pageController);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Diary> diaries,  Map<String, DiaryCover> diaryCoversMap,  bool deleteDialogState,  int currentIndex,  PageController? pageController)?  $default,) {final _that = this;
switch (_that) {
case _AllDiariesState() when $default != null:
return $default(_that.diaries,_that.diaryCoversMap,_that.deleteDialogState,_that.currentIndex,_that.pageController);case _:
  return null;

}
}

}

/// @nodoc


class _AllDiariesState extends AllDiariesState {
   _AllDiariesState({final  List<Diary> diaries = const [], final  Map<String, DiaryCover> diaryCoversMap = const {}, this.deleteDialogState = false, this.currentIndex = 0, final  PageController? pageController}): _diaries = diaries,_diaryCoversMap = diaryCoversMap,super._(pageController: pageController);
  

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllDiariesState&&const DeepCollectionEquality().equals(other._diaries, _diaries)&&const DeepCollectionEquality().equals(other._diaryCoversMap, _diaryCoversMap)&&(identical(other.deleteDialogState, deleteDialogState) || other.deleteDialogState == deleteDialogState)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.pageController, pageController) || other.pageController == pageController));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_diaries),const DeepCollectionEquality().hash(_diaryCoversMap),deleteDialogState,currentIndex,pageController);

@override
String toString() {
  return 'AllDiariesState(diaries: $diaries, diaryCoversMap: $diaryCoversMap, deleteDialogState: $deleteDialogState, currentIndex: $currentIndex, pageController: $pageController)';
}


}

/// @nodoc
abstract mixin class _$AllDiariesStateCopyWith<$Res> implements $AllDiariesStateCopyWith<$Res> {
  factory _$AllDiariesStateCopyWith(_AllDiariesState value, $Res Function(_AllDiariesState) _then) = __$AllDiariesStateCopyWithImpl;
@override @useResult
$Res call({
 List<Diary> diaries, Map<String, DiaryCover> diaryCoversMap, bool deleteDialogState, int currentIndex, PageController? pageController
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
@override @pragma('vm:prefer-inline') $Res call({Object? diaries = null,Object? diaryCoversMap = null,Object? deleteDialogState = null,Object? currentIndex = null,Object? pageController = freezed,}) {
  return _then(_AllDiariesState(
diaries: null == diaries ? _self._diaries : diaries // ignore: cast_nullable_to_non_nullable
as List<Diary>,diaryCoversMap: null == diaryCoversMap ? _self._diaryCoversMap : diaryCoversMap // ignore: cast_nullable_to_non_nullable
as Map<String, DiaryCover>,deleteDialogState: null == deleteDialogState ? _self.deleteDialogState : deleteDialogState // ignore: cast_nullable_to_non_nullable
as bool,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,pageController: freezed == pageController ? _self.pageController : pageController // ignore: cast_nullable_to_non_nullable
as PageController?,
  ));
}


}

// dart format on
