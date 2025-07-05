// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_capsule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimeCapsule {

 Timestamp get deadline; Timestamp get creationDate;@JsonKey(includeToJson: false) String get id; String get userId; String get title; String get content; List<String> get emails; List<String> get phones; List<String> get receiversIds; bool get isSent;
/// Create a copy of TimeCapsule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeCapsuleCopyWith<TimeCapsule> get copyWith => _$TimeCapsuleCopyWithImpl<TimeCapsule>(this as TimeCapsule, _$identity);

  /// Serializes this TimeCapsule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeCapsule&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.emails, emails)&&const DeepCollectionEquality().equals(other.phones, phones)&&const DeepCollectionEquality().equals(other.receiversIds, receiversIds)&&(identical(other.isSent, isSent) || other.isSent == isSent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deadline,creationDate,id,userId,title,content,const DeepCollectionEquality().hash(emails),const DeepCollectionEquality().hash(phones),const DeepCollectionEquality().hash(receiversIds),isSent);

@override
String toString() {
  return 'TimeCapsule(deadline: $deadline, creationDate: $creationDate, id: $id, userId: $userId, title: $title, content: $content, emails: $emails, phones: $phones, receiversIds: $receiversIds, isSent: $isSent)';
}


}

/// @nodoc
abstract mixin class $TimeCapsuleCopyWith<$Res>  {
  factory $TimeCapsuleCopyWith(TimeCapsule value, $Res Function(TimeCapsule) _then) = _$TimeCapsuleCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String id, String userId, String title, String content,@JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) Timestamp? deadline, List<String> emails, List<String> phones, List<String> receiversIds,@JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) Timestamp? creationDate, bool isSent
});




}
/// @nodoc
class _$TimeCapsuleCopyWithImpl<$Res>
    implements $TimeCapsuleCopyWith<$Res> {
  _$TimeCapsuleCopyWithImpl(this._self, this._then);

  final TimeCapsule _self;
  final $Res Function(TimeCapsule) _then;

/// Create a copy of TimeCapsule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? title = null,Object? content = null,Object? deadline = freezed,Object? emails = null,Object? phones = null,Object? receiversIds = null,Object? creationDate = freezed,Object? isSent = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,deadline: freezed == deadline ? _self.deadline! : deadline // ignore: cast_nullable_to_non_nullable
as Timestamp?,emails: null == emails ? _self.emails : emails // ignore: cast_nullable_to_non_nullable
as List<String>,phones: null == phones ? _self.phones : phones // ignore: cast_nullable_to_non_nullable
as List<String>,receiversIds: null == receiversIds ? _self.receiversIds : receiversIds // ignore: cast_nullable_to_non_nullable
as List<String>,creationDate: freezed == creationDate ? _self.creationDate! : creationDate // ignore: cast_nullable_to_non_nullable
as Timestamp?,isSent: null == isSent ? _self.isSent : isSent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeCapsule].
extension TimeCapsulePatterns on TimeCapsule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeCapsule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeCapsule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeCapsule value)  $default,){
final _that = this;
switch (_that) {
case _TimeCapsule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeCapsule value)?  $default,){
final _that = this;
switch (_that) {
case _TimeCapsule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id,  String userId,  String title,  String content, @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)  Timestamp? deadline,  List<String> emails,  List<String> phones,  List<String> receiversIds, @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)  Timestamp? creationDate,  bool isSent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeCapsule() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.content,_that.deadline,_that.emails,_that.phones,_that.receiversIds,_that.creationDate,_that.isSent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id,  String userId,  String title,  String content, @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)  Timestamp? deadline,  List<String> emails,  List<String> phones,  List<String> receiversIds, @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)  Timestamp? creationDate,  bool isSent)  $default,) {final _that = this;
switch (_that) {
case _TimeCapsule():
return $default(_that.id,_that.userId,_that.title,_that.content,_that.deadline,_that.emails,_that.phones,_that.receiversIds,_that.creationDate,_that.isSent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false)  String id,  String userId,  String title,  String content, @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)  Timestamp? deadline,  List<String> emails,  List<String> phones,  List<String> receiversIds, @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)  Timestamp? creationDate,  bool isSent)?  $default,) {final _that = this;
switch (_that) {
case _TimeCapsule() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.content,_that.deadline,_that.emails,_that.phones,_that.receiversIds,_that.creationDate,_that.isSent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeCapsule extends TimeCapsule {
   _TimeCapsule({@JsonKey(includeToJson: false) this.id = '', this.userId = '', this.title = '', this.content = '', @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) final  Timestamp? deadline, final  List<String> emails = const <String>[], final  List<String> phones = const <String>[], final  List<String> receiversIds = const <String>[], @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) final  Timestamp? creationDate, this.isSent = false}): _emails = emails,_phones = phones,_receiversIds = receiversIds,super._(deadline: deadline, creationDate: creationDate);
  factory _TimeCapsule.fromJson(Map<String, dynamic> json) => _$TimeCapsuleFromJson(json);

@override@JsonKey(includeToJson: false) final  String id;
@override@JsonKey() final  String userId;
@override@JsonKey() final  String title;
@override@JsonKey() final  String content;
 final  List<String> _emails;
@override@JsonKey() List<String> get emails {
  if (_emails is EqualUnmodifiableListView) return _emails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_emails);
}

 final  List<String> _phones;
