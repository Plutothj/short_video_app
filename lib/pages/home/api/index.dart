import "package:short_video_flutter/utils/http.dart";
import "package:short_video_flutter/utils/logger.dart";

class PlayerServices {
  static get http => HttpUtil();
  // 剧集详情
  static const String playerUrl = '/api/v1/user_show/index';

  static Future<Map<String, dynamic>> getPlayerDetail(params) async {
    final response = await http.get(playerUrl, queryParameters: params);
    logger.d(response.toString());
    if (response == null) {
      return {};
    }
    return response['data'] ?? {};
  }

  // 剧集分页
  static const String playerPageUrl = '/api/v1/user/dramaList';

  static Future<Map<String, dynamic>> getPlayerPage(params) async {
    final response = await http.get(playerPageUrl, queryParameters: params);
    logger.d(response.toString());
    if (response == null) {
      return {};
    }
    return response['data'] ?? {};
  }

  // 用户点赞 和 收藏
  static const String actionUrl = '/api/v1/user/op_action_set';

  static Future<dynamic> userActionSet(params) async {
    final response = await http.post(actionUrl, data: params);
    logger.d(response.toString());
    if (response == null) {
      return {};
    }
    return response['data'] ?? {};
  }

  // 添加用户的观看记录
  static const String addWatchRecordUrl = '/api/v1/create_user_show';
  // 定义一个参数model

  static Future<dynamic> addWatchRecord(AddWatchRecordParams params) async {
    final response = await http.post(addWatchRecordUrl, data: params.toJson());
    logger.d(response.toString());
    if (response == null) {
      return {};
    }
    return response['data'] ?? {};
  }
}

class AddWatchRecordParams {
  final String dramaId;
  final String epId;
  final String playTime;
  final String playDuration;

  AddWatchRecordParams({
    required this.dramaId,
    required this.epId,
    required this.playTime,
    required this.playDuration,
  });

  Map<String, dynamic> toJson() {
    return {
      'drama_id': dramaId,
      'ep_id': epId,
      'play_time': playTime,
      'play_duration': playDuration,
    };
  }
}
