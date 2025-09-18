// lib/pages/main_layout.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:short_video_flutter/theme/theme.dart';
import 'package:short_video_flutter/common/widgets/custome_bottom_bar.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.child});

  // 子页面将通过这个 child 参数传入
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // 获取当前路由状态
    final routerState = GoRouterState.of(context);
    final currentLocation = routerState.matchedLocation;

    // 根据当前路径确定选中的索引
    int currentIndex = 0;
    if (currentLocation == '/') {
      currentIndex = 0; // 首页
    } else if (currentLocation == '/discover') {
      currentIndex = 1; // 发现
    } else if (currentLocation == '/inbox') {
      currentIndex = 2; // 消息
    } else if (currentLocation == '/profile') {
      currentIndex = 3; // 个人页
    }

    return Scaffold(
      extendBody: true, // 让 body 延伸到底部导航栏下面
      body: child, // 显示当前 Tab 对应的页面

      bottomNavigationBar: CustomBottomBar(
        currentIndex: currentIndex,
        onHomeTap: () {
          context.go('/');
        },
        onDiscoverTap: () {
          context.go('/discover');
        },
        onAddTap: () {
          context.go('/add');
        },
        onInboxTap: () {
          context.go('/inbox');
        },
        onProfileTap: () {
          context.go('/profile');
        },
      ),
    );
  }
}
