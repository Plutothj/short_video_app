// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

List<UserDataModel> userDataModelFromJson(String str) =>
    List<UserDataModel>.from(
      json.decode(str).map((x) => UserDataModel.fromJson(x)),
    );

String userDataModelToJson(List<UserDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDataModel {
  Avatar avatar168X168;
  Avatar avatar300X300;
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
  dynamic district;
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
  ShareInfo shareInfo;
  String shortId;
  String signature;
  int totalFavorited;
  String uid;
  String uniqueId;
  int userAge;
  List<CoverUrl> whiteCoverUrl;

  UserDataModel({
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

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    avatar168X168: json["avatar_168x168"] != null
        ? Avatar.fromJson(json["avatar_168x168"])
        : Avatar(height: 0, uri: '', urlList: [], width: 0),
    avatar300X300: json["avatar_300x300"] != null
        ? Avatar.fromJson(json["avatar_300x300"])
        : Avatar(height: 0, uri: '', urlList: [], width: 0),
    awemeCount: json["aweme_count"],
    birthdayHideLevel: json["birthday_hide_level"],
    canShowGroupCard: json["can_show_group_card"],
    cardEntries: json["card_entries"] != null
        ? List<CardEntry>.from(
            json["card_entries"].map((x) => CardEntry.fromJson(x)),
          )
        : <CardEntry>[],
    city: json["city"] ?? '',
    commerceInfo: json["commerce_info"] != null
        ? CommerceInfo.fromJson(json["commerce_info"])
        : CommerceInfo(
            challengeList: null,
            headImageList: null,
            offlineInfoList: [],
            smartPhoneList: null,
            taskList: null,
          ),
    commerceUserInfo: json["commerce_user_info"] != null
        ? CommerceUserInfo.fromJson(json["commerce_user_info"])
        : CommerceUserInfo(
            adRevenueRits: null,
            hasAdsEntry: false,
            showStarAtlasCooperation: false,
            starAtlas: 0,
          ),
    commerceUserLevel: json["commerce_user_level"],
    country: json["country"] ?? '',
    coverColour: json["cover_colour"] ?? '',
    coverUrl: json["cover_url"] != null
        ? List<CoverUrl>.from(
            json["cover_url"].map((x) => CoverUrl.fromJson(x)),
          )
        : <CoverUrl>[],
    district: json["district"],
    favoritingCount: json["favoriting_count"],
    followStatus: json["follow_status"],
    followerCount: json["follower_count"],
    followerRequestStatus: json["follower_request_status"],
    followerStatus: json["follower_status"],
    followingCount: json["following_count"],
    forwardCount: json["forward_count"],
    gender: json["gender"],
    ipLocation: json["ip_location"] ?? '',
    maxFollowerCount: json["max_follower_count"],
    mplatformFollowersCount: json["mplatform_followers_count"],
    nickname: json["nickname"] ?? '',
    province: json["province"] ?? '',
    publicCollectsCount: json["public_collects_count"],
    shareInfo: json["share_info"] != null
        ? ShareInfo.fromJson(json["share_info"])
        : ShareInfo(
            boolPersist: 0,
            shareDesc: '',
            shareImageUrl: CoverUrl(uri: '', urlList: []),
            shareQrcodeUrl: CoverUrl(uri: '', urlList: []),
            shareTitle: '',
            shareUrl: '',
            shareWeiboDesc: '',
          ),
    shortId: json["short_id"] ?? '',
    signature: json["signature"] ?? '',
    totalFavorited: json["total_favorited"],
    uid: json["uid"] ?? '',
    uniqueId: json["unique_id"] ?? '',
    userAge: json["user_age"],
    whiteCoverUrl: json["white_cover_url"] != null
        ? List<CoverUrl>.from(
            json["white_cover_url"].map((x) => CoverUrl.fromJson(x)),
          )
        : <CoverUrl>[],
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

class Avatar {
  int height;
  String uri;
  List<String> urlList;
  int width;

  Avatar({
    required this.height,
    required this.uri,
    required this.urlList,
    required this.width,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
    height: json["height"] ?? 0,
    uri: json["uri"] ?? '',
    urlList: json["url_list"] != null
        ? List<String>.from(json["url_list"].map((x) => x))
        : <String>[],
    width: json["width"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "uri": uri,
    "url_list": List<dynamic>.from(urlList.map((x) => x)),
    "width": width,
  };
}

class CardEntry {
  String? cardData;
  String? eventParams;
  String gotoUrl;
  CoverUrl iconDark;
  CoverUrl iconLight;
  String subTitle;
  String title;
  int type;

  CardEntry({
    this.cardData,
    this.eventParams,
    required this.gotoUrl,
    required this.iconDark,
    required this.iconLight,
    required this.subTitle,
    required this.title,
    required this.type,
  });

  factory CardEntry.fromJson(Map<String, dynamic> json) => CardEntry(
    cardData: json["card_data"],
    eventParams: json["event_params"],
    gotoUrl: json["goto_url"],
    iconDark: CoverUrl.fromJson(json["icon_dark"]),
    iconLight: CoverUrl.fromJson(json["icon_light"]),
    subTitle: json["sub_title"],
    title: json["title"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "card_data": cardData,
    "event_params": eventParams,
    "goto_url": gotoUrl,
    "icon_dark": iconDark.toJson(),
    "icon_light": iconLight.toJson(),
    "sub_title": subTitle,
    "title": title,
    "type": type,
  };
}

class CoverUrl {
  List<String> urlList;
  String? uri;

  CoverUrl({required this.urlList, this.uri});

  factory CoverUrl.fromJson(Map<String, dynamic> json) => CoverUrl(
    urlList: List<String>.from(json["url_list"].map((x) => x)),
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "url_list": List<dynamic>.from(urlList.map((x) => x)),
    "uri": uri,
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
    offlineInfoList: json["offline_info_list"] != null
        ? List<dynamic>.from(json["offline_info_list"].map((x) => x))
        : <dynamic>[],
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

class ShareInfo {
  int boolPersist;
  String shareDesc;
  CoverUrl shareImageUrl;
  CoverUrl shareQrcodeUrl;
  String shareTitle;
  String shareUrl;
  String shareWeiboDesc;

  ShareInfo({
    required this.boolPersist,
    required this.shareDesc,
    required this.shareImageUrl,
    required this.shareQrcodeUrl,
    required this.shareTitle,
    required this.shareUrl,
    required this.shareWeiboDesc,
  });

  factory ShareInfo.fromJson(Map<String, dynamic> json) => ShareInfo(
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
