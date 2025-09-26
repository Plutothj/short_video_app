import "package:short_video_flutter/utils/http.dart";

class UserServices {
  static get http => HttpUtil();

  // 获取用户信息
  static const String userInfoUrl = '/data/users.json';

  static Future<dynamic> getUserInfo() async {
    final response = await http.get(userInfoUrl);
    return response;
  }
}
