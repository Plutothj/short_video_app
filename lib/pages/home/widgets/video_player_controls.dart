import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter_svg/svg.dart';
import 'package:short_video_flutter/theme/theme.dart';
import 'package:short_video_flutter/pages/home/widgets/video_player_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:short_video_flutter/pages/home/home_provider.dart';
import 'package:short_video_flutter/pages/home/widgets/comments_modal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:short_video_flutter/utils/format.dart';
import 'package:cached_network_image/cached_network_image.dart';

class VideoPlayeControls extends HookConsumerWidget {
  const VideoPlayeControls({
    super.key,
    this.videoMultiPlayerManger,
    this.flickManager,
  });

  final VideoMultiPlayerManger? videoMultiPlayerManger;
  final FlickManager? flickManager;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 通过 FlickManager 获取 DisplayManager
    // final displayManager = useMemoized(() => flickManager?.flickDisplayManager);
    final homeState = ref.watch(homeProvider);

    final currentPlayIndex = homeState.value?.currentIndex;
    final videoPlayList = homeState.value?.videos;

    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: FlickShowControlsAction(
              behavior: HitTestBehavior.opaque,
              child: Center(
                child: FlickAutoHideChild(
                  child: Padding(
                    padding: EdgeInsetsGeometry.only(top: 180.h),
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
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          FlickShowControlsAction(
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 380.w,
              height: 340.h,
              margin: EdgeInsets.only(bottom: 20.h),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 320.w,

                        child: Column(
                          spacing: 20.h,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              spacing: 10.w,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        videoPlayList?[currentPlayIndex ?? 0]
                                            .author
                                            .avatar168X168
                                            .urlList[0] ??
                                        '',
                                    width: 60.w,
                                    height: 60.h,
                                  ),
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      videoPlayList?[currentPlayIndex ?? 0]
                                              .author
                                              .nickname ??
                                          '',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Actress & Singer',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              videoPlayList?[currentPlayIndex ?? 0].desc ?? '',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Row(
                              spacing: 8.w,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        videoPlayList?[currentPlayIndex ?? 0]
                                            .music
                                            .coverThumb
                                            .urlList[0] ??
                                        '',
                                    width: 16.w,
                                    height: 16.h,
                                  ),
                                ),

                                SvgPicture.asset(
                                  'assets/svg/music.svg',
                                  width: 16.w,
                                  height: 16.h,
                                ),
                                Text(
                                  videoPlayList?[currentPlayIndex ?? 0]
                                          .music
                                          .title ??
                                      '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 24.h,
                          children: [
                            // SvgPicture.asset(
                            //   "assets/svg/hongqi.svg",
                            //   width: 24.w,
                            //   height: 24.h,
                            // ),
                            Column(
                              spacing: 4.h,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/Exclude.svg",
                                  width: 36.w,
                                  height: 36.h,
                                  colorFilter: ColorFilter.mode(
                                    videoPlayList?[currentPlayIndex ?? 0]
                                                .statistics
                                                .diggCount ==
                                            1
                                        ? AppColors.primary
                                        : Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                Text(
                                  Format.formatNumofW(
                                    videoPlayList?[currentPlayIndex ?? 0]
                                            .statistics
                                            .diggCount ??
                                        0,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              spacing: 4.h,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Colors.black.withValues(
                                        alpha: 0.5,
                                      ),

                                      useRootNavigator: true,
                                      builder: (context) => CommentsModal(
                                        videoId:
                                            videoPlayList?[currentPlayIndex ??
                                                    0]
                                                .awemeId ??
                                            '',
                                      ),
                                    );
                                  },
                                  child: SvgPicture.asset(
                                    "assets/svg/Chat.svg",
                                    width: 36.w,
                                    height: 36.h,
                                  ),
                                ),

                                Text(
                                  Format.formatNumofW(
                                    videoPlayList?[currentPlayIndex ?? 0]
                                            .statistics
                                            .commentCount ??
                                        0,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              spacing: 4.h,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/Bookmark.svg",
                                  width: 36.w,
                                  height: 36.h,
                                ),
                                Text(
                                  Format.formatNumofW(
                                    videoPlayList?[currentPlayIndex ?? 0]
                                            .statistics
                                            .collectCount ??
                                        0,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/Share.svg",
                                  width: 36.w,
                                  height: 36.h,
                                ),
                                Text(
                                  Format.formatNumofW(
                                    videoPlayList?[currentPlayIndex ?? 0]
                                            .statistics
                                            .shareCount ??
                                        0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: FlickVideoProgressBar(
                  flickProgressBarSettings: FlickProgressBarSettings(
                    height: 4,
                    curveRadius: 2,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FlickSoundToggle(
                  toggleMute: () => videoMultiPlayerManger?.toggleMute(),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
