import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:short_video_flutter/pages/home/model/note_data_model.dart';
import 'package:short_video_flutter/theme/theme.dart';
import 'package:short_video_flutter/utils/format.dart';
import 'package:short_video_flutter/utils/logger.dart';

import 'package:visibility_detector/visibility_detector.dart';
import 'package:short_video_flutter/pages/home/widgets/video_player_manger.dart';
import 'package:short_video_flutter/pages/home/widgets/video_player.dart';
import 'package:lottie/lottie.dart';
import 'package:short_video_flutter/pages/home/home_provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

// import 'package:short_video_flutter/pages/home/hooks/use_debounced_page_listener.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  Widget _buildVideoView(
    WidgetRef ref,
    PageController pageController,
    VideoMultiPlayerManger playMuitManger,
    Function(VisibilityInfo) onVisibilityChanged,
  ) {
    final homeAsyncState = ref.watch(homeProvider);
    return homeAsyncState.when(
      // 加载状态
      loading: () => Center(
        child: Lottie.asset(
          'assets/lottie/Loader.json',
          width: 120.w,
          height: 40.h,
        ),
      ),
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
              onPressed: () => ref.read(homeProvider.notifier).loadPlayerData(),
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
          itemCount: homeState.videos.isNotEmpty ? homeState.videos.length : 1,

          itemBuilder: (context, index) {
            // 如果没有视频数据，显示占位符
            if (homeState.videos.isEmpty) {
              return Container(
                margin: EdgeInsets.only(bottom: 72.h),
                child: const Center(child: Text('暂无视频数据')),
              );
            }
            return Container(
              color: AppColors.grey900,
              margin: EdgeInsets.only(bottom: 72.h),

              child: ClipRRect(
                key: ObjectKey(homeState.videos[index]),
                child: VideoPlayer(
                  pageController: pageController,
                  url: homeState.videos[index].video.playAddr.urlList[0],
                  flickMultiManager: playMuitManger,
                  image: Format.formatImageUrl(
                    homeState.videos[index].video.cover.urlList[0],
                  ),
                  videoWidth: homeState.videos[index].video.playAddr.width,
                  videoHeight: homeState.videos[index].video.playAddr.height,
                  // 使用本地资源作为占位图片
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNotesView(WidgetRef ref, PageController tabPageController) {
    return _NotesView(tabPageController: tabPageController);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 使用 useMemoized 来创建和管理 VideoMultiPlayerManger
    final playMuitManger = useMemoized(() => VideoMultiPlayerManger());

    // 使用 useMemoized 来创建 PageController
    final pageController = useMemoized(() => PageController(initialPage: 0));
    final tabPageController = useMemoized(() => PageController(initialPage: 3));

    // 使用 useEffect 来处理初始化逻辑
    useEffect(() {
      // 在框架完成布局后加载数据
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          ref.read(homeProvider.notifier).loadPlayerData();
        }
      });

      // 返回 dispose 函数（相当于 dispose 方法）
      return () {
        playMuitManger.dispose();
        pageController.dispose();
        tabPageController.dispose();
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
          if (!context.mounted) return;

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
    // final homeAsyncState = ref.watch(homeProvider);
    final tabList = ref.watch(tabProvider).tabList;
    // 使用 useCallback 来优化回调函数性能
    final onVisibilityChanged = useCallback((visibility) {
      if (visibility.visibleFraction == 0 && context.mounted) {
        playMuitManger.pause();
      }
    }, [playMuitManger]);

    return Scaffold(
      // 关键属性：让页面内容延伸到AppBar后面
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20.w,
          children: [
            ...tabList.asMap().entries.map(
              (entry) => GestureDetector(
                key: Key(entry.value['index'].toString()),
                onTap: () {
                  ref
                      .read(tabProvider.notifier)
                      .setCurrentTab(entry.value['index']);
                  tabPageController.animateToPage(
                    entry.value['index'],
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Column(
                  children: [
                    Text(
                      entry.value['title'],
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: ref.watch(tabProvider).currentTab == entry.key
                            ? AppColors.primary
                            : Colors.white,
                      ),
                    ),
                    SizedBox(height: 12.w),
                    Container(
                      width: entry.value['width'],
                      height: ref.watch(tabProvider).currentTab == entry.key
                          ? 3.h
                          : 2.h,
                      decoration: BoxDecoration(
                        color: ref.watch(tabProvider).currentTab == entry.key
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
        backgroundColor: Colors.transparent,

        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Image.asset(
            'assets/icons/live_icon.png',
            width: 28.w,
            height: 28.h,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () => context.pop(),
            icon: Image.asset(
              'assets/icons/search_icon.png',
              width: 28.w,
              height: 28.h,
            ),
          ),
        ],
      ),
      body: PageView.builder(
        controller: tabPageController,
        // 横向滑动
        scrollDirection: Axis.horizontal,
        itemCount: tabList.length,
        onPageChanged: (index) {
          // 确保索引在有效范围内
          if (index < tabList.length) {
            ref.read(tabProvider.notifier).setCurrentTab(index);
          }
        },
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return _buildNotesView(ref, tabPageController);
            case 1:
            case 2:
            case 3:
              return _buildVideoView(
                ref,
                pageController,
                playMuitManger,
                onVisibilityChanged,
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}

class _NotesView extends HookConsumerWidget {
  final PageController tabPageController;

  const _NotesView({required this.tabPageController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesAsyncState = ref.watch(notesProvider);

    // 使用 useEffect 在组件挂载时加载数据
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          ref.read(notesProvider.notifier).loadNotes();
        }
      });
      return null;
    }, []);

    return Container(
      color: AppColors.grey900,
      child: notesAsyncState.when(
        data: (notesState) => MasonryGridView.count(
          itemCount: notesState.notes.length,
          crossAxisCount: 2,
          mainAxisSpacing: 4.h,
          crossAxisSpacing: 4.w,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () =>
                  showFullScreenDetail(context, notesState.notes[index]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: notesState.notes[index].id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: CachedNetworkImage(
                        imageUrl: Format.formatImageUrl(
                          notesState.notes[index].noteCard.cover.urlDefault,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          notesState.notes[index].noteCard.displayTitle,
                          textAlign: TextAlign.start,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 8.r,
                              backgroundImage: CachedNetworkImageProvider(
                                notesState.notes[index].noteCard.user.avatar,
                              ),
                            ),
                            Text(
                              notesState.notes[index].noteCard.user.nickname,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.favorite, size: 13.sp),
                                  Text(
                                    notesState
                                        .notes[index]
                                        .noteCard
                                        .interactInfo
                                        .likedCount,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        loading: () => Center(
          child: Lottie.asset(
            'assets/lottie/Loader.json',
            width: 120.w,
            height: 40.h,
          ),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('加载失败: $error'),
              ElevatedButton(
                onPressed: () => ref.read(notesProvider.notifier).loadNotes(),
                child: const Text('重试'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 在 Overlay 上显示全屏详情
  void showFullScreenDetail(BuildContext context, NoteDataModel item) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            // 点击任意位置返回（可改为只点返回按钮）
            overlayEntry.remove();
          },
          child: Material(
            // 使用 Material 避免 ink splash 问题
            color: Colors.black,
            child: Hero(
              tag: item.id,
              createRectTween: (begin, end) {
                return MaterialRectArcTween(begin: begin, end: end);
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 600.h,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Swiper(
                            itemBuilder: (context, index) {
                              return CachedNetworkImage(
                                imageUrl: Format.formatImageUrl(
                                  item
                                      .noteCard
                                      .imageList[index]
                                      .infoList[0]
                                      .url,
                                ),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Center(child: Icon(Icons.error)),
                              );
                            },
                            itemCount: item.noteCard.imageList.length,
                            // 自定义分页指示器
                            pagination: SwiperCustomPagination(
                              builder: (context, config) {
                                return Positioned(
                                  bottom: 20,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: SimpleDouyinPagination(
                                      itemCount: item.noteCard.imageList.length,
                                      currentIndex: config.activeIndex,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 16,
                          child: GestureDetector(
                            onTap: () {
                              overlayEntry.remove();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 16.w),
                          CircleAvatar(
                            radius: 14.r,
                            backgroundImage: CachedNetworkImageProvider(
                              item.noteCard.user.avatar,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Text(item.noteCard.user.nickname),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 56.w,
                                  height: 28.h,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      '关注',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(item.noteCard.displayTitle),

                      // Text(item.noteCard.user.nickname),
                      // Text(item.noteCard.interactInfo.likedCount),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(overlayEntry);
  }
}

class SimpleDouyinPagination extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const SimpleDouyinPagination({
    super.key,
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    // 如果只有一张图片，不显示指示器
    if (itemCount <= 1) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(itemCount, (index) {
          bool isActive = index == currentIndex;
          return Container(
            margin: EdgeInsets.only(left: index == 0 ? 0 : 6),
            width: isActive ? 20 : 8,
            height: 4,
            decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(2),
            ),
          );
        }),
      ),
    );
  }
}
