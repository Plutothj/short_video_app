import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
// import 'package:short_video_flutter/provider/auth_provider.dart';
import 'package:short_video_flutter/routes/routes.dart'; // 引入生成的路由

// 自定义 HeroController 来控制动画持续时间
class CustomHeroController extends HeroController {
  Duration get transitionDuration => const Duration(milliseconds: 1000);

  Duration get reverseTransitionDuration => const Duration(milliseconds: 800);
}

// 👇 创建路由实例
GoRouter createAppRouter(WidgetRef ref) {
  return GoRouter(
    observers: [
      // 👈 关键：在这里添加自定义 HeroController
      CustomHeroController(),
    ],
    routes: $appRoutes,

    redirect: (context, state) {
      // final isLoggedIn = ref.read(isLoggedInProvider);

      // final isLoginPage = state.matchedLocation == '/login';
      // final isPublicRoute = isLoginPage;

      // // 如果未登录且访问非公开页面 → 跳登录
      // if (!isLoggedIn && !isPublicRoute) {
      //   return '/login';
      // }

      // // 如果已登录还访问登录页 → 跳首页
      // if (isLoggedIn && isLoginPage) {
      //   return '/';
      // }

      return null; // 不重定向
    },
  );
}
