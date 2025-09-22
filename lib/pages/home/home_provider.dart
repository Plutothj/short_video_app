import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_video_flutter/utils/logger.dart';
import 'package:short_video_flutter/pages/home/home_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:short_video_flutter/pages/home/api/index.dart';
import 'package:short_video_flutter/pages/home/model/video_item_model.dart';

// 使用 AsyncNotifier 处理复杂的异步状态

class HomeNotifier extends AsyncNotifier<HomeState> {
  // 辅助方法：安全地将动态类型转换为 int
  int? _parseToInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.round();
    if (value is String) {
      // 尝试解析字符串
      final doubleValue = double.tryParse(value);
      return doubleValue?.round();
    }
    return null;
  }

  @override
  Future<HomeState> build() async {
    return HomeState(
      videos: [],
      currentTab: 2,
      tabList: [
        {'title': 'Following', 'width': 77.w},
        {'title': 'Friends', 'width': 59.w},
        {'title': 'For You', 'width': 60.w},
      ],
      currentIndex: 0,
    );
  }

  // 3. 优雅的异步方法处理
  Future<void> loadPlayerData() async {
    // 设置加载状态
    state = const AsyncValue.loading();

    try {
      // 并行请求多个接口
      final results = await Future.wait([
        PlayerServices.getPlayerDetail({'drama_id': 49}),
        PlayerServices.getPlayerPage({'drama_id': 49, 'page': 1}),
      ]);

      final playerDetail = results[0];
      final playerPage = results[1];
      logger.d('PlayerDetail: $playerDetail');
      logger.d('PlayerPage: ${playerPage.toString()}');

      // 合并数据并更新状态
      final currentState = state.value ?? await build();

      // 安全地提取视频数据
      final pageVideos = <VideoItemModel>[];

      if (playerPage['list'] != null && playerPage['list'] is List) {
        for (var item in playerPage['list']) {
          try {
            if (item != null && item is Map<String, dynamic>) {
              // 确保必需字段存在并有默认值，处理数字类型转换
              final videoItem = VideoItemModel(
                ep: item['ep']?.toString() ?? '',
                coverUrl: item['cover_url']?.toString() ?? '',
                like: _parseToInt(item['like']) ?? 0,
                like_number: _parseToInt(item['like_number']) ?? 0,
                collect: _parseToInt(item['collect']) ?? 0,
                collect_number: _parseToInt(item['collect_number']) ?? 0,
              );
              pageVideos.add(videoItem);
            }
          } catch (e) {
            logger.d('解析视频数据失败: $e, 数据: $item');
            // 跳过有问题的数据项
            continue;
          }
        }
      }

      state = AsyncValue.data(currentState.copyWith(videos: pageVideos));
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
