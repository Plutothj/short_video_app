import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_model.freezed.dart';
part 'comments_model.g.dart';

@freezed
abstract class CommentsModel with _$CommentsModel {
  factory CommentsModel({required List<Comments> comments}) = _CommentsModel;

  factory CommentsModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelFromJson(json);
}

@freezed
abstract class Comments with _$Comments {
  factory Comments({
    @Default('') String commentId,
    @Default(0) int createTime,
    @Default('') String ipLocation,
    @Default('') String awemeId,
    @Default('') String content,
    @Default(false) bool isAuthorDigged,
    @Default(false) bool isFolded,
    @Default(false) bool isHot,
    @Default(false) bool userBuried,
    @Default(0) int userDigged,
    @Default('0') String diggCount,
    @Default('') String userId,
    @Default('') String secUid,
    @Default('') String shortUserId,
    @Default('') String userUniqueId,
    @Default('') String userSignature,
    @Default('') String nickname,
    @Default('') String avatar,
    @Default('0') String subCommentCount,
    @Default(0) int lastModifyTs,
  }) = _Comments;

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
    commentId: json['comment_id'] as String? ?? '',
    createTime: (json['create_time'] as num?)?.toInt() ?? 0,
    ipLocation: json['ip_location'] as String? ?? '',
    awemeId: json['aweme_id'] as String? ?? '',
    content: json['content'] as String? ?? '',
    isAuthorDigged: json['is_author_digged'] as bool? ?? false,
    isFolded: json['is_folded'] as bool? ?? false,
    isHot: json['is_hot'] as bool? ?? false,
    userBuried: json['user_buried'] as bool? ?? false,
    userDigged: (json['user_digged'] as num?)?.toInt() ?? 0,
    diggCount: json['digg_count'] as String? ?? '0',
    userId: json['user_id'] as String? ?? '',
    secUid: json['sec_uid'] as String? ?? '',
    shortUserId: json['short_user_id'] as String? ?? '',
    userUniqueId: json['user_unique_id'] as String? ?? '',
    userSignature: json['user_signature'] as String? ?? '',
    nickname: json['nickname'] as String? ?? '',
    avatar: json['avatar'] as String? ?? '',
    subCommentCount: json['sub_comment_count'] as String? ?? '0',
    lastModifyTs: (json['last_modify_ts'] as num?)?.toInt() ?? 0,
  );
}
