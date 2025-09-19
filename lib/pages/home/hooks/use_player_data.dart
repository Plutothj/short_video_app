import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:short_video_flutter/pages/home/home_provider.dart';

/// 专门用于播放器数据的 Hook
({AsyncValue homeState, VoidCallback loadData, VoidCallback reload})
usePlayerData(WidgetRef ref) {
  final homeAsyncState = ref.watch(homeProvider);

  final loadData = useCallback(() {
    ref.read(homeProvider.notifier).loadPlayerData();
  }, []);

  final reload = useCallback(() {
    ref.read(homeProvider.notifier).loadPlayerData();
  }, []);

  // 自动加载数据
  useEffect(() {
    Future.microtask(loadData);
    return null;
  }, [loadData]);

  return (homeState: homeAsyncState, loadData: loadData, reload: reload);
}
