import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    this.videoWidth,
    this.videoHeight,
  });

  final VideoMultiPlayerManger flickMultiManager;
  final String url;
  final String image;
  final PageController pageController;
  final int? videoWidth;
  final int? videoHeight;

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
    // 基于视频宽高选择合适的填充策略
    BoxFit resolveFit(BuildContext context) {
      // 优先使用传入的元数据宽高
      if (videoWidth != null &&
          videoHeight != null &&
          videoWidth! > 0 &&
          videoHeight! > 0) {
        // 直接根据视频本身的横竖判断，避免上边黑边
        // 竖屏：cover；横屏：contain
        if (videoHeight! >= videoWidth!) {
          return BoxFit.cover;
        } else {
          return BoxFit.contain;
        }
      }

      // 没有元数据时，优先保证沉浸体验：用 cover 覆盖全屏
      return BoxFit.cover;
    }

    // 使用 useMemoized 创建 FlickManager
    final flickManager = useMemoized(
      () => FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(url))
          ..setLooping(true), // 关闭循环播放，让 onVideoEnd 可以触发
        autoPlay: true,
        onVideoEnd: () {
          logger.d("onVideoEnd");
          // pageController.nextPage(
          //   duration: const Duration(milliseconds: 300),
          //   curve: Curves.easeInOut,
          // );
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

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: FlickVideoPlayer(
        flickManager: flickManager,
        flickVideoWithControls: FlickVideoWithControls(
          videoFit: resolveFit(context),
          playerLoadingFallback: Positioned.fill(
            child: Stack(
              children: <Widget>[
                Positioned.fill(child: _buildImage(image)),
                Positioned.fill(
                  child: Center(
                    child: Lottie.asset(
                      'assets/lottie/Loader.json',
                      width: 200.w,
                      height: 40.h,
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
      ),
    );
  }
}
