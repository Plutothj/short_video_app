import "package:short_video_flutter/utils/http.dart";
import "package:short_video_flutter/utils/logger.dart";

class DiscoverServices {
  static get http => HttpUtil();
  // 剧集详情
  static const String soundsUrl = '/api/v1/user_show/index';

  static Future<Map<String, dynamic>> getSoundsList(params) async {
    final response = await http.get(soundsUrl, queryParameters: params);
    logger.d(response.toString());
    if (response == null) {
      return {};
    }
    return response['data'] ?? {};
  }

  // 剧集分页
  static const String hashtagUrl = '/api/v1/user/dramaList';

  static Future<Map<String, dynamic>> getHashtagList(params) async {
    final response = await http.get(hashtagUrl, queryParameters: params);
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
