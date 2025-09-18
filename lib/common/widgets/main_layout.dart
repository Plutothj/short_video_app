// lib/pages/main_layout.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      body: child, // 显示当前 Tab 对应的页面
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 避免 item 过多时样式错乱
        currentIndex: currentIndex, // 当前选中的索引
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: '发现'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: '消息'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
        onTap: (index) {
          // 点击时，使用 context.go 跳转到对应的页面
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/discover');
              break;
            case 2:
              context.go('/inbox');
              break;
            case 3:
              context.go('/profile');
              break;
          }
        },
      ),
    );
  }
}
