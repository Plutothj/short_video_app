import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_video_flutter/pages/profile/provider/profile_state.dart';
import 'package:short_video_flutter/pages/profile/api/index.dart';

class ProfileNotifier extends AsyncNotifier<ProfileState> {
  @override
  Future<ProfileState> build() async {
    return ProfileState(
      postsList: [],
      followersList: [],
      followingList: [],
      likesList: [],
    );
  }

  // Future<void> loadPostsList() async {
  //   final currentState = state.value ?? await build();
  //   final postsList = await ProfileServices.getPostsList({});
  //   state = AsyncValue.data(currentState.copyWith(postsList: postsList));
  // }

  Future<void> loadPostsList() async {
    final currentState = state.value ?? await build();
    final postsList = await ProfileServices.getPostsVideoList();
    state = AsyncValue.data(currentState.copyWith(postsList: postsList));
  }
}

// 不用异步构建，直接构建

class TabNotifier extends Notifier<TabState> {
  @override
  TabState build() {
    return TabState(
      currentTab: 0,
      tabList: [
        'assets/svg/Iconly_Bold_Category.svg',
        'assets/svg/Iconly_Bold_Lock.svg',
        'assets/svg/Iconly_Bold_Bookmark.svg',
        'assets/svg/Iconly_Bold_Heart.svg',
      ],
      currentIndex: 0,
    );
  }

  void setCurrentPage(int page) {
    state = state.copyWith(currentTab: page, currentIndex: page);
  }
}

final profileProvider = AsyncNotifierProvider<ProfileNotifier, ProfileState>(
  () {
    return ProfileNotifier();
  },
);

//
final tabProvider = NotifierProvider<TabNotifier, TabState>(() {
  return TabNotifier();
});
