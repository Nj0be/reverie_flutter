// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_diary_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditDiaryState {

 Diary get diary; List<DiaryCover> get allCoversList; String get titleError; String get descriptionError;
/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditDiaryStateCopyWith<EditDiaryState> get copyWith => _$EditDiaryStateCopyWithImpl<EditDiaryState>(this as EditDiaryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditDiaryState&&(identical(other.diary, diary) || other.diary == diary)&&const DeepCollectionEquality().equals(other.allCoversList, allCoversList)&&(identical(other.titleError, titleError) || other.titleError == titleError)&&(identical(other.descriptionError, descriptionError) || other.descriptionError == descriptionError));
}


@override
int get hashCode => Object.hash(runtimeType,diary,const DeepCollectionEquality().hash(allCoversList),titleError,descriptionError);

@override
String toString() {
  return 'EditDiaryState(diary: $diary, allCoversList: $allCoversList, titleError: $titleError, descriptionError: $descriptionError)';
}


}

/// @nodoc
abstract mixin class $EditDiaryStateCopyWith<$Res>  {
  factory $EditDiaryStateCopyWith(EditDiaryState value, $Res Function(EditDiaryState) _then) = _$EditDiaryStateCopyWithImpl;
@useResult
$Res call({
 Diary? diary, List<DiaryCover> allCoversList, String titleError, String descriptionError
});


$DiaryCopyWith<$Res>? get diary;

}
/// @nodoc
class _$EditDiaryStateCopyWithImpl<$Res>
    implements $EditDiaryStateCopyWith<$Res> {
  _$EditDiaryStateCopyWithImpl(this._self, this._then);

  final EditDiaryState _self;
  final $Res Function(EditDiaryState) _then;

/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? diary = freezed,Object? allCoversList = null,Object? titleError = null,Object? descriptionError = null,}) {
  return _then(_self.copyWith(
diary: freezed == diary ? _self.diary! : diary // ignore: cast_nullable_to_non_nullable
as Diary?,allCoversList: null == allCoversList ? _self.allCoversList : allCoversList // ignore: cast_nullable_to_non_nullable
as List<DiaryCover>,titleError: null == titleError ? _self.titleError : titleError // ignore: cast_nullable_to_non_nullable
as String,descriptionError: null == descriptionError ? _self.descriptionError : descriptionError // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of EditDiaryState
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


/// Adds pattern-matching-related methods to [EditDiaryState].
extension EditDiaryStatePatterns on EditDiaryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditDiaryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditDiaryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditDiaryState value)  $default,){
final _that = this;
switch (_that) {
case _EditDiaryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditDiaryState value)?  $default,){
final _that = this;
switch (_that) {
case _EditDiaryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Diary? diary,  List<DiaryCover> allCoversList,  String titleError,  String descriptionError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditDiaryState() when $default != null:
return $default(_that.diary,_that.allCoversList,_that.titleError,_that.descriptionError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Diary? diary,  List<DiaryCover> allCoversList,  String titleError,  String descriptionError)  $default,) {final _that = this;
switch (_that) {
case _EditDiaryState():
return $default(_that.diary,_that.allCoversList,_that.titleError,_that.descriptionError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Diary? diary,  List<DiaryCover> allCoversList,  String titleError,  String descriptionError)?  $default,) {final _that = this;
switch (_that) {
case _EditDiaryState() when $default != null:
return $default(_that.diary,_that.allCoversList,_that.titleError,_that.descriptionError);case _:
  return null;

}
}

}

/// @nodoc


class _EditDiaryState extends EditDiaryState {
   _EditDiaryState({final  Diary? diary, final  List<DiaryCover> allCoversList = const [], this.titleError = '', this.descriptionError = ''}): _allCoversList = allCoversList,super._(diary: diary);
  

 final  List<DiaryCover> _allCoversList;
@override@JsonKey() List<DiaryCover> get allCoversList {
  if (_allCoversList is EqualUnmodifiableListView) return _allCoversList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allCoversList);
}

@override@JsonKey() final  String titleError;
@override@JsonKey() final  String descriptionError;

/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditDiaryStateCopyWith<_EditDiaryState> get copyWith => __$EditDiaryStateCopyWithImpl<_EditDiaryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditDiaryState&&(identical(other.diary, diary) || other.diary == diary)&&const DeepCollectionEquality().equals(other._allCoversList, _allCoversList)&&(identical(other.titleError, titleError) || other.titleError == titleError)&&(identical(other.descriptionError, descriptionError) || other.descriptionError == descriptionError));
}


@override
int get hashCode => Object.hash(runtimeType,diary,const DeepCollectionEquality().hash(_allCoversList),titleError,descriptionError);

@override
String toString() {
  return 'EditDiaryState(diary: $diary, allCoversList: $allCoversList, titleError: $titleError, descriptionError: $descriptionError)';
}


}

/// @nodoc
abstract mixin class _$EditDiaryStateCopyWith<$Res> implements $EditDiaryStateCopyWith<$Res> {
  factory _$EditDiaryStateCopyWith(_EditDiaryState value, $Res Function(_EditDiaryState) _then) = __$EditDiaryStateCopyWithImpl;
@override @useResult
$Res call({
 Diary? diary, List<DiaryCover> allCoversList, String titleError, String descriptionError
});


@override $DiaryCopyWith<$Res>? get diary;

}
/// @nodoc
class __$EditDiaryStateCopyWithImpl<$Res>
    implements _$EditDiaryStateCopyWith<$Res> {
  __$EditDiaryStateCopyWithImpl(this._self, this._then);

  final _EditDiaryState _self;
  final $Res Function(_EditDiaryState) _then;

/// Create a copy of EditDiaryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? diary = freezed,Object? allCoversList = null,Object? titleError = null,Object? descriptionError = null,}) {
  return _then(_EditDiaryState(
diary: freezed == diary ? _self.diary : diary // ignore: cast_nullable_to_non_nullable
as Diary?,allCoversList: null == allCoversList ? _self._allCoversList : allCoversList // ignore: cast_nullable_to_non_nullable
as List<DiaryCover>,titleError: null == titleError ? _self.titleError : titleError // ignore: cast_nullable_to_non_nullable
as String,descriptionError: null == descriptionError ? _self.descriptionError : descriptionError // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of EditDiaryState
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
