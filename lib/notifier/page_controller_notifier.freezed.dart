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

 PageController get pageController; int get currentPage; List<String> get pages;
/// Create a copy of PageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageStateCopyWith<PageState> get copyWith => _$PageStateCopyWithImpl<PageState>(this as PageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageState&&(identical(other.pageController, pageController) || other.pageController == pageController)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other.pages, pages));
}


@override
int get hashCode => Object.hash(runtimeType,pageController,currentPage,const DeepCollectionEquality().hash(pages));

@override
String toString() {
  return 'PageState(pageController: $pageController, currentPage: $currentPage, pages: $pages)';
}


}

/// @nodoc
abstract mixin class $PageStateCopyWith<$Res>  {
  factory $PageStateCopyWith(PageState value, $Res Function(PageState) _then) = _$PageStateCopyWithImpl;
@useResult
$Res call({
 int currentPage, List<String> pages, PageController? pageController
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
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? pages = null,Object? pageController = freezed,}) {
  return _then(_self.copyWith(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<String>,pageController: freezed == pageController ? _self.pageController! : pageController // ignore: cast_nullable_to_non_nullable
as PageController?,
  ));
}

}


/// @nodoc


class _PageState extends PageState {
   _PageState({required this.currentPage, required final  List<String> pages, final  PageController? pageController}): _pages = pages,super._(pageController: pageController);
  

@override final  int currentPage;
 final  List<String> _pages;
@override List<String> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}


/// Create a copy of PageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageStateCopyWith<_PageState> get copyWith => __$PageStateCopyWithImpl<_PageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageState&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other._pages, _pages)&&(identical(other.pageController, pageController) || other.pageController == pageController));
}


@override
int get hashCode => Object.hash(runtimeType,currentPage,const DeepCollectionEquality().hash(_pages),pageController);

@override
String toString() {
  return 'PageState(currentPage: $currentPage, pages: $pages, pageController: $pageController)';
}


}

/// @nodoc
abstract mixin class _$PageStateCopyWith<$Res> implements $PageStateCopyWith<$Res> {
  factory _$PageStateCopyWith(_PageState value, $Res Function(_PageState) _then) = __$PageStateCopyWithImpl;
@override @useResult
$Res call({
 int currentPage, List<String> pages, PageController? pageController
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
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? pages = null,Object? pageController = freezed,}) {
  return _then(_PageState(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<String>,pageController: freezed == pageController ? _self.pageController : pageController // ignore: cast_nullable_to_non_nullable
as PageController?,
  ));
}


}

// dart format on
