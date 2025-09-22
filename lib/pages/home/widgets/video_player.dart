import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:short_video_flutter/utils/logger.dart';
import 'package:video_player/video_player.dart';
import 'package:short_video_flutter/pages/home/widgets/video_player_manger.dart';
import 'package:short_video_flutter/pages/home/widgets/video_player_controls.dart';

class VideoPlayer extends HookConsumerWidget {
  const VideoPlayer({
    super.key,
    required this.flickMultiManager,
    required this.url,
    required this.image,
    required this.pageController,
  });

  final VideoMultiPlayerManger flickMultiManager;
  final String url;
  final String image;
  final PageController pageController;

  Widget _buildImage(String imagePath) {
    final errorWidget = Container(
      color: Colors.grey[300],
      child: const Icon(Icons.image_not_supported, size: 50),
    );

    return imagePath.startsWith('assets/')
        ? Image.asset(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => errorWidget,
          )
        : Image.network(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => errorWidget,
          );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 使用 useMemoized 创建 FlickManager
    final flickManager = useMemoized(
      () => FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(url))
          ..setLooping(true), // 关闭循环播放，让 onVideoEnd 可以触发
        autoPlay: false,
        onVideoEnd: () {
          logger.d("onVideoEnd");
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );

    // 使用 useEffect 处理初始化和清理
    useEffect(() {
      // 初始化
      flickMultiManager.init(flickManager);

      // 清理函数
      return () {
        flickMultiManager.remove(flickManager);
        flickManager.dispose();
      };
    }, [flickManager]); // 依赖 flickManager

    return FlickVideoPlayer(
      flickManager: flickManager,
      flickVideoWithControls: FlickVideoWithControls(
        videoFit: BoxFit.fill,
        playerLoadingFallback: Positioned.fill(
          child: Stack(
            children: <Widget>[
              Positioned.fill(child: _buildImage(image)),
              Positioned.fill(
                child: Center(
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
          videoMultiPlayerManger: flickMultiManager,
          flickManager: flickManager,
        ),
      ),
      // flickVideoWithControlsFullscreen: FlickVideoWithControls(
      //   playerLoadingFallback: Center(
      //     child: Image.network(image, fit: BoxFit.fitWidth),
      //   ),
      //   controls: FlickLandscapeControls(),
      //   iconThemeData: IconThemeData(size: 40, color: Colors.white),
      //   textStyle: TextStyle(fontSize: 16, color: Colors.white),
      // ),
    );
  }
}
