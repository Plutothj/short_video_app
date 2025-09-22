import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_video_flutter/pages/discover/provider/discover_state.dart';
import 'package:short_video_flutter/pages/discover/api/index.dart';

class DiscoverNotifier extends AsyncNotifier<DiscoverState> {
  @override
  Future<DiscoverState> build() async {
    return DiscoverState(
      soundsList: [],
      hashtagList: [],
      currentTab: 0,
      tabList: [],
      currentIndex: 0,
    );
  }

  Future<void> loadSoundsList() async {
    final currentState = state.value ?? await build();
    final soundsList = await DiscoverServices.getSoundsList({});
    state = AsyncValue.data(
      currentState.copyWith(soundsList: soundsList['list']),
    );
  }

  Future<void> loadHashtagList() async {
    final currentState = state.value ?? await build();
    final hashtagList = await DiscoverServices.getHashtagList({});
    state = AsyncValue.data(
      currentState.copyWith(hashtagList: hashtagList['list']),
    );
  }
}

final discoverProvider = AsyncNotifierProvider<DiscoverNotifier, DiscoverState>(
  () {
    return DiscoverNotifier();
  },
);
