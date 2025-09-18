import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_video_flutter/pages/home/mock/video_data.dart';
import 'package:short_video_flutter/pages/home/home_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final homeProvider = NotifierProvider<HomeNotifier, HomeState>(() {
  return HomeNotifier();
});

class HomeNotifier extends Notifier<HomeState> {
  @override
  HomeState build() {
    final items = shortVideoMockData['items'] as List<dynamic>;
    return HomeState(
      videos: items
          .map((e) => (e as Map<String, dynamic>)['trailer_url'] as String)
          .toList(),
      currentTab: 2,
      tabList: [
        {'title': 'Following', 'width': 77.w},
        {'title': 'Friends', 'width': 59.w},
        {'title': 'For You', 'width': 60.w},
      ],
    );
  }

  void setVideos(List<Map<String, dynamic>> videos) {
    state = state.copyWith(
      videos: videos.map((e) => e['trailer_url'] as String).toList(),
    );
  }

  void setCurrentTab(int currentTab) {
    if (state.currentTab != currentTab) {
      state = state.copyWith(currentTab: currentTab);
    }
  }

  void setTabList(List<Map<dynamic, dynamic>> tabList) {
    state = state.copyWith(tabList: tabList);
  }
}
