import "package:short_video_flutter/utils/http.dart";

class UserServices {
  static get http => HttpUtil();

  // 刷新token
  static const String refreshTokenUrl = '/api/v1/user/refresh_token';

  static Future<Map<String, dynamic>> refreshToken(params) async {
    final response = await http.post(refreshTokenUrl, data: params);
    return response;
  }

  // 获取观看历史记录
  static const String getHistoryUrl = '/api/v1/user/history';

  static Future<dynamic> getHistory() async {
    final response = await http.get(getHistoryUrl);
    return response;
  }

  // 获取收藏列表
  static const String getCollectUrl = '/api/v1/user/op_action_list';

  static Future<dynamic> getCollect([Map<String, dynamic>? params]) async {
    final response = await http.get(
      getCollectUrl,
      queryParameters: {...?params, 'type': '1'},
    );
    return response;
  }

  // 获取喜欢列表
  static const String getLikeUrl = '/api/v1/user/op_action_list';

  static Future<dynamic> getLike([Map<String, dynamic>? params]) async {
    final response = await http.get(
      getLikeUrl,
      queryParameters: {...?params, 'type': '0'},
    );
    return response;
  }
}
