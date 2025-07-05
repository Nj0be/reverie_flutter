// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_diary_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditDiaryPageState {

 DiaryPage get page;
/// Create a copy of EditDiaryPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditDiaryPageStateCopyWith<EditDiaryPageState> get copyWith => _$EditDiaryPageStateCopyWithImpl<EditDiaryPageState>(this as EditDiaryPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditDiaryPageState&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'EditDiaryPageState(page: $page)';
}


}

/// @nodoc
abstract mixin class $EditDiaryPageStateCopyWith<$Res>  {
  factory $EditDiaryPageStateCopyWith(EditDiaryPageState value, $Res Function(EditDiaryPageState) _then) = _$EditDiaryPageStateCopyWithImpl;
@useResult
$Res call({
 DiaryPage? page
});


$DiaryPageCopyWith<$Res>? get page;

}
/// @nodoc
class _$EditDiaryPageStateCopyWithImpl<$Res>
    implements $EditDiaryPageStateCopyWith<$Res> {
  _$EditDiaryPageStateCopyWithImpl(this._self, this._then);

  final EditDiaryPageState _self;
  final $Res Function(EditDiaryPageState) _then;

/// Create a copy of EditDiaryPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = freezed,}) {
  return _then(_self.copyWith(
page: freezed == page ? _self.page! : page // ignore: cast_nullable_to_non_nullable
as DiaryPage?,
  ));
}
/// Create a copy of EditDiaryPageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryPageCopyWith<$Res>? get page {
    if (_self.page == null) {
    return null;
  }

  return $DiaryPageCopyWith<$Res>(_self.page!, (value) {
    return _then(_self.copyWith(page: value));
  });
}
}


/// Adds pattern-matching-related methods to [EditDiaryPageState].
extension EditDiaryPageStatePatterns on EditDiaryPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditDiaryPageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditDiaryPageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditDiaryPageState value)  $default,){
final _that = this;
switch (_that) {
case _EditDiaryPageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditDiaryPageState value)?  $default,){
final _that = this;
switch (_that) {
case _EditDiaryPageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DiaryPage? page)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditDiaryPageState() when $default != null:
return $default(_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DiaryPage? page)  $default,) {final _that = this;
switch (_that) {
case _EditDiaryPageState():
return $default(_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DiaryPage? page)?  $default,) {final _that = this;
switch (_that) {
case _EditDiaryPageState() when $default != null:
return $default(_that.page);case _:
  return null;

}
}

}

/// @nodoc


class _EditDiaryPageState extends EditDiaryPageState {
   _EditDiaryPageState({final  DiaryPage? page}): super._(page: page);
  



/// Create a copy of EditDiaryPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditDiaryPageStateCopyWith<_EditDiaryPageState> get copyWith => __$EditDiaryPageStateCopyWithImpl<_EditDiaryPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditDiaryPageState&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'EditDiaryPageState(page: $page)';
}


}

/// @nodoc
abstract mixin class _$EditDiaryPageStateCopyWith<$Res> implements $EditDiaryPageStateCopyWith<$Res> {
  factory _$EditDiaryPageStateCopyWith(_EditDiaryPageState value, $Res Function(_EditDiaryPageState) _then) = __$EditDiaryPageStateCopyWithImpl;
@override @useResult
$Res call({
 DiaryPage? page
});


@override $DiaryPageCopyWith<$Res>? get page;

}
/// @nodoc
class __$EditDiaryPageStateCopyWithImpl<$Res>
    implements _$EditDiaryPageStateCopyWith<$Res> {
  __$EditDiaryPageStateCopyWithImpl(this._self, this._then);

  final _EditDiaryPageState _self;
  final $Res Function(_EditDiaryPageState) _then;

/// Create a copy of EditDiaryPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = freezed,}) {
  return _then(_EditDiaryPageState(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as DiaryPage?,
  ));
}

/// Create a copy of EditDiaryPageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryPageCopyWith<$Res>? get page {
    if (_self.page == null) {
    return null;
  }

  return $DiaryPageCopyWith<$Res>(_self.page!, (value) {
    return _then(_self.copyWith(page: value));
  });
}
}

// dart format on
