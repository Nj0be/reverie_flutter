// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_controller_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PageState {

 PageController get pageController; int get currentSubPage; List<String> get pages; Size get pageSize; List<String> get texts; TextStyle get textStyle;
/// Create a copy of PageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageStateCopyWith<PageState> get copyWith => _$PageStateCopyWithImpl<PageState>(this as PageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageState&&(identical(other.pageController, pageController) || other.pageController == pageController)&&(identical(other.currentSubPage, currentSubPage) || other.currentSubPage == currentSubPage)&&const DeepCollectionEquality().equals(other.pages, pages)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other.texts, texts)&&(identical(other.textStyle, textStyle) || other.textStyle == textStyle));
}


@override
int get hashCode => Object.hash(runtimeType,pageController,currentSubPage,const DeepCollectionEquality().hash(pages),pageSize,const DeepCollectionEquality().hash(texts),textStyle);

@override
String toString() {
  return 'PageState(pageController: $pageController, currentSubPage: $currentSubPage, pages: $pages, pageSize: $pageSize, texts: $texts, textStyle: $textStyle)';
}


}

/// @nodoc
abstract mixin class $PageStateCopyWith<$Res>  {
  factory $PageStateCopyWith(PageState value, $Res Function(PageState) _then) = _$PageStateCopyWithImpl;
@useResult
$Res call({
 int currentSubPage, List<String> pages, PageController? pageController, Size pageSize, List<String> texts, TextStyle textStyle
});




}
/// @nodoc
class _$PageStateCopyWithImpl<$Res>
    implements $PageStateCopyWith<$Res> {
  _$PageStateCopyWithImpl(this._self, this._then);

  final PageState _self;
  final $Res Function(PageState) _then;

/// Create a copy of PageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentSubPage = null,Object? pages = null,Object? pageController = freezed,Object? pageSize = null,Object? texts = null,Object? textStyle = null,}) {
  return _then(_self.copyWith(
currentSubPage: null == currentSubPage ? _self.currentSubPage : currentSubPage // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<String>,pageController: freezed == pageController ? _self.pageController! : pageController // ignore: cast_nullable_to_non_nullable
as PageController?,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as Size,texts: null == texts ? _self.texts : texts // ignore: cast_nullable_to_non_nullable
as List<String>,textStyle: null == textStyle ? _self.textStyle : textStyle // ignore: cast_nullable_to_non_nullable
as TextStyle,
  ));
}

}


/// @nodoc


class _PageState extends PageState {
   _PageState({this.currentSubPage = 0, final  List<String> pages = const [], final  PageController? pageController, this.pageSize = const Size(0, 0), final  List<String> texts = const [], this.textStyle = const TextStyle(fontSize: 25, color: Colors.black)}): _pages = pages,_texts = texts,super._(pageController: pageController);
  

@override@JsonKey() final  int currentSubPage;
 final  List<String> _pages;
@override@JsonKey() List<String> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}

@override@JsonKey() final  Size pageSize;
 final  List<String> _texts;
@override@JsonKey() List<String> get texts {
  if (_texts is EqualUnmodifiableListView) return _texts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_texts);
}

@override@JsonKey() final  TextStyle textStyle;

/// Create a copy of PageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageStateCopyWith<_PageState> get copyWith => __$PageStateCopyWithImpl<_PageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageState&&(identical(other.currentSubPage, currentSubPage) || other.currentSubPage == currentSubPage)&&const DeepCollectionEquality().equals(other._pages, _pages)&&(identical(other.pageController, pageController) || other.pageController == pageController)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other._texts, _texts)&&(identical(other.textStyle, textStyle) || other.textStyle == textStyle));
}


@override
int get hashCode => Object.hash(runtimeType,currentSubPage,const DeepCollectionEquality().hash(_pages),pageController,pageSize,const DeepCollectionEquality().hash(_texts),textStyle);

@override
String toString() {
  return 'PageState(currentSubPage: $currentSubPage, pages: $pages, pageController: $pageController, pageSize: $pageSize, texts: $texts, textStyle: $textStyle)';
}


}

