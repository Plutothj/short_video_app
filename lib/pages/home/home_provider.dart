import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:short_video_flutter/pages/home/home_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:short_video_flutter/pages/home/api/index.dart';
import 'package:short_video_flutter/pages/home/model/video_data_model.dart';

// 使用 AsyncNotifier 处理复杂的异步状态

class HomeNotifier extends AsyncNotifier<HomeState> {
  @override
  Future<HomeState> build() async {
    return HomeState(
      videos: [],
      currentTab: 2,
      tabList: [
        {'title': '关注', 'width': 50.w},
        {'title': '好友', 'width': 50.w},
        {'title': '推荐', 'width': 50.w},
      ],
      currentIndex: 0,
    );
  }

  // 3. 优雅的异步方法处理
  Future<void> loadPlayerData() async {
    // 设置加载状态
    state = const AsyncValue.loading();

    try {
      // 加载本地json
      final videoData = await rootBundle.loadString(
        'assets/db/video_data.json',
      );
      final videoDataList = videoDataFromJson(videoData);
      final videos = videoDataList
          .map((video) => VideoData.fromJson(video.toJson()))
          .toList();
      state = AsyncValue.data(
        state.value?.copyWith(videos: videos) ??
            HomeState(
              videos: videos,
              currentTab: 0,
              tabList: [],
              currentIndex: 0,
            ),
      );
    } catch (error, stackTrace) {
      // 错误处理
      state = AsyncValue.error(error, stackTrace);
    }
  }

  // 4. 同步方法保持简单
  Future<void> setCurrentTab(int currentTab) async {
    final currentState = state.value;
    if (currentState != null && currentState.currentTab != currentTab) {
      state = AsyncValue.data(currentState.copyWith(currentTab: currentTab));
    }
  }

  Future<void> setTabList(List<Map<dynamic, dynamic>> tabList) async {
    final currentState = state.value;
    if (currentState != null) {
      state = AsyncValue.data(currentState.copyWith(tabList: tabList));
    }
  }

  Future<void> setCurrentIndex(int currentIndex) async {
    final currentState = state.value;
    if (currentState != null) {
      state = AsyncValue.data(
        currentState.copyWith(currentIndex: currentIndex),
      );
    }
  }
}

final homeProvider = AsyncNotifierProvider<HomeNotifier, HomeState>(() {
  return HomeNotifier();
});

// 全局缓存已加载的评论数据
final _commentsCache = <String, CommentsState>{};

// 定义一个评论的provider
final commentsProvider = AsyncNotifierProvider<CommentsNotifier, CommentsState>(
  () {
    return CommentsNotifier();
  },
);

class CommentsNotifier extends AsyncNotifier<CommentsState> {
  // 当前处理的videoId
  String? _currentVideoId;

  @override
  Future<CommentsState> build() async {
    // 返回空状态，实际数据通过loadComments加载
    return CommentsState(comments: []);
  }

  Future<void> loadComments(String videoId) async {
    _currentVideoId = videoId;

    // 检查缓存
    if (_commentsCache.containsKey(videoId)) {
      state = AsyncValue.data(_commentsCache[videoId]!);
      return;
    }

    // 设置加载状态
    state = const AsyncValue.loading();

    try {
      final comments = await PlayerServices.getVideoComments({
        'video_id': videoId,
      });

      final commentsState = CommentsState(comments: comments);

      // 缓存数据
      _commentsCache[videoId] = commentsState;

      // 只有当前videoId匹配时才更新状态
      if (_currentVideoId == videoId) {
        state = AsyncValue.data(commentsState);
      }
    } catch (error, stackTrace) {
      // 只有当前videoId匹配时才更新状态
      if (_currentVideoId == videoId) {
        state = AsyncValue.error(error, stackTrace);
      }
    }
  }

  // 清除特定视频的缓存
  void clearCache(String videoId) {
    _commentsCache.remove(videoId);
  }

  // 清除所有缓存
  void clearAllCache() {
    _commentsCache.clear();
  }
}
