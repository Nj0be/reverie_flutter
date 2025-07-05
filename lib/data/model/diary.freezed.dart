// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Diary {

 Timestamp get creationDate;@JsonKey(includeToJson: false) String get id; String get uid; String get title; String get description; String get coverId; List<String> get pageIds;
/// Create a copy of Diary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryCopyWith<Diary> get copyWith => _$DiaryCopyWithImpl<Diary>(this as Diary, _$identity);

  /// Serializes this Diary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Diary&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.coverId, coverId) || other.coverId == coverId)&&const DeepCollectionEquality().equals(other.pageIds, pageIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,creationDate,id,uid,title,description,coverId,const DeepCollectionEquality().hash(pageIds));

@override
String toString() {
  return 'Diary(creationDate: $creationDate, id: $id, uid: $uid, title: $title, description: $description, coverId: $coverId, pageIds: $pageIds)';
}


}

/// @nodoc
abstract mixin class $DiaryCopyWith<$Res>  {
  factory $DiaryCopyWith(Diary value, $Res Function(Diary) _then) = _$DiaryCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String id, String uid, String title, String description, String coverId, List<String> pageIds,@JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) Timestamp? creationDate
});




}
/// @nodoc
class _$DiaryCopyWithImpl<$Res>
    implements $DiaryCopyWith<$Res> {
  _$DiaryCopyWithImpl(this._self, this._then);

  final Diary _self;
  final $Res Function(Diary) _then;

/// Create a copy of Diary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? title = null,Object? description = null,Object? coverId = null,Object? pageIds = null,Object? creationDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,coverId: null == coverId ? _self.coverId : coverId // ignore: cast_nullable_to_non_nullable
as String,pageIds: null == pageIds ? _self.pageIds : pageIds // ignore: cast_nullable_to_non_nullable
as List<String>,creationDate: freezed == creationDate ? _self.creationDate! : creationDate // ignore: cast_nullable_to_non_nullable
as Timestamp?,
  ));
}

}


/// Adds pattern-matching-related methods to [Diary].
extension DiaryPatterns on Diary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Diary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Diary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Diary value)  $default,){
final _that = this;
switch (_that) {
case _Diary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Diary value)?  $default,){
final _that = this;
switch (_that) {
case _Diary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id,  String uid,  String title,  String description,  String coverId,  List<String> pageIds, @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)  Timestamp? creationDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Diary() when $default != null:
return $default(_that.id,_that.uid,_that.title,_that.description,_that.coverId,_that.pageIds,_that.creationDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id,  String uid,  String title,  String description,  String coverId,  List<String> pageIds, @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)  Timestamp? creationDate)  $default,) {final _that = this;
switch (_that) {
case _Diary():
return $default(_that.id,_that.uid,_that.title,_that.description,_that.coverId,_that.pageIds,_that.creationDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false)  String id,  String uid,  String title,  String description,  String coverId,  List<String> pageIds, @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)  Timestamp? creationDate)?  $default,) {final _that = this;
switch (_that) {
case _Diary() when $default != null:
return $default(_that.id,_that.uid,_that.title,_that.description,_that.coverId,_that.pageIds,_that.creationDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Diary extends Diary {
   _Diary({@JsonKey(includeToJson: false) this.id = '', this.uid = '', this.title = '', this.description = '', this.coverId = '', final  List<String> pageIds = const <String>[], @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) final  Timestamp? creationDate}): _pageIds = pageIds,super._(creationDate: creationDate);
  factory _Diary.fromJson(Map<String, dynamic> json) => _$DiaryFromJson(json);

@override@JsonKey(includeToJson: false) final  String id;
@override@JsonKey() final  String uid;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  String coverId;
 final  List<String> _pageIds;
@override@JsonKey() List<String> get pageIds {
  if (_pageIds is EqualUnmodifiableListView) return _pageIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pageIds);
}


/// Create a copy of Diary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiaryCopyWith<_Diary> get copyWith => __$DiaryCopyWithImpl<_Diary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Diary&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.coverId, coverId) || other.coverId == coverId)&&const DeepCollectionEquality().equals(other._pageIds, _pageIds)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,title,description,coverId,const DeepCollectionEquality().hash(_pageIds),creationDate);

@override
String toString() {
  return 'Diary(id: $id, uid: $uid, title: $title, description: $description, coverId: $coverId, pageIds: $pageIds, creationDate: $creationDate)';
}


}

/// @nodoc
abstract mixin class _$DiaryCopyWith<$Res> implements $DiaryCopyWith<$Res> {
  factory _$DiaryCopyWith(_Diary value, $Res Function(_Diary) _then) = __$DiaryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String id, String uid, String title, String description, String coverId, List<String> pageIds,@JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) Timestamp? creationDate
});




}
/// @nodoc
class __$DiaryCopyWithImpl<$Res>
    implements _$DiaryCopyWith<$Res> {
  __$DiaryCopyWithImpl(this._self, this._then);

  final _Diary _self;
  final $Res Function(_Diary) _then;

/// Create a copy of Diary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? title = null,Object? description = null,Object? coverId = null,Object? pageIds = null,Object? creationDate = freezed,}) {
  return _then(_Diary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,coverId: null == coverId ? _self.coverId : coverId // ignore: cast_nullable_to_non_nullable
as String,pageIds: null == pageIds ? _self._pageIds : pageIds // ignore: cast_nullable_to_non_nullable
as List<String>,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as Timestamp?,
  ));
}


}

// dart format on
