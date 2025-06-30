// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_cover.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiaryCover {

@JsonKey(includeToJson: false) String get id; String get name; String get url;
/// Create a copy of DiaryCover
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryCoverCopyWith<DiaryCover> get copyWith => _$DiaryCoverCopyWithImpl<DiaryCover>(this as DiaryCover, _$identity);

  /// Serializes this DiaryCover to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryCover&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url);

@override
String toString() {
  return 'DiaryCover(id: $id, name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class $DiaryCoverCopyWith<$Res>  {
  factory $DiaryCoverCopyWith(DiaryCover value, $Res Function(DiaryCover) _then) = _$DiaryCoverCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String id, String name, String url
});




}
/// @nodoc
class _$DiaryCoverCopyWithImpl<$Res>
    implements $DiaryCoverCopyWith<$Res> {
  _$DiaryCoverCopyWithImpl(this._self, this._then);

  final DiaryCover _self;
  final $Res Function(DiaryCover) _then;

/// Create a copy of DiaryCover
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DiaryCover implements DiaryCover {
  const _DiaryCover({@JsonKey(includeToJson: false) this.id = '', this.name = '', this.url = ''});
  factory _DiaryCover.fromJson(Map<String, dynamic> json) => _$DiaryCoverFromJson(json);

@override@JsonKey(includeToJson: false) final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String url;

/// Create a copy of DiaryCover
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiaryCoverCopyWith<_DiaryCover> get copyWith => __$DiaryCoverCopyWithImpl<_DiaryCover>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiaryCoverToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiaryCover&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url);

@override
String toString() {
  return 'DiaryCover(id: $id, name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$DiaryCoverCopyWith<$Res> implements $DiaryCoverCopyWith<$Res> {
  factory _$DiaryCoverCopyWith(_DiaryCover value, $Res Function(_DiaryCover) _then) = __$DiaryCoverCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String id, String name, String url
});




}
/// @nodoc
class __$DiaryCoverCopyWithImpl<$Res>
    implements _$DiaryCoverCopyWith<$Res> {
  __$DiaryCoverCopyWithImpl(this._self, this._then);

  final _DiaryCover _self;
  final $Res Function(_DiaryCover) _then;

/// Create a copy of DiaryCover
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? url = null,}) {
  return _then(_DiaryCover(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
