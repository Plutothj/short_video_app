import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:short_video_flutter/theme/theme.dart';
import 'package:short_video_flutter/utils/logger.dart';

import 'package:visibility_detector/visibility_detector.dart';
import 'package:short_video_flutter/pages/home/widgets/video_player_manger.dart';
import 'package:short_video_flutter/pages/home/widgets/video_player.dart';

import 'package:short_video_flutter/pages/home/home_provider.dart';
// import 'package:short_video_flutter/pages/home/hooks/use_debounced_page_listener.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 使用 useMemoized 来创建和管理 VideoMultiPlayerManger
    final playMuitManger = useMemoized(() => VideoMultiPlayerManger());

    // 使用 useMemoized 来创建 PageController
    final pageController = useMemoized(() => PageController(initialPage: 0));

    // 使用 useEffect 来处理初始化逻辑
    useEffect(() {
      // 在框架完成布局后加载数据
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(homeProvider.notifier).loadPlayerData();
      });

      // 返回 dispose 函数（相当于 dispose 方法）
      return () {
        playMuitManger.dispose();
        pageController.dispose();
      };
    }, []); // 空数组表示只在组件挂载时执行一次
    // 使用防抖机制避免频繁触发
    final debounceTimer = useRef<Timer?>(null);
    final previousPageIndex = useRef<int>(0);

    // 优化的页面变化监听器（防抖版本）
    useEffect(() {
      void onPageChanged() {
        // 取消之前的定时器
        debounceTimer.value?.cancel();

        // 设置新的防抖定时器
        debounceTimer.value = Timer(const Duration(milliseconds: 100), () {
          final currentPage = pageController.page?.round() ?? 0;

          // 只有当页面真正改变时才执行逻辑
          if (currentPage != previousPageIndex.value) {
            previousPageIndex.value = currentPage;

            // 更新状态
            ref.read(homeProvider.notifier).setCurrentIndex(currentPage);
            logger.d('页面切换到: $currentPage');

            // 这里可以添加其他逻辑，比如统计、预加载等
            // analytics.trackPageView(currentPage);
            // preloadNextVideo(currentPage + 1);
          }
        });
      }

      pageController.addListener(onPageChanged);

      return () {
        pageController.removeListener(onPageChanged);
        debounceTimer.value?.cancel();
      };
    }, [pageController]);

    // 监听异步状态
    final homeAsyncState = ref.watch(homeProvider);

    // 使用 useCallback 来优化回调函数性能
    final onVisibilityChanged = useCallback((visibility) {
      if (visibility.visibleFraction == 0 && context.mounted) {
        playMuitManger.pause();
      }
    }, [playMuitManger]);

    return Scaffold(
      // appBar: AppBar(title: const Text('Home')),
      body: homeAsyncState.when(
        // 加载状态
        loading: () => const Center(child: CircularProgressIndicator()),
        // 错误状态
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '加载失败: $error',
                style: TextStyle(fontSize: 16.sp, color: AppColors.grey900),
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () =>
                    ref.read(homeProvider.notifier).loadPlayerData(),
                child: Text(
                  '重试',
                  style: TextStyle(fontSize: 16.sp, color: AppColors.grey900),
                ),
              ),
            ],
          ),
        ),
        // 数据加载成功状态
        data: (homeState) => VisibilityDetector(
          key: ObjectKey(playMuitManger),
          onVisibilityChanged: onVisibilityChanged,
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            controller: pageController,
            itemCount: homeState.videos.length,

            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 72.h),
                height: MediaQuery.of(context).size.height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: VideoPlayer(
                    pageController: pageController,
                    url: homeState.videos[index].ep,
                    flickMultiManager: playMuitManger,
                    image: homeState.videos[index].coverUrl, // 使用本地资源作为占位图片
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
