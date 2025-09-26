import 'package:intl/intl.dart';

class Format {
  static String formatTime(int seconds) {
    int minutes = (seconds / 60).floor();
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  // 把1702670873转换为2024-02-14 10:07:53

  static String formatTimestamp(int timestamp) {
    // 如果时间戳是秒为单位，需要转换为毫秒
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }

  static String formatPlayNum(int playNum) {
    if (playNum < 1000) {
      return playNum.toString();
    } else {
      return '${(playNum / 1000).toStringAsFixed(1)}K';
    }
  }

  static String formatNumofW(int Num) {
    if (Num < 10000) {
      return Num.toString();
    } else {
      return '${(Num / 10000).toStringAsFixed(1)}万';
    }
  }

  static String formatImageUrl(String nickname) {
    return Uri.encodeFull('https://dy.2study.top/images/${nickname}');
  }
}