/// @nodoc
abstract mixin class _$PageStateCopyWith<$Res> implements $PageStateCopyWith<$Res> {
  factory _$PageStateCopyWith(_PageState value, $Res Function(_PageState) _then) = __$PageStateCopyWithImpl;
@override @useResult
$Res call({
 int currentSubPage, List<String> pages, PageController? pageController, Size pageSize, List<String> texts, TextStyle textStyle
});




}
/// @nodoc
class __$PageStateCopyWithImpl<$Res>
    implements _$PageStateCopyWith<$Res> {
  __$PageStateCopyWithImpl(this._self, this._then);

  final _PageState _self;
  final $Res Function(_PageState) _then;

/// Create a copy of PageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentSubPage = null,Object? pages = null,Object? pageController = freezed,Object? pageSize = null,Object? texts = null,Object? textStyle = null,}) {
  return _then(_PageState(
currentSubPage: null == currentSubPage ? _self.currentSubPage : currentSubPage // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<String>,pageController: freezed == pageController ? _self.pageController : pageController // ignore: cast_nullable_to_non_nullable
as PageController?,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as Size,texts: null == texts ? _self._texts : texts // ignore: cast_nullable_to_non_nullable
as List<String>,textStyle: null == textStyle ? _self.textStyle : textStyle // ignore: cast_nullable_to_non_nullable
as TextStyle,
  ));
}


}

/// @nodoc
mixin _$PageControllerParams {

 Size get pageSize; List<String> get texts;
/// Create a copy of PageControllerParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageControllerParamsCopyWith<PageControllerParams> get copyWith => _$PageControllerParamsCopyWithImpl<PageControllerParams>(this as PageControllerParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageControllerParams&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other.texts, texts));
}


@override
int get hashCode => Object.hash(runtimeType,pageSize,const DeepCollectionEquality().hash(texts));

@override
String toString() {
  return 'PageControllerParams(pageSize: $pageSize, texts: $texts)';
}


}

/// @nodoc
abstract mixin class $PageControllerParamsCopyWith<$Res>  {
  factory $PageControllerParamsCopyWith(PageControllerParams value, $Res Function(PageControllerParams) _then) = _$PageControllerParamsCopyWithImpl;
@useResult
$Res call({
 Size pageSize, List<String> texts
});




}
/// @nodoc
class _$PageControllerParamsCopyWithImpl<$Res>
    implements $PageControllerParamsCopyWith<$Res> {
  _$PageControllerParamsCopyWithImpl(this._self, this._then);

  final PageControllerParams _self;
  final $Res Function(PageControllerParams) _then;

/// Create a copy of PageControllerParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageSize = null,Object? texts = null,}) {
  return _then(_self.copyWith(
pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as Size,texts: null == texts ? _self.texts : texts // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc


class _PageControllerParams implements PageControllerParams {
   _PageControllerParams({this.pageSize = const Size(0, 0), final  List<String> texts = const []}): _texts = texts;
  

@override@JsonKey() final  Size pageSize;
 final  List<String> _texts;
@override@JsonKey() List<String> get texts {
  if (_texts is EqualUnmodifiableListView) return _texts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_texts);
}


/// Create a copy of PageControllerParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageControllerParamsCopyWith<_PageControllerParams> get copyWith => __$PageControllerParamsCopyWithImpl<_PageControllerParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageControllerParams&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other._texts, _texts));
}


@override
int get hashCode => Object.hash(runtimeType,pageSize,const DeepCollectionEquality().hash(_texts));

@override
String toString() {
  return 'PageControllerParams(pageSize: $pageSize, texts: $texts)';
}


}

/// @nodoc
abstract mixin class _$PageControllerParamsCopyWith<$Res> implements $PageControllerParamsCopyWith<$Res> {
  factory _$PageControllerParamsCopyWith(_PageControllerParams value, $Res Function(_PageControllerParams) _then) = __$PageControllerParamsCopyWithImpl;
@override @useResult
$Res call({
 Size pageSize, List<String> texts
});




}
/// @nodoc
class __$PageControllerParamsCopyWithImpl<$Res>
    implements _$PageControllerParamsCopyWith<$Res> {
  __$PageControllerParamsCopyWithImpl(this._self, this._then);

  final _PageControllerParams _self;
  final $Res Function(_PageControllerParams) _then;

/// Create a copy of PageControllerParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageSize = null,Object? texts = null,}) {
  return _then(_PageControllerParams(
pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as Size,texts: null == texts ? _self._texts : texts // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
