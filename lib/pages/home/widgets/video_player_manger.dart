import 'package:flick_video_player/flick_video_player.dart';

import 'package:logger/logger.dart';

class VideoPlayerManger {
  final List<FlickManager> _flickManagers = [];
  FlickManager? _activeManager;
  bool _isMute = false;
  final logger = Logger();

  init(FlickManager flickManager) {
    _flickManagers.add(flickManager);
    if (_isMute) {
      flickManager.flickControlManager?.mute();
    } else {
      flickManager.flickControlManager?.unmute();
    }
    if (_flickManagers.length == 1) {
      play(flickManager);
    }
  }

  remove(FlickManager flickManager) {
    if (_activeManager == flickManager) {
      _activeManager = null;
    }
    flickManager.dispose();
    _flickManagers.remove(flickManager);
  }

  togglePlay(FlickManager flickManager) {
    if (_activeManager?.flickVideoManager?.isPlaying == true &&
        flickManager == _activeManager) {
      pause();
    } else {
      play(flickManager);
    }
  }

  pause() {
    _activeManager?.flickControlManager?.pause();
  }

  play([FlickManager? flickManager]) {
    if (flickManager != null) {
      _activeManager?.flickControlManager?.pause();
      _activeManager = flickManager;
    }

    if (_isMute) {
      _activeManager?.flickControlManager?.mute();
    } else {
      _activeManager?.flickControlManager?.unmute();
    }

    _activeManager?.flickControlManager?.play();
  }

  toggleMute() {
    _activeManager?.flickControlManager?.toggleMute();
    _isMute = _activeManager?.flickControlManager?.isMute ?? false;
    if (_isMute) {
      for (var manager in _flickManagers) {
        manager.flickControlManager?.mute();
      }
    } else {
      for (var manager in _flickManagers) {
        manager.flickControlManager?.unmute();
      }
    }
  }

  FlickManager? get activeManager => _activeManager;

  dispose() {
    for (var manager in _flickManagers) {
      manager.dispose();
    }
    _flickManagers.clear();
    _activeManager = null;
  }
}
