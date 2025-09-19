import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:short_video_flutter/pages/home/home_provider.dart';

/// 自定义 Hook 来管理 PageController 和页面变化监听
({PageController controller, int currentIndex, void Function(int) setIndex})
usePageController({int initialPage = 0, void Function(int)? onPageChanged}) {
  // 创建 PageController
  final controller = useMemoized(
    () => PageController(initialPage: initialPage),
  );

  // 当前页面索引状态
  final currentIndex = useState(initialPage);

  // 页面变化处理函数
  final setIndex = useCallback((int index) {
    currentIndex.value = index;
    onPageChanged?.call(index);
  }, [onPageChanged]);

  // 监听 PageController 的页面变化
  useEffect(() {
    void onPageChanged() {
      final page = controller.page?.round() ?? 0;
      if (page != currentIndex.value) {
        setIndex(page);
      }
    }

    // 添加监听器
    controller.addListener(onPageChanged);

    // 清理函数
    return () {
      controller.removeListener(onPageChanged);
      controller.dispose();
    };
  }, [controller, setIndex]);

  return (
    controller: controller,
    currentIndex: currentIndex.value,
    setIndex: setIndex,
  );
}

/// 专门用于视频页面的 PageController Hook
({PageController controller, int currentIndex, void Function(int) setIndex})
useVideoPageController(WidgetRef ref, {int initialPage = 0}) {
  return usePageController(
    initialPage: initialPage,
    onPageChanged: (index) {
      // 自动更新到 provider
      ref.read(homeProvider.notifier).setCurrentIndex(index);
    },
  );
}
