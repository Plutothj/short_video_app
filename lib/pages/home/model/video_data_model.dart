// To parse this JSON data, do
//
//     final videoData = videoDataFromJson(jsonString);

import 'dart:convert';

List<VideoData> videoDataFromJson(String str) =>
    List<VideoData>.from(json.decode(str).map((x) => VideoData.fromJson(x)));

String videoDataToJson(List<VideoData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoData {
  String awemeId;
  String desc;
  int createTime;
  Music music;
  Video video;
  String shareUrl;
  Statistics statistics;
  Status status;
  List<TextExtra> textExtra;
  int isTop;
  VideoDatumShareInfo shareInfo;
  int duration;
  dynamic imageInfos;
  RiskInfos riskInfos;
  dynamic position;
  int authorUserId;
  Author author;
  bool preventDownload;
  dynamic longVideo;
  AwemeControl awemeControl;
  dynamic images;
  SuggestWords suggestWords;

  VideoData({
    required this.awemeId,
    required this.desc,
    required this.createTime,
    required this.music,
    required this.video,
    required this.shareUrl,
    required this.statistics,
    required this.status,
    required this.textExtra,
    required this.isTop,
    required this.shareInfo,
    required this.duration,
    required this.imageInfos,
    required this.riskInfos,
    required this.position,
    required this.authorUserId,
    required this.author,
    required this.preventDownload,
    required this.longVideo,
    required this.awemeControl,
    required this.images,
    required this.suggestWords,
  });

  factory VideoData.fromJson(Map<String, dynamic> json) => VideoData(
    awemeId: json["aweme_id"] ?? "",
    desc: json["desc"] ?? "",
    createTime: json["create_time"] ?? 0,
    music: Music.fromJson(json["music"]),
    video: Video.fromJson(json["video"]),
    shareUrl: json["share_url"] ?? "",
    statistics: Statistics.fromJson(json["statistics"]),
    status: Status.fromJson(json["status"]),
    textExtra: json["text_extra"] != null
        ? List<TextExtra>.from(
            json["text_extra"].map((x) => TextExtra.fromJson(x)),
          )
        : [],
    isTop: json["is_top"] ?? 0,
    shareInfo: VideoDatumShareInfo.fromJson(json["share_info"]),
    duration: json["duration"] ?? 0,
    imageInfos: json["image_infos"],
    riskInfos: RiskInfos.fromJson(json["risk_infos"]),
    position: json["position"],
    authorUserId: json["author_user_id"] ?? 0,
    author: Author.fromJson(json["author"]),
    preventDownload: json["prevent_download"] ?? false,
    longVideo: json["long_video"],
    awemeControl: AwemeControl.fromJson(json["aweme_control"]),
    images: json["images"],
    suggestWords: SuggestWords.fromJson(json["suggest_words"]),
  );

  Map<String, dynamic> toJson() => {
    "aweme_id": awemeId,
    "desc": desc,
    "create_time": createTime,
    "music": music.toJson(),
    "video": video.toJson(),
    "share_url": shareUrl,
    "statistics": statistics.toJson(),
    "status": status.toJson(),
    "text_extra": List<dynamic>.from(textExtra.map((x) => x.toJson())),
    "is_top": isTop,
    "share_info": shareInfo.toJson(),
    "duration": duration,
    "image_infos": imageInfos,
    "risk_infos": riskInfos.toJson(),
    "position": position,
    "author_user_id": authorUserId,
    "author": author.toJson(),
    "prevent_download": preventDownload,
    "long_video": longVideo,
    "aweme_control": awemeControl.toJson(),
    "images": images,
    "suggest_words": suggestWords.toJson(),
  };
}

class Author {
  Avatar168X168 avatar168X168;
  Avatar168X168 avatar300X300;
  int awemeCount;
  int birthdayHideLevel;
  int canShowGroupCard;
  List<CardEntry> cardEntries;
  String city;
  CommerceInfo commerceInfo;
  CommerceUserInfo commerceUserInfo;
  int commerceUserLevel;
  String country;
  String coverColour;
  List<CoverUrl> coverUrl;
  String district;
  int favoritingCount;
  int followStatus;
  int followerCount;
  int followerRequestStatus;
  int followerStatus;
  int followingCount;
  int forwardCount;
  int gender;
  String ipLocation;
  int maxFollowerCount;
  int mplatformFollowersCount;
  String nickname;
  String province;
  int publicCollectsCount;
  AuthorShareInfo shareInfo;
  String shortId;
  String signature;
  int totalFavorited;
  String uid;
  String uniqueId;
  int userAge;
  List<CoverUrl> whiteCoverUrl;

  Author({
    required this.avatar168X168,
    required this.avatar300X300,
    required this.awemeCount,
    required this.birthdayHideLevel,
    required this.canShowGroupCard,
    required this.cardEntries,
    required this.city,
    required this.commerceInfo,
    required this.commerceUserInfo,
    required this.commerceUserLevel,
    required this.country,
    required this.coverColour,
    required this.coverUrl,
    required this.district,
    required this.favoritingCount,
    required this.followStatus,
    required this.followerCount,
    required this.followerRequestStatus,
    required this.followerStatus,
    required this.followingCount,
    required this.forwardCount,
    required this.gender,
    required this.ipLocation,
    required this.maxFollowerCount,
    required this.mplatformFollowersCount,
    required this.nickname,
    required this.province,
    required this.publicCollectsCount,
    required this.shareInfo,
    required this.shortId,
    required this.signature,
    required this.totalFavorited,
    required this.uid,
    required this.uniqueId,
    required this.userAge,
    required this.whiteCoverUrl,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    avatar168X168: Avatar168X168.fromJson(json["avatar_168x168"]),
    avatar300X300: Avatar168X168.fromJson(json["avatar_300x300"]),
    awemeCount: json["aweme_count"] ?? 0,
    birthdayHideLevel: json["birthday_hide_level"] ?? 0,
    canShowGroupCard: json["can_show_group_card"] ?? false,
    cardEntries: json["card_entries"] != null
        ? List<CardEntry>.from(
            json["card_entries"].map((x) => CardEntry.fromJson(x)),
          )
        : [],
    city: json["city"] ?? "",
    commerceInfo: CommerceInfo.fromJson(json["commerce_info"]),
    commerceUserInfo: CommerceUserInfo.fromJson(json["commerce_user_info"]),
    commerceUserLevel: json["commerce_user_level"] ?? 0,
    country: json["country"] ?? "",
    coverColour: json["cover_colour"] ?? "",
    coverUrl: json["cover_url"] != null
        ? List<CoverUrl>.from(
            json["cover_url"].map((x) => CoverUrl.fromJson(x)),
          )
        : [],
    district: json["district"] ?? "",
    favoritingCount: json["favoriting_count"] ?? 0,
    followStatus: json["follow_status"] ?? 0,
    followerCount: json["follower_count"] ?? 0,
    followerRequestStatus: json["follower_request_status"] ?? 0,
    followerStatus: json["follower_status"] ?? 0,
    followingCount: json["following_count"] ?? 0,
    forwardCount: json["forward_count"] ?? 0,
    gender: json["gender"] ?? 0,
    ipLocation: json["ip_location"] ?? "",
    maxFollowerCount: json["max_follower_count"] ?? 0,
    mplatformFollowersCount: json["mplatform_followers_count"] ?? 0,
    nickname: json["nickname"] ?? "",
    province: json["province"] ?? "",
    publicCollectsCount: json["public_collects_count"] ?? 0,
    shareInfo: AuthorShareInfo.fromJson(json["share_info"]),
    shortId: json["short_id"] ?? "",
    signature: json["signature"] ?? "",
    totalFavorited: json["total_favorited"] ?? 0,
    uid: json["uid"] ?? "",
    uniqueId: json["unique_id"] ?? "",
    userAge: json["user_age"] ?? 0,
    whiteCoverUrl: json["white_cover_url"] != null
        ? List<CoverUrl>.from(
            json["white_cover_url"].map((x) => CoverUrl.fromJson(x)),
          )
        : [],
  );

  Map<String, dynamic> toJson() => {
    "avatar_168x168": avatar168X168.toJson(),
    "avatar_300x300": avatar300X300.toJson(),
    "aweme_count": awemeCount,
    "birthday_hide_level": birthdayHideLevel,
    "can_show_group_card": canShowGroupCard,
    "card_entries": List<dynamic>.from(cardEntries.map((x) => x.toJson())),
    "city": city,
    "commerce_info": commerceInfo.toJson(),
    "commerce_user_info": commerceUserInfo.toJson(),
    "commerce_user_level": commerceUserLevel,
    "country": country,
    "cover_colour": coverColour,
    "cover_url": List<dynamic>.from(coverUrl.map((x) => x.toJson())),
    "district": district,
    "favoriting_count": favoritingCount,
    "follow_status": followStatus,
    "follower_count": followerCount,
    "follower_request_status": followerRequestStatus,
    "follower_status": followerStatus,
    "following_count": followingCount,
    "forward_count": forwardCount,
    "gender": gender,
    "ip_location": ipLocation,
    "max_follower_count": maxFollowerCount,
    "mplatform_followers_count": mplatformFollowersCount,
    "nickname": nickname,
    "province": province,
    "public_collects_count": publicCollectsCount,
    "share_info": shareInfo.toJson(),
    "short_id": shortId,
    "signature": signature,
    "total_favorited": totalFavorited,
    "uid": uid,
    "unique_id": uniqueId,
    "user_age": userAge,
    "white_cover_url": List<dynamic>.from(whiteCoverUrl.map((x) => x.toJson())),
  };
}

class Avatar168X168 {
  int height;
  String uri;
  List<String> urlList;
  int width;
  String? urlKey;

  Avatar168X168({
    required this.height,
    required this.uri,
    required this.urlList,
    required this.width,
    this.urlKey,
  });

  factory Avatar168X168.fromJson(Map<String, dynamic> json) => Avatar168X168(
    height: json["height"] ?? 0,
    uri: json["uri"] ?? "",
    urlList: json["url_list"] != null
        ? List<String>.from(json["url_list"].map((x) => x))
        : [],
    width: json["width"] ?? 0,
    urlKey: json["url_key"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "uri": uri,
    "url_list": List<dynamic>.from(urlList.map((x) => x)),
    "width": width,
    "url_key": urlKey,
  };
}

class CardEntry {
  String gotoUrl;
  CoverUrl iconDark;
  CoverUrl iconLight;
  String subTitle;
  String title;
  int type;

  CardEntry({
    required this.gotoUrl,
    required this.iconDark,
    required this.iconLight,
    required this.subTitle,
    required this.title,
    required this.type,
  });

  factory CardEntry.fromJson(Map<String, dynamic> json) => CardEntry(
    gotoUrl: json["goto_url"] ?? "",
    iconDark: CoverUrl.fromJson(json["icon_dark"]),
    iconLight: CoverUrl.fromJson(json["icon_light"]),
    subTitle: json["sub_title"] ?? "",
    title: json["title"] ?? "",
    type: json["type"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "goto_url": gotoUrl,
    "icon_dark": iconDark.toJson(),
    "icon_light": iconLight.toJson(),
    "sub_title": subTitle,
    "title": title,
    "type": type,
  };
}

class CoverUrl {
  String uri;
  List<String> urlList;

  CoverUrl({required this.uri, required this.urlList});

  factory CoverUrl.fromJson(Map<String, dynamic> json) => CoverUrl(
    uri: json["uri"] ?? "",
    urlList: json["url_list"] != null
        ? List<String>.from(json["url_list"].map((x) => x))
        : [],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "url_list": List<dynamic>.from(urlList.map((x) => x)),
  };
}

class CommerceInfo {
  dynamic challengeList;
  dynamic headImageList;
  List<dynamic> offlineInfoList;
  dynamic smartPhoneList;
  dynamic taskList;

  CommerceInfo({
    required this.challengeList,
    required this.headImageList,
    required this.offlineInfoList,
    required this.smartPhoneList,
    required this.taskList,
  });

  factory CommerceInfo.fromJson(Map<String, dynamic> json) => CommerceInfo(
    challengeList: json["challenge_list"],
    headImageList: json["head_image_list"],
    offlineInfoList: List<dynamic>.from(
      json["offline_info_list"].map((x) => x),
    ),
    smartPhoneList: json["smart_phone_list"],
    taskList: json["task_list"],
  );

  Map<String, dynamic> toJson() => {
    "challenge_list": challengeList,
    "head_image_list": headImageList,
    "offline_info_list": List<dynamic>.from(offlineInfoList.map((x) => x)),
    "smart_phone_list": smartPhoneList,
    "task_list": taskList,
  };
}

class CommerceUserInfo {
  dynamic adRevenueRits;
  bool hasAdsEntry;
  bool showStarAtlasCooperation;
  int starAtlas;

  CommerceUserInfo({
    required this.adRevenueRits,
    required this.hasAdsEntry,
    required this.showStarAtlasCooperation,
    required this.starAtlas,
  });

  factory CommerceUserInfo.fromJson(Map<String, dynamic> json) =>
      CommerceUserInfo(
        adRevenueRits: json["ad_revenue_rits"],
        hasAdsEntry: json["has_ads_entry"],
        showStarAtlasCooperation: json["show_star_atlas_cooperation"],
        starAtlas: json["star_atlas"],
      );

  Map<String, dynamic> toJson() => {
    "ad_revenue_rits": adRevenueRits,
    "has_ads_entry": hasAdsEntry,
    "show_star_atlas_cooperation": showStarAtlasCooperation,
    "star_atlas": starAtlas,
  };
}

class AuthorShareInfo {
  int boolPersist;
  String shareDesc;
  CoverUrl shareImageUrl;
  CoverUrl shareQrcodeUrl;
  String shareTitle;
  String shareUrl;
  String shareWeiboDesc;

  AuthorShareInfo({
    required this.boolPersist,
    required this.shareDesc,
    required this.shareImageUrl,
    required this.shareQrcodeUrl,
    required this.shareTitle,
    required this.shareUrl,
    required this.shareWeiboDesc,
  });

  factory AuthorShareInfo.fromJson(Map<String, dynamic> json) =>
      AuthorShareInfo(
        boolPersist: json["bool_persist"],
        shareDesc: json["share_desc"],
        shareImageUrl: CoverUrl.fromJson(json["share_image_url"]),
        shareQrcodeUrl: CoverUrl.fromJson(json["share_qrcode_url"]),
        shareTitle: json["share_title"],
        shareUrl: json["share_url"],
        shareWeiboDesc: json["share_weibo_desc"],
      );

  Map<String, dynamic> toJson() => {
    "bool_persist": boolPersist,
    "share_desc": shareDesc,
    "share_image_url": shareImageUrl.toJson(),
    "share_qrcode_url": shareQrcodeUrl.toJson(),
    "share_title": shareTitle,
    "share_url": shareUrl,
    "share_weibo_desc": shareWeiboDesc,
  };
}

class AwemeControl {
  bool canForward;
  bool canShare;
  bool canComment;
  bool canShowComment;

  AwemeControl({
    required this.canForward,
    required this.canShare,
    required this.canComment,
    required this.canShowComment,
  });

  factory AwemeControl.fromJson(Map<String, dynamic> json) => AwemeControl(
    canForward: json["can_forward"] ?? false,
    canShare: json["can_share"] ?? false,
    canComment: json["can_comment"] ?? false,
    canShowComment: json["can_show_comment"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "can_forward": canForward,
    "can_share": canShare,
    "can_comment": canComment,
    "can_show_comment": canShowComment,
  };
}

class Music {
  double id;
  String title;
  String author;
  Avatar168X168 coverMedium;
  Avatar168X168 coverThumb;
  Avatar168X168 playUrl;
  int duration;
  int userCount;
  String ownerId;
  String ownerNickname;
  bool isOriginal;

  Music({
    required this.id,
    required this.title,
    required this.author,
    required this.coverMedium,
    required this.coverThumb,
    required this.playUrl,
    required this.duration,
    required this.userCount,
    required this.ownerId,
    required this.ownerNickname,
    required this.isOriginal,
  });

  factory Music.fromJson(Map<String, dynamic> json) => Music(
    id: json["id"]?.toDouble() ?? 0.0,
    title: json["title"] ?? "",
    author: json["author"] ?? "",
    coverMedium: Avatar168X168.fromJson(json["cover_medium"]),
    coverThumb: Avatar168X168.fromJson(json["cover_thumb"]),
    playUrl: Avatar168X168.fromJson(json["play_url"]),
    duration: json["duration"] ?? 0,
    userCount: json["user_count"] ?? 0,
    ownerId: json["owner_id"] ?? "",
    ownerNickname: json["owner_nickname"] ?? "",
    isOriginal: json["is_original"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "author": author,
    "cover_medium": coverMedium.toJson(),
    "cover_thumb": coverThumb.toJson(),
    "play_url": playUrl.toJson(),
    "duration": duration,
    "user_count": userCount,
    "owner_id": ownerId,
    "owner_nickname": ownerNickname,
    "is_original": isOriginal,
  };
}

class RiskInfos {
  bool vote;
  bool warn;
  bool riskSink;
  int type;
  String content;

  RiskInfos({
    required this.vote,
    required this.warn,
    required this.riskSink,
    required this.type,
    required this.content,
  });

  factory RiskInfos.fromJson(Map<String, dynamic> json) => RiskInfos(
    vote: json["vote"] ?? false,
    warn: json["warn"] ?? false,
    riskSink: json["risk_sink"] ?? false,
    type: json["type"] ?? 0,
    content: json["content"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "vote": vote,
    "warn": warn,
    "risk_sink": riskSink,
    "type": type,
    "content": content,
  };
}

class VideoDatumShareInfo {
  String shareUrl;
  String shareLinkDesc;

  VideoDatumShareInfo({required this.shareUrl, required this.shareLinkDesc});

  factory VideoDatumShareInfo.fromJson(Map<String, dynamic> json) =>
      VideoDatumShareInfo(
        shareUrl: json["share_url"] ?? "",
        shareLinkDesc: json["share_link_desc"] ?? "",
      );

  Map<String, dynamic> toJson() => {
    "share_url": shareUrl,
    "share_link_desc": shareLinkDesc,
  };
}

class Statistics {
  int admireCount;
  int commentCount;
  int diggCount;
  int collectCount;
  int playCount;
  int shareCount;

  Statistics({
    required this.admireCount,
    required this.commentCount,
    required this.diggCount,
    required this.collectCount,
    required this.playCount,
    required this.shareCount,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    admireCount: json["admire_count"] ?? 0,
    commentCount: json["comment_count"] ?? 0,
    diggCount: json["digg_count"] ?? 0,
    collectCount: json["collect_count"] ?? 0,
    playCount: json["play_count"] ?? 0,
    shareCount: json["share_count"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "admire_count": admireCount,
    "comment_count": commentCount,
    "digg_count": diggCount,
    "collect_count": collectCount,
    "play_count": playCount,
    "share_count": shareCount,
  };
}

class Status {
  int listenVideoStatus;
  bool isDelete;
  bool allowShare;
  bool isProhibited;
  bool inReviewing;
  int partSee;
  int privateStatus;
  ReviewResult reviewResult;

  Status({
    required this.listenVideoStatus,
    required this.isDelete,
    required this.allowShare,
    required this.isProhibited,
    required this.inReviewing,
    required this.partSee,
    required this.privateStatus,
    required this.reviewResult,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    listenVideoStatus: json["listen_video_status"] ?? 0,
    isDelete: json["is_delete"] ?? false,
    allowShare: json["allow_share"] ?? false,
    isProhibited: json["is_prohibited"] ?? false,
    inReviewing: json["in_reviewing"] ?? false,
    partSee: json["part_see"] ?? false,
    privateStatus: json["private_status"] ?? 0,
    reviewResult: ReviewResult.fromJson(json["review_result"]),
  );

  Map<String, dynamic> toJson() => {
    "listen_video_status": listenVideoStatus,
    "is_delete": isDelete,
    "allow_share": allowShare,
    "is_prohibited": isProhibited,
    "in_reviewing": inReviewing,
    "part_see": partSee,
    "private_status": privateStatus,
    "review_result": reviewResult.toJson(),
  };
}

class ReviewResult {
  int reviewStatus;

  ReviewResult({required this.reviewStatus});

  factory ReviewResult.fromJson(Map<String, dynamic> json) =>
      ReviewResult(reviewStatus: json["review_status"] ?? 0);

  Map<String, dynamic> toJson() => {"review_status": reviewStatus};
}

class SuggestWords {
  List<SuggestWord> suggestWords;

  SuggestWords({required this.suggestWords});

  factory SuggestWords.fromJson(Map<String, dynamic> json) => SuggestWords(
    suggestWords: json["suggest_words"] != null
        ? List<SuggestWord>.from(
            json["suggest_words"].map((x) => SuggestWord.fromJson(x)),
          )
        : [],
  );

  Map<String, dynamic> toJson() => {
    "suggest_words": List<dynamic>.from(suggestWords.map((x) => x.toJson())),
  };
}

class SuggestWord {
  List<Word> words;
  String scene;
  String iconUrl;
  String hintText;
  String extraInfo;

  SuggestWord({
    required this.words,
    required this.scene,
    required this.iconUrl,
    required this.hintText,
    required this.extraInfo,
  });

  factory SuggestWord.fromJson(Map<String, dynamic> json) => SuggestWord(
    words: json["words"] != null
        ? List<Word>.from(json["words"].map((x) => Word.fromJson(x)))
        : [],
    scene: json["scene"] ?? "",
    iconUrl: json["icon_url"] ?? "",
    hintText: json["hint_text"] ?? "",
    extraInfo: json["extra_info"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "words": List<dynamic>.from(words.map((x) => x.toJson())),
    "scene": scene,
    "icon_url": iconUrl,
    "hint_text": hintText,
    "extra_info": extraInfo,
  };
}

class Word {
  String word;
  String wordId;
  String info;

  Word({required this.word, required this.wordId, required this.info});

  factory Word.fromJson(Map<String, dynamic> json) => Word(
    word: json["word"] ?? "",
    wordId: json["word_id"] ?? "",
    info: json["info"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "word": word,
    "word_id": wordId,
    "info": info,
  };
}

class TextExtra {
  int start;
  int end;
  int type;
  String hashtagName;
  String hashtagId;
  bool isCommerce;
  int captionStart;
  int captionEnd;

  TextExtra({
    required this.start,
    required this.end,
    required this.type,
    required this.hashtagName,
    required this.hashtagId,
    required this.isCommerce,
    required this.captionStart,
    required this.captionEnd,
  });

  factory TextExtra.fromJson(Map<String, dynamic> json) => TextExtra(
    start: json["start"] ?? 0,
    end: json["end"] ?? 0,
    type: json["type"] ?? 0,
    hashtagName: json["hashtag_name"] ?? "",
    hashtagId: json["hashtag_id"] ?? "",
    isCommerce: json["is_commerce"] ?? false,
    captionStart: json["caption_start"] ?? 0,
    captionEnd: json["caption_end"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "start": start,
    "end": end,
    "type": type,
    "hashtag_name": hashtagName,
    "hashtag_id": hashtagId,
    "is_commerce": isCommerce,
    "caption_start": captionStart,
    "caption_end": captionEnd,
  };
}

class Video {
  PlayAddr playAddr;
  Avatar168X168 cover;
  String poster;
  int height;
  int width;
  String ratio;
  bool useStaticCover;
  int duration;

  Video({
    required this.playAddr,
    required this.cover,
    required this.poster,
    required this.height,
    required this.width,
    required this.ratio,
    required this.useStaticCover,
    required this.duration,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    playAddr: PlayAddr.fromJson(json["play_addr"]),
    cover: Avatar168X168.fromJson(json["cover"]),
    poster: json["poster"] ?? "",
    height: json["height"] ?? 0,
    width: json["width"] ?? 0,
    ratio: json["ratio"] ?? "",
    useStaticCover: json["use_static_cover"] ?? false,
    duration: json["duration"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "play_addr": playAddr.toJson(),
    "cover": cover.toJson(),
    "poster": poster,
    "height": height,
    "width": width,
    "ratio": ratio,
    "use_static_cover": useStaticCover,
    "duration": duration,
  };
}

class PlayAddr {
  String uri;
  List<String> urlList;
  int width;
  int height;
  String urlKey;
  int dataSize;
  String fileHash;
  String fileCs;

  PlayAddr({
    required this.uri,
    required this.urlList,
    required this.width,
    required this.height,
    required this.urlKey,
    required this.dataSize,
    required this.fileHash,
    required this.fileCs,
  });

  factory PlayAddr.fromJson(Map<String, dynamic> json) => PlayAddr(
    uri: json["uri"] ?? "",
    urlList: json["url_list"] != null
        ? List<String>.from(json["url_list"].map((x) => x))
        : [],
    width: json["width"] ?? 0,
    height: json["height"] ?? 0,
    urlKey: json["url_key"] ?? "",
    dataSize: json["data_size"] ?? 0,
    fileHash: json["file_hash"] ?? "",
    fileCs: json["file_cs"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "url_list": List<dynamic>.from(urlList.map((x) => x)),
    "width": width,
    "height": height,
    "url_key": urlKey,
    "data_size": dataSize,
    "file_hash": fileHash,
    "file_cs": fileCs,
  };
}
