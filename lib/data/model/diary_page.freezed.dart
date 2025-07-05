// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiaryPage {

 Timestamp get timestamp;@JsonKey(includeToJson: false) String get id; String get diaryId; String get content; List<String> get subPageIds;
/// Create a copy of DiaryPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryPageCopyWith<DiaryPage> get copyWith => _$DiaryPageCopyWithImpl<DiaryPage>(this as DiaryPage, _$identity);

  /// Serializes this DiaryPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryPage&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.id, id) || other.id == id)&&(identical(other.diaryId, diaryId) || other.diaryId == diaryId)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.subPageIds, subPageIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,id,diaryId,content,const DeepCollectionEquality().hash(subPageIds));

@override
String toString() {
  return 'DiaryPage(timestamp: $timestamp, id: $id, diaryId: $diaryId, content: $content, subPageIds: $subPageIds)';
}


}

/// @nodoc
abstract mixin class $DiaryPageCopyWith<$Res>  {
  factory $DiaryPageCopyWith(DiaryPage value, $Res Function(DiaryPage) _then) = _$DiaryPageCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String id, String diaryId, String content, List<String> subPageIds,@JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) Timestamp? timestamp
});




}
/// @nodoc
class _$DiaryPageCopyWithImpl<$Res>
    implements $DiaryPageCopyWith<$Res> {
  _$DiaryPageCopyWithImpl(this._self, this._then);

  final DiaryPage _self;
  final $Res Function(DiaryPage) _then;

/// Create a copy of DiaryPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? diaryId = null,Object? content = null,Object? subPageIds = null,Object? timestamp = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,diaryId: null == diaryId ? _self.diaryId : diaryId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,subPageIds: null == subPageIds ? _self.subPageIds : subPageIds // ignore: cast_nullable_to_non_nullable
as List<String>,timestamp: freezed == timestamp ? _self.timestamp! : timestamp // ignore: cast_nullable_to_non_nullable
as Timestamp?,
  ));
}

}


/// Adds pattern-matching-related methods to [DiaryPage].
extension DiaryPagePatterns on DiaryPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiaryPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiaryPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiaryPage value)  $default,){
final _that = this;
switch (_that) {
case _DiaryPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiaryPage value)?  $default,){
final _that = this;
switch (_that) {
case _DiaryPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id,  String diaryId,  String content,  List<String> subPageIds, @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)  Timestamp? timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiaryPage() when $default != null:
return $default(_that.id,_that.diaryId,_that.content,_that.subPageIds,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id,  String diaryId,  String content,  List<String> subPageIds, @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)  Timestamp? timestamp)  $default,) {final _that = this;
switch (_that) {
case _DiaryPage():
return $default(_that.id,_that.diaryId,_that.content,_that.subPageIds,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false)  String id,  String diaryId,  String content,  List<String> subPageIds, @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)  Timestamp? timestamp)?  $default,) {final _that = this;
switch (_that) {
case _DiaryPage() when $default != null:
return $default(_that.id,_that.diaryId,_that.content,_that.subPageIds,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiaryPage extends DiaryPage {
   _DiaryPage({@JsonKey(includeToJson: false) this.id = '', this.diaryId = '', this.content = '', final  List<String> subPageIds = const <String>[], @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) final  Timestamp? timestamp}): _subPageIds = subPageIds,super._(timestamp: timestamp);
  factory _DiaryPage.fromJson(Map<String, dynamic> json) => _$DiaryPageFromJson(json);

@override@JsonKey(includeToJson: false) final  String id;
@override@JsonKey() final  String diaryId;
@override@JsonKey() final  String content;
 final  List<String> _subPageIds;
@override@JsonKey() List<String> get subPageIds {
  if (_subPageIds is EqualUnmodifiableListView) return _subPageIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subPageIds);
}


/// Create a copy of DiaryPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiaryPageCopyWith<_DiaryPage> get copyWith => __$DiaryPageCopyWithImpl<_DiaryPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiaryPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiaryPage&&(identical(other.id, id) || other.id == id)&&(identical(other.diaryId, diaryId) || other.diaryId == diaryId)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._subPageIds, _subPageIds)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,diaryId,content,const DeepCollectionEquality().hash(_subPageIds),timestamp);

@override
String toString() {
  return 'DiaryPage(id: $id, diaryId: $diaryId, content: $content, subPageIds: $subPageIds, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$DiaryPageCopyWith<$Res> implements $DiaryPageCopyWith<$Res> {
  factory _$DiaryPageCopyWith(_DiaryPage value, $Res Function(_DiaryPage) _then) = __$DiaryPageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String id, String diaryId, String content, List<String> subPageIds,@JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) Timestamp? timestamp
});




}
/// @nodoc
class __$DiaryPageCopyWithImpl<$Res>
    implements _$DiaryPageCopyWith<$Res> {
  __$DiaryPageCopyWithImpl(this._self, this._then);

  final _DiaryPage _self;
  final $Res Function(_DiaryPage) _then;

/// Create a copy of DiaryPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? diaryId = null,Object? content = null,Object? subPageIds = null,Object? timestamp = freezed,}) {
  return _then(_DiaryPage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,diaryId: null == diaryId ? _self.diaryId : diaryId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,subPageIds: null == subPageIds ? _self._subPageIds : subPageIds // ignore: cast_nullable_to_non_nullable
as List<String>,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as Timestamp?,
  ));
}


}

// dart format on
