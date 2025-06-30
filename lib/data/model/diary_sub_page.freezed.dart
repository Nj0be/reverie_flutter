// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_sub_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiarySubPage {

@JsonKey(includeToJson: false) String get id; String get pageId; String get diaryId; List<String> get imageIds;
/// Create a copy of DiarySubPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiarySubPageCopyWith<DiarySubPage> get copyWith => _$DiarySubPageCopyWithImpl<DiarySubPage>(this as DiarySubPage, _$identity);

  /// Serializes this DiarySubPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiarySubPage&&(identical(other.id, id) || other.id == id)&&(identical(other.pageId, pageId) || other.pageId == pageId)&&(identical(other.diaryId, diaryId) || other.diaryId == diaryId)&&const DeepCollectionEquality().equals(other.imageIds, imageIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pageId,diaryId,const DeepCollectionEquality().hash(imageIds));

@override
String toString() {
  return 'DiarySubPage(id: $id, pageId: $pageId, diaryId: $diaryId, imageIds: $imageIds)';
}


}

/// @nodoc
abstract mixin class $DiarySubPageCopyWith<$Res>  {
  factory $DiarySubPageCopyWith(DiarySubPage value, $Res Function(DiarySubPage) _then) = _$DiarySubPageCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String id, String pageId, String diaryId, List<String> imageIds
});




}
/// @nodoc
class _$DiarySubPageCopyWithImpl<$Res>
    implements $DiarySubPageCopyWith<$Res> {
  _$DiarySubPageCopyWithImpl(this._self, this._then);

  final DiarySubPage _self;
  final $Res Function(DiarySubPage) _then;

/// Create a copy of DiarySubPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pageId = null,Object? diaryId = null,Object? imageIds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pageId: null == pageId ? _self.pageId : pageId // ignore: cast_nullable_to_non_nullable
as String,diaryId: null == diaryId ? _self.diaryId : diaryId // ignore: cast_nullable_to_non_nullable
as String,imageIds: null == imageIds ? _self.imageIds : imageIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DiarySubPage implements DiarySubPage {
  const _DiarySubPage({@JsonKey(includeToJson: false) this.id = '', this.pageId = '', this.diaryId = '', final  List<String> imageIds = const <String>[]}): _imageIds = imageIds;
  factory _DiarySubPage.fromJson(Map<String, dynamic> json) => _$DiarySubPageFromJson(json);

@override@JsonKey(includeToJson: false) final  String id;
@override@JsonKey() final  String pageId;
@override@JsonKey() final  String diaryId;
 final  List<String> _imageIds;
@override@JsonKey() List<String> get imageIds {
  if (_imageIds is EqualUnmodifiableListView) return _imageIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageIds);
}


/// Create a copy of DiarySubPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiarySubPageCopyWith<_DiarySubPage> get copyWith => __$DiarySubPageCopyWithImpl<_DiarySubPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiarySubPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiarySubPage&&(identical(other.id, id) || other.id == id)&&(identical(other.pageId, pageId) || other.pageId == pageId)&&(identical(other.diaryId, diaryId) || other.diaryId == diaryId)&&const DeepCollectionEquality().equals(other._imageIds, _imageIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pageId,diaryId,const DeepCollectionEquality().hash(_imageIds));

@override
String toString() {
  return 'DiarySubPage(id: $id, pageId: $pageId, diaryId: $diaryId, imageIds: $imageIds)';
}


}

/// @nodoc
abstract mixin class _$DiarySubPageCopyWith<$Res> implements $DiarySubPageCopyWith<$Res> {
  factory _$DiarySubPageCopyWith(_DiarySubPage value, $Res Function(_DiarySubPage) _then) = __$DiarySubPageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String id, String pageId, String diaryId, List<String> imageIds
});




}
/// @nodoc
class __$DiarySubPageCopyWithImpl<$Res>
    implements _$DiarySubPageCopyWith<$Res> {
  __$DiarySubPageCopyWithImpl(this._self, this._then);

  final _DiarySubPage _self;
  final $Res Function(_DiarySubPage) _then;

/// Create a copy of DiarySubPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pageId = null,Object? diaryId = null,Object? imageIds = null,}) {
  return _then(_DiarySubPage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pageId: null == pageId ? _self.pageId : pageId // ignore: cast_nullable_to_non_nullable
as String,diaryId: null == diaryId ? _self.diaryId : diaryId // ignore: cast_nullable_to_non_nullable
as String,imageIds: null == imageIds ? _self._imageIds : imageIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
