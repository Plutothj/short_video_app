// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoItemModel {

 String get ep; String get coverUrl; int get like; int get like_number; int get collect; int get collect_number;
/// Create a copy of VideoItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoItemModelCopyWith<VideoItemModel> get copyWith => _$VideoItemModelCopyWithImpl<VideoItemModel>(this as VideoItemModel, _$identity);

  /// Serializes this VideoItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoItemModel&&(identical(other.ep, ep) || other.ep == ep)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.like, like) || other.like == like)&&(identical(other.like_number, like_number) || other.like_number == like_number)&&(identical(other.collect, collect) || other.collect == collect)&&(identical(other.collect_number, collect_number) || other.collect_number == collect_number));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ep,coverUrl,like,like_number,collect,collect_number);

@override
String toString() {
  return 'VideoItemModel(ep: $ep, coverUrl: $coverUrl, like: $like, like_number: $like_number, collect: $collect, collect_number: $collect_number)';
}


}

/// @nodoc
abstract mixin class $VideoItemModelCopyWith<$Res>  {
  factory $VideoItemModelCopyWith(VideoItemModel value, $Res Function(VideoItemModel) _then) = _$VideoItemModelCopyWithImpl;
@useResult
$Res call({
 String ep, String coverUrl, int like, int like_number, int collect, int collect_number
});




}
/// @nodoc
class _$VideoItemModelCopyWithImpl<$Res>
    implements $VideoItemModelCopyWith<$Res> {
  _$VideoItemModelCopyWithImpl(this._self, this._then);

  final VideoItemModel _self;
  final $Res Function(VideoItemModel) _then;

/// Create a copy of VideoItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ep = null,Object? coverUrl = null,Object? like = null,Object? like_number = null,Object? collect = null,Object? collect_number = null,}) {
  return _then(_self.copyWith(
ep: null == ep ? _self.ep : ep // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,like: null == like ? _self.like : like // ignore: cast_nullable_to_non_nullable
as int,like_number: null == like_number ? _self.like_number : like_number // ignore: cast_nullable_to_non_nullable
as int,collect: null == collect ? _self.collect : collect // ignore: cast_nullable_to_non_nullable
as int,collect_number: null == collect_number ? _self.collect_number : collect_number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoItemModel].
extension VideoItemModelPatterns on VideoItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoItemModel value)  $default,){
final _that = this;
switch (_that) {
case _VideoItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _VideoItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ep,  String coverUrl,  int like,  int like_number,  int collect,  int collect_number)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoItemModel() when $default != null:
return $default(_that.ep,_that.coverUrl,_that.like,_that.like_number,_that.collect,_that.collect_number);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ep,  String coverUrl,  int like,  int like_number,  int collect,  int collect_number)  $default,) {final _that = this;
switch (_that) {
case _VideoItemModel():
return $default(_that.ep,_that.coverUrl,_that.like,_that.like_number,_that.collect,_that.collect_number);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ep,  String coverUrl,  int like,  int like_number,  int collect,  int collect_number)?  $default,) {final _that = this;
switch (_that) {
case _VideoItemModel() when $default != null:
return $default(_that.ep,_that.coverUrl,_that.like,_that.like_number,_that.collect,_that.collect_number);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VideoItemModel implements VideoItemModel {
  const _VideoItemModel({required this.ep, required this.coverUrl, required this.like, required this.like_number, required this.collect, required this.collect_number});
  factory _VideoItemModel.fromJson(Map<String, dynamic> json) => _$VideoItemModelFromJson(json);

@override final  String ep;
@override final  String coverUrl;
@override final  int like;
@override final  int like_number;
@override final  int collect;
@override final  int collect_number;

/// Create a copy of VideoItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoItemModelCopyWith<_VideoItemModel> get copyWith => __$VideoItemModelCopyWithImpl<_VideoItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoItemModel&&(identical(other.ep, ep) || other.ep == ep)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.like, like) || other.like == like)&&(identical(other.like_number, like_number) || other.like_number == like_number)&&(identical(other.collect, collect) || other.collect == collect)&&(identical(other.collect_number, collect_number) || other.collect_number == collect_number));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ep,coverUrl,like,like_number,collect,collect_number);

@override
String toString() {
  return 'VideoItemModel(ep: $ep, coverUrl: $coverUrl, like: $like, like_number: $like_number, collect: $collect, collect_number: $collect_number)';
}


}

/// @nodoc
abstract mixin class _$VideoItemModelCopyWith<$Res> implements $VideoItemModelCopyWith<$Res> {
  factory _$VideoItemModelCopyWith(_VideoItemModel value, $Res Function(_VideoItemModel) _then) = __$VideoItemModelCopyWithImpl;
@override @useResult
$Res call({
 String ep, String coverUrl, int like, int like_number, int collect, int collect_number
});




}
/// @nodoc
class __$VideoItemModelCopyWithImpl<$Res>
    implements _$VideoItemModelCopyWith<$Res> {
  __$VideoItemModelCopyWithImpl(this._self, this._then);

  final _VideoItemModel _self;
  final $Res Function(_VideoItemModel) _then;

/// Create a copy of VideoItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ep = null,Object? coverUrl = null,Object? like = null,Object? like_number = null,Object? collect = null,Object? collect_number = null,}) {
  return _then(_VideoItemModel(
ep: null == ep ? _self.ep : ep // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,like: null == like ? _self.like : like // ignore: cast_nullable_to_non_nullable
as int,like_number: null == like_number ? _self.like_number : like_number // ignore: cast_nullable_to_non_nullable
as int,collect: null == collect ? _self.collect : collect // ignore: cast_nullable_to_non_nullable
as int,collect_number: null == collect_number ? _self.collect_number : collect_number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
