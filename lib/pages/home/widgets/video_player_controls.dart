import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:short_video_flutter/theme/theme.dart';
import 'package:short_video_flutter/pages/home/widgets/video_player_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_video_flutter/pages/home/home_provider.dart';

class VideoPlayeControls extends ConsumerWidget {
  const VideoPlayeControls({
    super.key,
    this.videoPlayerManger,
    this.flickManager,
  });

  final VideoPlayerManger? videoPlayerManger;
  final FlickManager? flickManager;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 通过 FlickManager 获取 DisplayManager
    final displayManager = flickManager?.flickDisplayManager;

    final currentTab = ref.watch(homeProvider).currentTab;
    final tabList = ref.watch(homeProvider).tabList;

    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FlickAutoHideChild(
            autoHide: false,
            showIfVideoNotInitialized: false,
            child: Padding(
              padding: EdgeInsetsGeometry.only(top: 50.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icons/live_icon.png',
                    width: 28.w,
                    height: 28.h,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20.w,
                      children: [
                        ...tabList.asMap().entries.map(
                          (entry) => GestureDetector(
                            key: Key(entry.key.toString()),
                            onTap: () {
                              ref
                                  .read(homeProvider.notifier)
                                  .setCurrentTab(entry.key);
                              displayManager?.handleShowPlayerControls();
                            },
                            child: Column(
                              children: [
                                Text(
                                  entry.value['title'],
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: currentTab == entry.key
                                        ? AppColors.primary
                                        : Colors.white,
                                  ),
                                ),
                                SizedBox(height: 12.w),
                                Container(
                                  width: entry.value['width'],
                                  height: currentTab == entry.key ? 3.h : 2.h,
                                  decoration: BoxDecoration(
                                    color: currentTab == entry.key
                                        ? AppColors.primary
                                        : Colors.white,

                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Image.asset(
                    'assets/icons/search_icon.png',
                    width: 28.w,
                    height: 28.h,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                videoPlayerManger?.togglePlay(flickManager!);
                displayManager?.handleShowPlayerControls();
              },
              child: Stack(
                children: [
                  Positioned(
                    child: Center(
                      child: FlickShowControlsAction(
                        behavior: HitTestBehavior.translucent,
                        child: Center(
                          child: FlickAutoHideChild(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlickPlayToggle(
                                size: 50,
                                playChild: Image.asset(
                                  'assets/icons/play_center.png',
                                  width: 80.w,
                                  height: 80.h,
                                ),
                                pauseChild: Image.asset(
                                  'assets/icons/pause_center.png',
                                  width: 80.w,
                                  height: 80.h,
                                  // 透明图片
                                  opacity: AlwaysStoppedAnimation(0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(child: Column(children: [
                      
                    ],
                  )),
                ],
              ),
            ),
          ),
          FlickAutoHideChild(
            autoHide: true,
            showIfVideoNotInitialized: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FlickSoundToggle(
                    toggleMute: () => videoPlayerManger?.toggleMute(),
                    color: Colors.white,
                  ),
                ),
                // FlickFullScreenToggle(),
              ],
            ),
          ),
          FlickAutoHideChild(
            child: FlickVideoProgressBar(
              flickProgressBarSettings: FlickProgressBarSettings(
                height: 4,
                curveRadius: 2,
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