@override@JsonKey() List<String> get phones {
  if (_phones is EqualUnmodifiableListView) return _phones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phones);
}

 final  List<String> _receiversIds;
@override@JsonKey() List<String> get receiversIds {
  if (_receiversIds is EqualUnmodifiableListView) return _receiversIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_receiversIds);
}

@override@JsonKey() final  bool isSent;

/// Create a copy of TimeCapsule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeCapsuleCopyWith<_TimeCapsule> get copyWith => __$TimeCapsuleCopyWithImpl<_TimeCapsule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeCapsuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeCapsule&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&const DeepCollectionEquality().equals(other._emails, _emails)&&const DeepCollectionEquality().equals(other._phones, _phones)&&const DeepCollectionEquality().equals(other._receiversIds, _receiversIds)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.isSent, isSent) || other.isSent == isSent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,title,content,deadline,const DeepCollectionEquality().hash(_emails),const DeepCollectionEquality().hash(_phones),const DeepCollectionEquality().hash(_receiversIds),creationDate,isSent);

@override
String toString() {
  return 'TimeCapsule(id: $id, userId: $userId, title: $title, content: $content, deadline: $deadline, emails: $emails, phones: $phones, receiversIds: $receiversIds, creationDate: $creationDate, isSent: $isSent)';
}


}

/// @nodoc
abstract mixin class _$TimeCapsuleCopyWith<$Res> implements $TimeCapsuleCopyWith<$Res> {
  factory _$TimeCapsuleCopyWith(_TimeCapsule value, $Res Function(_TimeCapsule) _then) = __$TimeCapsuleCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String id, String userId, String title, String content,@JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) Timestamp? deadline, List<String> emails, List<String> phones, List<String> receiversIds,@JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) Timestamp? creationDate, bool isSent
});




}
/// @nodoc
class __$TimeCapsuleCopyWithImpl<$Res>
    implements _$TimeCapsuleCopyWith<$Res> {
  __$TimeCapsuleCopyWithImpl(this._self, this._then);

  final _TimeCapsule _self;
  final $Res Function(_TimeCapsule) _then;

/// Create a copy of TimeCapsule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? title = null,Object? content = null,Object? deadline = freezed,Object? emails = null,Object? phones = null,Object? receiversIds = null,Object? creationDate = freezed,Object? isSent = null,}) {
  return _then(_TimeCapsule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as Timestamp?,emails: null == emails ? _self._emails : emails // ignore: cast_nullable_to_non_nullable
as List<String>,phones: null == phones ? _self._phones : phones // ignore: cast_nullable_to_non_nullable
as List<String>,receiversIds: null == receiversIds ? _self._receiversIds : receiversIds // ignore: cast_nullable_to_non_nullable
as List<String>,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as Timestamp?,isSent: null == isSent ? _self.isSent : isSent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
