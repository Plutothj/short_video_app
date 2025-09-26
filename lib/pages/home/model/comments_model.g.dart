// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentsModel _$CommentsModelFromJson(Map<String, dynamic> json) =>
    _CommentsModel(
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentsModelToJson(_CommentsModel instance) =>
    <String, dynamic>{'comments': instance.comments};

_Comments _$CommentsFromJson(Map<String, dynamic> json) => _Comments(
  commentId: json['commentId'] as String? ?? '',
  createTime: (json['createTime'] as num?)?.toInt() ?? 0,
  ipLocation: json['ipLocation'] as String? ?? '',
  awemeId: json['awemeId'] as String? ?? '',
  content: json['content'] as String? ?? '',
  isAuthorDigged: json['isAuthorDigged'] as bool? ?? false,
  isFolded: json['isFolded'] as bool? ?? false,
  isHot: json['isHot'] as bool? ?? false,
  userBuried: json['userBuried'] as bool? ?? false,
  userDigged: (json['userDigged'] as num?)?.toInt() ?? 0,
  diggCount: json['diggCount'] as String? ?? '0',
  userId: json['userId'] as String? ?? '',
  secUid: json['secUid'] as String? ?? '',
  shortUserId: json['shortUserId'] as String? ?? '',
  userUniqueId: json['userUniqueId'] as String? ?? '',
  userSignature: json['userSignature'] as String? ?? '',
  nickname: json['nickname'] as String? ?? '',
  avatar: json['avatar'] as String? ?? '',
  subCommentCount: json['subCommentCount'] as String? ?? '0',
  lastModifyTs: (json['lastModifyTs'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CommentsToJson(_Comments instance) => <String, dynamic>{
  'commentId': instance.commentId,
  'createTime': instance.createTime,
  'ipLocation': instance.ipLocation,
  'awemeId': instance.awemeId,
  'content': instance.content,
  'isAuthorDigged': instance.isAuthorDigged,
  'isFolded': instance.isFolded,
  'isHot': instance.isHot,
  'userBuried': instance.userBuried,
  'userDigged': instance.userDigged,
  'diggCount': instance.diggCount,
  'userId': instance.userId,
  'secUid': instance.secUid,
  'shortUserId': instance.shortUserId,
  'userUniqueId': instance.userUniqueId,
  'userSignature': instance.userSignature,
  'nickname': instance.nickname,
  'avatar': instance.avatar,
  'subCommentCount': instance.subCommentCount,
  'lastModifyTs': instance.lastModifyTs,
};
