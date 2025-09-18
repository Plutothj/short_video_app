import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_video_flutter/provider/auth_provider.dart';
import 'package:short_video_flutter/routes/routes.dart'; // 引入生成的路由

// 👇 创建路由实例
GoRouter createAppRouter(WidgetRef ref) {
  return GoRouter(
    routes: $appRoutes,
    redirect: (context, state) {
      final isLoggedIn = ref.read(isLoggedInProvider);

      final isLoginPage = state.matchedLocation == '/login';
      final isPublicRoute = isLoginPage;

      // 如果未登录且访问非公开页面 → 跳登录
      if (!isLoggedIn && !isPublicRoute) {
        return '/login';
      }

      // 如果已登录还访问登录页 → 跳首页
      if (isLoggedIn && isLoginPage) {
        return '/';
      }

      return null; // 不重定向
    },
  );
}
