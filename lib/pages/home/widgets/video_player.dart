import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:short_video_flutter/pages/home/widgets/video_player_manger.dart';
import 'package:short_video_flutter/pages/home/widgets/video_player_controls.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({
    super.key,
    required this.flickMultiManager,
    required this.url,
    required this.image,
  });
  final VideoPlayerManger flickMultiManager;
  final String url;
  final String image;
  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late FlickManager flickManager;

  @override
  void initState() {
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(widget.url),
      )..setLooping(true),
      autoPlay: true,
    );
    widget.flickMultiManager.init(flickManager);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(
      flickManager: flickManager,
      flickVideoWithControls: FlickVideoWithControls(
        videoFit: BoxFit.fill,
        playerLoadingFallback: Positioned.fill(
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.network(widget.image, fit: BoxFit.cover),
              ),
              Positioned(
                right: 10.w,
                top: 10.h,
                child: SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
        controls: VideoPlayeControls(
          videoPlayerManger: widget.flickMultiManager,
          flickManager: flickManager,
        ),
      ),
      flickVideoWithControlsFullscreen: FlickVideoWithControls(
        playerLoadingFallback: Center(
          child: Image.network(widget.image, fit: BoxFit.fitWidth),
        ),
        controls: FlickLandscapeControls(),
        iconThemeData: IconThemeData(size: 40, color: Colors.white),
        textStyle: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  @override
  void dispose() {
    widget.flickMultiManager.remove(flickManager);
    super.dispose();
  }
}
