// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentsModel {

 List<Comments> get comments;
/// Create a copy of CommentsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentsModelCopyWith<CommentsModel> get copyWith => _$CommentsModelCopyWithImpl<CommentsModel>(this as CommentsModel, _$identity);

  /// Serializes this CommentsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentsModel&&const DeepCollectionEquality().equals(other.comments, comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(comments));

@override
String toString() {
  return 'CommentsModel(comments: $comments)';
}


}

/// @nodoc
abstract mixin class $CommentsModelCopyWith<$Res>  {
  factory $CommentsModelCopyWith(CommentsModel value, $Res Function(CommentsModel) _then) = _$CommentsModelCopyWithImpl;
@useResult
$Res call({
 List<Comments> comments
});




}
/// @nodoc
class _$CommentsModelCopyWithImpl<$Res>
    implements $CommentsModelCopyWith<$Res> {
  _$CommentsModelCopyWithImpl(this._self, this._then);

  final CommentsModel _self;
  final $Res Function(CommentsModel) _then;

/// Create a copy of CommentsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comments = null,}) {
  return _then(_self.copyWith(
comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<Comments>,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentsModel].
extension CommentsModelPatterns on CommentsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentsModel value)  $default,){
final _that = this;
switch (_that) {
case _CommentsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentsModel value)?  $default,){
final _that = this;
switch (_that) {
case _CommentsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Comments> comments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentsModel() when $default != null:
return $default(_that.comments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Comments> comments)  $default,) {final _that = this;
switch (_that) {
case _CommentsModel():
return $default(_that.comments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Comments> comments)?  $default,) {final _that = this;
switch (_that) {
case _CommentsModel() when $default != null:
return $default(_that.comments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommentsModel implements CommentsModel {
   _CommentsModel({required final  List<Comments> comments}): _comments = comments;
  factory _CommentsModel.fromJson(Map<String, dynamic> json) => _$CommentsModelFromJson(json);

 final  List<Comments> _comments;
@override List<Comments> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}


/// Create a copy of CommentsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentsModelCopyWith<_CommentsModel> get copyWith => __$CommentsModelCopyWithImpl<_CommentsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentsModel&&const DeepCollectionEquality().equals(other._comments, _comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_comments));

@override
String toString() {
  return 'CommentsModel(comments: $comments)';
}


}

/// @nodoc
abstract mixin class _$CommentsModelCopyWith<$Res> implements $CommentsModelCopyWith<$Res> {
  factory _$CommentsModelCopyWith(_CommentsModel value, $Res Function(_CommentsModel) _then) = __$CommentsModelCopyWithImpl;
@override @useResult
$Res call({
 List<Comments> comments
});




}
/// @nodoc
class __$CommentsModelCopyWithImpl<$Res>
    implements _$CommentsModelCopyWith<$Res> {
  __$CommentsModelCopyWithImpl(this._self, this._then);

  final _CommentsModel _self;
  final $Res Function(_CommentsModel) _then;

/// Create a copy of CommentsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comments = null,}) {
  return _then(_CommentsModel(
comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<Comments>,
  ));
}


}


/// @nodoc
mixin _$Comments {

 String get commentId; int get createTime; String get ipLocation; String get awemeId; String get content; bool get isAuthorDigged; bool get isFolded; bool get isHot; bool get userBuried; int get userDigged; String get diggCount; String get userId; String get secUid; String get shortUserId; String get userUniqueId; String get userSignature; String get nickname; String get avatar; String get subCommentCount; int get lastModifyTs;
/// Create a copy of Comments
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentsCopyWith<Comments> get copyWith => _$CommentsCopyWithImpl<Comments>(this as Comments, _$identity);

  /// Serializes this Comments to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Comments&&(identical(other.commentId, commentId) || other.commentId == commentId)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.ipLocation, ipLocation) || other.ipLocation == ipLocation)&&(identical(other.awemeId, awemeId) || other.awemeId == awemeId)&&(identical(other.content, content) || other.content == content)&&(identical(other.isAuthorDigged, isAuthorDigged) || other.isAuthorDigged == isAuthorDigged)&&(identical(other.isFolded, isFolded) || other.isFolded == isFolded)&&(identical(other.isHot, isHot) || other.isHot == isHot)&&(identical(other.userBuried, userBuried) || other.userBuried == userBuried)&&(identical(other.userDigged, userDigged) || other.userDigged == userDigged)&&(identical(other.diggCount, diggCount) || other.diggCount == diggCount)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.secUid, secUid) || other.secUid == secUid)&&(identical(other.shortUserId, shortUserId) || other.shortUserId == shortUserId)&&(identical(other.userUniqueId, userUniqueId) || other.userUniqueId == userUniqueId)&&(identical(other.userSignature, userSignature) || other.userSignature == userSignature)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.subCommentCount, subCommentCount) || other.subCommentCount == subCommentCount)&&(identical(other.lastModifyTs, lastModifyTs) || other.lastModifyTs == lastModifyTs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,commentId,createTime,ipLocation,awemeId,content,isAuthorDigged,isFolded,isHot,userBuried,userDigged,diggCount,userId,secUid,shortUserId,userUniqueId,userSignature,nickname,avatar,subCommentCount,lastModifyTs]);

@override
String toString() {
  return 'Comments(commentId: $commentId, createTime: $createTime, ipLocation: $ipLocation, awemeId: $awemeId, content: $content, isAuthorDigged: $isAuthorDigged, isFolded: $isFolded, isHot: $isHot, userBuried: $userBuried, userDigged: $userDigged, diggCount: $diggCount, userId: $userId, secUid: $secUid, shortUserId: $shortUserId, userUniqueId: $userUniqueId, userSignature: $userSignature, nickname: $nickname, avatar: $avatar, subCommentCount: $subCommentCount, lastModifyTs: $lastModifyTs)';
}


}

/// @nodoc
abstract mixin class $CommentsCopyWith<$Res>  {
  factory $CommentsCopyWith(Comments value, $Res Function(Comments) _then) = _$CommentsCopyWithImpl;
@useResult
$Res call({
 String commentId, int createTime, String ipLocation, String awemeId, String content, bool isAuthorDigged, bool isFolded, bool isHot, bool userBuried, int userDigged, String diggCount, String userId, String secUid, String shortUserId, String userUniqueId, String userSignature, String nickname, String avatar, String subCommentCount, int lastModifyTs
});




}
/// @nodoc
class _$CommentsCopyWithImpl<$Res>
    implements $CommentsCopyWith<$Res> {
  _$CommentsCopyWithImpl(this._self, this._then);

  final Comments _self;
  final $Res Function(Comments) _then;

/// Create a copy of Comments
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? commentId = null,Object? createTime = null,Object? ipLocation = null,Object? awemeId = null,Object? content = null,Object? isAuthorDigged = null,Object? isFolded = null,Object? isHot = null,Object? userBuried = null,Object? userDigged = null,Object? diggCount = null,Object? userId = null,Object? secUid = null,Object? shortUserId = null,Object? userUniqueId = null,Object? userSignature = null,Object? nickname = null,Object? avatar = null,Object? subCommentCount = null,Object? lastModifyTs = null,}) {
  return _then(_self.copyWith(
commentId: null == commentId ? _self.commentId : commentId // ignore: cast_nullable_to_non_nullable
as String,createTime: null == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as int,ipLocation: null == ipLocation ? _self.ipLocation : ipLocation // ignore: cast_nullable_to_non_nullable
as String,awemeId: null == awemeId ? _self.awemeId : awemeId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isAuthorDigged: null == isAuthorDigged ? _self.isAuthorDigged : isAuthorDigged // ignore: cast_nullable_to_non_nullable
as bool,isFolded: null == isFolded ? _self.isFolded : isFolded // ignore: cast_nullable_to_non_nullable
as bool,isHot: null == isHot ? _self.isHot : isHot // ignore: cast_nullable_to_non_nullable
as bool,userBuried: null == userBuried ? _self.userBuried : userBuried // ignore: cast_nullable_to_non_nullable
as bool,userDigged: null == userDigged ? _self.userDigged : userDigged // ignore: cast_nullable_to_non_nullable
as int,diggCount: null == diggCount ? _self.diggCount : diggCount // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,secUid: null == secUid ? _self.secUid : secUid // ignore: cast_nullable_to_non_nullable
as String,shortUserId: null == shortUserId ? _self.shortUserId : shortUserId // ignore: cast_nullable_to_non_nullable
as String,userUniqueId: null == userUniqueId ? _self.userUniqueId : userUniqueId // ignore: cast_nullable_to_non_nullable
as String,userSignature: null == userSignature ? _self.userSignature : userSignature // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,subCommentCount: null == subCommentCount ? _self.subCommentCount : subCommentCount // ignore: cast_nullable_to_non_nullable
as String,lastModifyTs: null == lastModifyTs ? _self.lastModifyTs : lastModifyTs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Comments].
extension CommentsPatterns on Comments {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Comments value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Comments() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Comments value)  $default,){
final _that = this;
switch (_that) {
case _Comments():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Comments value)?  $default,){
final _that = this;
switch (_that) {
case _Comments() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String commentId,  int createTime,  String ipLocation,  String awemeId,  String content,  bool isAuthorDigged,  bool isFolded,  bool isHot,  bool userBuried,  int userDigged,  String diggCount,  String userId,  String secUid,  String shortUserId,  String userUniqueId,  String userSignature,  String nickname,  String avatar,  String subCommentCount,  int lastModifyTs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Comments() when $default != null:
return $default(_that.commentId,_that.createTime,_that.ipLocation,_that.awemeId,_that.content,_that.isAuthorDigged,_that.isFolded,_that.isHot,_that.userBuried,_that.userDigged,_that.diggCount,_that.userId,_that.secUid,_that.shortUserId,_that.userUniqueId,_that.userSignature,_that.nickname,_that.avatar,_that.subCommentCount,_that.lastModifyTs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String commentId,  int createTime,  String ipLocation,  String awemeId,  String content,  bool isAuthorDigged,  bool isFolded,  bool isHot,  bool userBuried,  int userDigged,  String diggCount,  String userId,  String secUid,  String shortUserId,  String userUniqueId,  String userSignature,  String nickname,  String avatar,  String subCommentCount,  int lastModifyTs)  $default,) {final _that = this;
switch (_that) {
case _Comments():
return $default(_that.commentId,_that.createTime,_that.ipLocation,_that.awemeId,_that.content,_that.isAuthorDigged,_that.isFolded,_that.isHot,_that.userBuried,_that.userDigged,_that.diggCount,_that.userId,_that.secUid,_that.shortUserId,_that.userUniqueId,_that.userSignature,_that.nickname,_that.avatar,_that.subCommentCount,_that.lastModifyTs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String commentId,  int createTime,  String ipLocation,  String awemeId,  String content,  bool isAuthorDigged,  bool isFolded,  bool isHot,  bool userBuried,  int userDigged,  String diggCount,  String userId,  String secUid,  String shortUserId,  String userUniqueId,  String userSignature,  String nickname,  String avatar,  String subCommentCount,  int lastModifyTs)?  $default,) {final _that = this;
switch (_that) {
case _Comments() when $default != null:
return $default(_that.commentId,_that.createTime,_that.ipLocation,_that.awemeId,_that.content,_that.isAuthorDigged,_that.isFolded,_that.isHot,_that.userBuried,_that.userDigged,_that.diggCount,_that.userId,_that.secUid,_that.shortUserId,_that.userUniqueId,_that.userSignature,_that.nickname,_that.avatar,_that.subCommentCount,_that.lastModifyTs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Comments implements Comments {
   _Comments({this.commentId = '', this.createTime = 0, this.ipLocation = '', this.awemeId = '', this.content = '', this.isAuthorDigged = false, this.isFolded = false, this.isHot = false, this.userBuried = false, this.userDigged = 0, this.diggCount = '0', this.userId = '', this.secUid = '', this.shortUserId = '', this.userUniqueId = '', this.userSignature = '', this.nickname = '', this.avatar = '', this.subCommentCount = '0', this.lastModifyTs = 0});
  factory _Comments.fromJson(Map<String, dynamic> json) => _$CommentsFromJson(json);

@override@JsonKey() final  String commentId;
@override@JsonKey() final  int createTime;
@override@JsonKey() final  String ipLocation;
@override@JsonKey() final  String awemeId;
@override@JsonKey() final  String content;
@override@JsonKey() final  bool isAuthorDigged;
@override@JsonKey() final  bool isFolded;
@override@JsonKey() final  bool isHot;
@override@JsonKey() final  bool userBuried;
@override@JsonKey() final  int userDigged;
@override@JsonKey() final  String diggCount;
@override@JsonKey() final  String userId;
@override@JsonKey() final  String secUid;
@override@JsonKey() final  String shortUserId;
@override@JsonKey() final  String userUniqueId;
@override@JsonKey() final  String userSignature;
@override@JsonKey() final  String nickname;
@override@JsonKey() final  String avatar;
@override@JsonKey() final  String subCommentCount;
@override@JsonKey() final  int lastModifyTs;

/// Create a copy of Comments
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentsCopyWith<_Comments> get copyWith => __$CommentsCopyWithImpl<_Comments>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Comments&&(identical(other.commentId, commentId) || other.commentId == commentId)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.ipLocation, ipLocation) || other.ipLocation == ipLocation)&&(identical(other.awemeId, awemeId) || other.awemeId == awemeId)&&(identical(other.content, content) || other.content == content)&&(identical(other.isAuthorDigged, isAuthorDigged) || other.isAuthorDigged == isAuthorDigged)&&(identical(other.isFolded, isFolded) || other.isFolded == isFolded)&&(identical(other.isHot, isHot) || other.isHot == isHot)&&(identical(other.userBuried, userBuried) || other.userBuried == userBuried)&&(identical(other.userDigged, userDigged) || other.userDigged == userDigged)&&(identical(other.diggCount, diggCount) || other.diggCount == diggCount)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.secUid, secUid) || other.secUid == secUid)&&(identical(other.shortUserId, shortUserId) || other.shortUserId == shortUserId)&&(identical(other.userUniqueId, userUniqueId) || other.userUniqueId == userUniqueId)&&(identical(other.userSignature, userSignature) || other.userSignature == userSignature)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.subCommentCount, subCommentCount) || other.subCommentCount == subCommentCount)&&(identical(other.lastModifyTs, lastModifyTs) || other.lastModifyTs == lastModifyTs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,commentId,createTime,ipLocation,awemeId,content,isAuthorDigged,isFolded,isHot,userBuried,userDigged,diggCount,userId,secUid,shortUserId,userUniqueId,userSignature,nickname,avatar,subCommentCount,lastModifyTs]);

@override
String toString() {
  return 'Comments(commentId: $commentId, createTime: $createTime, ipLocation: $ipLocation, awemeId: $awemeId, content: $content, isAuthorDigged: $isAuthorDigged, isFolded: $isFolded, isHot: $isHot, userBuried: $userBuried, userDigged: $userDigged, diggCount: $diggCount, userId: $userId, secUid: $secUid, shortUserId: $shortUserId, userUniqueId: $userUniqueId, userSignature: $userSignature, nickname: $nickname, avatar: $avatar, subCommentCount: $subCommentCount, lastModifyTs: $lastModifyTs)';
}


}

/// @nodoc
abstract mixin class _$CommentsCopyWith<$Res> implements $CommentsCopyWith<$Res> {
  factory _$CommentsCopyWith(_Comments value, $Res Function(_Comments) _then) = __$CommentsCopyWithImpl;
@override @useResult
$Res call({
 String commentId, int createTime, String ipLocation, String awemeId, String content, bool isAuthorDigged, bool isFolded, bool isHot, bool userBuried, int userDigged, String diggCount, String userId, String secUid, String shortUserId, String userUniqueId, String userSignature, String nickname, String avatar, String subCommentCount, int lastModifyTs
});




}
/// @nodoc
class __$CommentsCopyWithImpl<$Res>
    implements _$CommentsCopyWith<$Res> {
  __$CommentsCopyWithImpl(this._self, this._then);

  final _Comments _self;
  final $Res Function(_Comments) _then;

/// Create a copy of Comments
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? commentId = null,Object? createTime = null,Object? ipLocation = null,Object? awemeId = null,Object? content = null,Object? isAuthorDigged = null,Object? isFolded = null,Object? isHot = null,Object? userBuried = null,Object? userDigged = null,Object? diggCount = null,Object? userId = null,Object? secUid = null,Object? shortUserId = null,Object? userUniqueId = null,Object? userSignature = null,Object? nickname = null,Object? avatar = null,Object? subCommentCount = null,Object? lastModifyTs = null,}) {
  return _then(_Comments(
commentId: null == commentId ? _self.commentId : commentId // ignore: cast_nullable_to_non_nullable
as String,createTime: null == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as int,ipLocation: null == ipLocation ? _self.ipLocation : ipLocation // ignore: cast_nullable_to_non_nullable
as String,awemeId: null == awemeId ? _self.awemeId : awemeId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isAuthorDigged: null == isAuthorDigged ? _self.isAuthorDigged : isAuthorDigged // ignore: cast_nullable_to_non_nullable
as bool,isFolded: null == isFolded ? _self.isFolded : isFolded // ignore: cast_nullable_to_non_nullable
as bool,isHot: null == isHot ? _self.isHot : isHot // ignore: cast_nullable_to_non_nullable
as bool,userBuried: null == userBuried ? _self.userBuried : userBuried // ignore: cast_nullable_to_non_nullable
as bool,userDigged: null == userDigged ? _self.userDigged : userDigged // ignore: cast_nullable_to_non_nullable
as int,diggCount: null == diggCount ? _self.diggCount : diggCount // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,secUid: null == secUid ? _self.secUid : secUid // ignore: cast_nullable_to_non_nullable
as String,shortUserId: null == shortUserId ? _self.shortUserId : shortUserId // ignore: cast_nullable_to_non_nullable
as String,userUniqueId: null == userUniqueId ? _self.userUniqueId : userUniqueId // ignore: cast_nullable_to_non_nullable
as String,userSignature: null == userSignature ? _self.userSignature : userSignature // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,subCommentCount: null == subCommentCount ? _self.subCommentCount : subCommentCount // ignore: cast_nullable_to_non_nullable
as String,lastModifyTs: null == lastModifyTs ? _self.lastModifyTs : lastModifyTs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
