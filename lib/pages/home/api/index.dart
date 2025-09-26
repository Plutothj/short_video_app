import "package:short_video_flutter/utils/http.dart";
import "package:short_video_flutter/pages/home/model/comments_model.dart";
import "package:short_video_flutter/utils/logger.dart";

class PlayerServices {
  static get http => HttpUtil();
  // 剧集详情
  static const String playerUrl = '/data/comments/video_id_';

  static Future<List<Comments>> getVideoComments(params) async {
    final response = await http.get(playerUrl + params['video_id'] + '.json');
    logger.d(response.toString());

    if (response != null && response is List) {
      return response.map((comment) => Comments.fromJson(comment)).toList();
    }
    return [];
  }
}
