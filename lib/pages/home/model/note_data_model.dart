// To parse this JSON data, do
//
//     final NoteDataModel = NoteDataModelFromJson(jsonString);

import 'dart:convert';

List<NoteDataModel> noteDataModelFromJson(String str) =>
    List<NoteDataModel>.from(
      json.decode(str).map((x) => NoteDataModel.fromJson(x)),
    );

String noteDataModelToJson(List<NoteDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NoteDataModel {
  String id;
  String modelType;
  NoteCard noteCard;

  NoteDataModel({
    required this.id,
    required this.modelType,
    required this.noteCard,
  });

  factory NoteDataModel.fromJson(Map<String, dynamic> json) => NoteDataModel(
    id: json["id"],
    modelType: json["model_type"],
    noteCard: NoteCard.fromJson(json["note_card"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model_type": modelType,
    "note_card": noteCard.toJson(),
  };
}

class NoteCard {
  String type;
  String displayTitle;
  User user;
  InteractInfo interactInfo;
  Cover cover;
  List<ImageList> imageList;

  NoteCard({
    required this.type,
    required this.displayTitle,
    required this.user,
    required this.interactInfo,
    required this.cover,
    required this.imageList,
  });

  factory NoteCard.fromJson(Map<String, dynamic> json) => NoteCard(
    type: json["type"] ?? "",
    displayTitle: json["display_title"] ?? "",
    user: User.fromJson(
      json["user"] ??
          {"avatar": "", "user_id": "", "nickname": "", "nick_name": ""},
    ),
    interactInfo: InteractInfo.fromJson(
      json["interact_info"] ?? {"liked": false, "liked_count": ""},
    ),
    cover: Cover.fromJson(json["cover"] ?? {"url_default": ""}),
    imageList: json["image_list"] != null
        ? List<ImageList>.from(
            json["image_list"].map((x) => ImageList.fromJson(x)),
          )
        : [ImageList(infoList: [])],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "display_title": displayTitle,
    "user": user.toJson(),
    "interact_info": interactInfo.toJson(),
    "cover": cover.toJson(),
    "image_list": List<dynamic>.from(imageList.map((x) => x.toJson())),
  };
}

class Cover {
  String urlDefault;

  Cover({required this.urlDefault});

  factory Cover.fromJson(Map<String, dynamic> json) =>
      Cover(urlDefault: json["url_default"] ?? "");

  Map<String, dynamic> toJson() => {"url_default": urlDefault};
}

class ImageList {
  List<InfoList> infoList;

  ImageList({required this.infoList});

  factory ImageList.fromJson(Map<String, dynamic> json) => ImageList(
    infoList: json["info_list"] != null
        ? List<InfoList>.from(
            json["info_list"].map((x) => InfoList.fromJson(x)),
          )
        : [InfoList(url: "")],
  );

  Map<String, dynamic> toJson() => {
    "info_list": List<dynamic>.from(infoList.map((x) => x.toJson())),
  };
}

class InfoList {
  String url;

  InfoList({required this.url});

  factory InfoList.fromJson(Map<String, dynamic> json) =>
      InfoList(url: json["url"] ?? "");

  Map<String, dynamic> toJson() => {"url": url};
}

class InteractInfo {
  bool liked;
  String likedCount;

  InteractInfo({required this.liked, required this.likedCount});

  factory InteractInfo.fromJson(Map<String, dynamic> json) => InteractInfo(
    liked: json["liked"] ?? false,
    likedCount: json["liked_count"] ?? "",
  );

  Map<String, dynamic> toJson() => {"liked": liked, "liked_count": likedCount};
}

class User {
  String avatar;
  String userId;
  String nickname;
  String nickName;

  User({
    required this.avatar,
    required this.userId,
    required this.nickname,
    required this.nickName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    avatar: json["avatar"],
    userId: json["user_id"],
    nickname: json["nickname"],
    nickName: json["nick_name"],
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar,
    "user_id": userId,
    "nickname": nickname,
    "nick_name": nickName,
  };
}
