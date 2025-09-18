class Format {
  static String formatTime(int seconds) {
    int minutes = (seconds / 60).floor();
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  static String formatPlayNum(int playNum) {
    if (playNum < 1000) {
      return playNum.toString();
    } else {
      return '${(playNum / 1000).toStringAsFixed(1)}K';
    }
  }
}
