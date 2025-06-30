// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiaryImage {

@JsonKey(includeToJson: false) String get id; String get subPageId; String get diaryId; int get offsetX; int get offsetY; double get scale; double get rotation; String get url;
/// Create a copy of DiaryImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryImageCopyWith<DiaryImage> get copyWith => _$DiaryImageCopyWithImpl<DiaryImage>(this as DiaryImage, _$identity);

  /// Serializes this DiaryImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryImage&&(identical(other.id, id) || other.id == id)&&(identical(other.subPageId, subPageId) || other.subPageId == subPageId)&&(identical(other.diaryId, diaryId) || other.diaryId == diaryId)&&(identical(other.offsetX, offsetX) || other.offsetX == offsetX)&&(identical(other.offsetY, offsetY) || other.offsetY == offsetY)&&(identical(other.scale, scale) || other.scale == scale)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,subPageId,diaryId,offsetX,offsetY,scale,rotation,url);

@override
String toString() {
  return 'DiaryImage(id: $id, subPageId: $subPageId, diaryId: $diaryId, offsetX: $offsetX, offsetY: $offsetY, scale: $scale, rotation: $rotation, url: $url)';
}


}

/// @nodoc
abstract mixin class $DiaryImageCopyWith<$Res>  {
  factory $DiaryImageCopyWith(DiaryImage value, $Res Function(DiaryImage) _then) = _$DiaryImageCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String id, String subPageId, String diaryId, int offsetX, int offsetY, double scale, double rotation, String url
});




}
/// @nodoc
class _$DiaryImageCopyWithImpl<$Res>
    implements $DiaryImageCopyWith<$Res> {
  _$DiaryImageCopyWithImpl(this._self, this._then);

  final DiaryImage _self;
  final $Res Function(DiaryImage) _then;

/// Create a copy of DiaryImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? subPageId = null,Object? diaryId = null,Object? offsetX = null,Object? offsetY = null,Object? scale = null,Object? rotation = null,Object? url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,subPageId: null == subPageId ? _self.subPageId : subPageId // ignore: cast_nullable_to_non_nullable
as String,diaryId: null == diaryId ? _self.diaryId : diaryId // ignore: cast_nullable_to_non_nullable
as String,offsetX: null == offsetX ? _self.offsetX : offsetX // ignore: cast_nullable_to_non_nullable
as int,offsetY: null == offsetY ? _self.offsetY : offsetY // ignore: cast_nullable_to_non_nullable
as int,scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as double,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DiaryImage implements DiaryImage {
  const _DiaryImage({@JsonKey(includeToJson: false) this.id = '', this.subPageId = '', this.diaryId = '', this.offsetX = 0, this.offsetY = 0, this.scale = 1, this.rotation = 0, this.url = ''});
  factory _DiaryImage.fromJson(Map<String, dynamic> json) => _$DiaryImageFromJson(json);

@override@JsonKey(includeToJson: false) final  String id;
@override@JsonKey() final  String subPageId;
@override@JsonKey() final  String diaryId;
@override@JsonKey() final  int offsetX;
@override@JsonKey() final  int offsetY;
@override@JsonKey() final  double scale;
@override@JsonKey() final  double rotation;
@override@JsonKey() final  String url;

/// Create a copy of DiaryImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiaryImageCopyWith<_DiaryImage> get copyWith => __$DiaryImageCopyWithImpl<_DiaryImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiaryImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiaryImage&&(identical(other.id, id) || other.id == id)&&(identical(other.subPageId, subPageId) || other.subPageId == subPageId)&&(identical(other.diaryId, diaryId) || other.diaryId == diaryId)&&(identical(other.offsetX, offsetX) || other.offsetX == offsetX)&&(identical(other.offsetY, offsetY) || other.offsetY == offsetY)&&(identical(other.scale, scale) || other.scale == scale)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,subPageId,diaryId,offsetX,offsetY,scale,rotation,url);

@override
String toString() {
  return 'DiaryImage(id: $id, subPageId: $subPageId, diaryId: $diaryId, offsetX: $offsetX, offsetY: $offsetY, scale: $scale, rotation: $rotation, url: $url)';
}


}

/// @nodoc
abstract mixin class _$DiaryImageCopyWith<$Res> implements $DiaryImageCopyWith<$Res> {
  factory _$DiaryImageCopyWith(_DiaryImage value, $Res Function(_DiaryImage) _then) = __$DiaryImageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String id, String subPageId, String diaryId, int offsetX, int offsetY, double scale, double rotation, String url
});




}
/// @nodoc
class __$DiaryImageCopyWithImpl<$Res>
    implements _$DiaryImageCopyWith<$Res> {
  __$DiaryImageCopyWithImpl(this._self, this._then);

  final _DiaryImage _self;
  final $Res Function(_DiaryImage) _then;

/// Create a copy of DiaryImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? subPageId = null,Object? diaryId = null,Object? offsetX = null,Object? offsetY = null,Object? scale = null,Object? rotation = null,Object? url = null,}) {
  return _then(_DiaryImage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,subPageId: null == subPageId ? _self.subPageId : subPageId // ignore: cast_nullable_to_non_nullable
as String,diaryId: null == diaryId ? _self.diaryId : diaryId // ignore: cast_nullable_to_non_nullable
as String,offsetX: null == offsetX ? _self.offsetX : offsetX // ignore: cast_nullable_to_non_nullable
as int,offsetY: null == offsetY ? _self.offsetY : offsetY // ignore: cast_nullable_to_non_nullable
as int,scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as double,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
