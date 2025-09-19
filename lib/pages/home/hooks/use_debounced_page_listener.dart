import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// 防抖的 PageController 监听器 Hook
void useDebouncedPageListener(
  PageController pageController, {
  required void Function(int) onPageChanged,
  Duration debounceDelay = const Duration(milliseconds: 100),
}) {
  final debounceTimer = useRef<Timer?>(null);
  final previousPageIndex = useRef<int>(0);

  useEffect(() {
    void onPageChangeListener() {
      // 取消之前的定时器
      debounceTimer.value?.cancel();

      // 设置新的防抖定时器
      debounceTimer.value = Timer(debounceDelay, () {
        final currentPage = pageController.page?.round() ?? 0;

        // 只有当页面真正改变时才执行回调
        if (currentPage != previousPageIndex.value) {
          previousPageIndex.value = currentPage;
          onPageChanged(currentPage);
        }
      });
    }

    // 添加监听器
    pageController.addListener(onPageChangeListener);

    // 清理函数
    return () {
      pageController.removeListener(onPageChangeListener);
      debounceTimer.value?.cancel();
    };
  }, [pageController, onPageChanged]);
}

/// 节流版本的 PageController 监听器 Hook
void useThrottledPageListener(
  PageController pageController, {
  required void Function(int) onPageChanged,
  Duration throttleDelay = const Duration(milliseconds: 200),
}) {
  final lastExecutedTime = useRef<DateTime?>(null);
  final previousPageIndex = useRef<int>(0);

  useEffect(() {
    void onPageChangeListener() {
      final now = DateTime.now();
      final lastTime = lastExecutedTime.value;

      // 节流：如果距离上次执行时间小于阈值，则跳过
      if (lastTime != null && now.difference(lastTime) < throttleDelay) {
        return;
      }

      final currentPage = pageController.page?.round() ?? 0;

      // 只有当页面真正改变时才执行回调
      if (currentPage != previousPageIndex.value) {
        previousPageIndex.value = currentPage;
        lastExecutedTime.value = now;
        onPageChanged(currentPage);
      }
    }

    // 添加监听器
    pageController.addListener(onPageChangeListener);

    // 清理函数
    return () {
      pageController.removeListener(onPageChangeListener);
    };
  }, [pageController, onPageChanged]);
}
