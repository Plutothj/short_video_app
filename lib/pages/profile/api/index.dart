import "package:short_video_flutter/utils/http.dart";
import 'package:short_video_flutter/pages/home/model/video_data_model.dart';
import "package:short_video_flutter/utils/logger.dart";

class ProfileServices {
  static get http => HttpUtil();
  // 剧集详情
  static const String postsVideoUrl =
      '/data/user_video_list/user-12345xiaolaohu.json';

  static Future<List<VideoData>> getPostsVideoList() async {
    final response = await http.get(postsVideoUrl);
    logger.d(response.toString());

    if (response != null && response is List) {
      return response.map((post) => VideoData.fromJson(post)).toList();
    }
    return [];
  }
}
