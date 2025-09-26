import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:short_video_flutter/pages/home/home_page.dart';
// import 'package:short_video_flutter/pages/login/login_page.dart';
import 'package:short_video_flutter/pages/profile/profile_page.dart';
import 'package:short_video_flutter/pages/inbox/inbox_page.dart';
import 'package:short_video_flutter/pages/discover/discover_page.dart';
import 'package:short_video_flutter/common/widgets/main_layout.dart';
import 'package:short_video_flutter/pages/trending_sounds/trending_sounds_page.dart';
import 'package:short_video_flutter/pages/trending_hashtag/trending_hashtag_page.dart';

part 'routes.g.dart';

// 使用 TypedShellRoute 定义带底部导航栏的布局
@TypedShellRoute<MainLayoutRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(path: '/'),
    TypedGoRoute<DiscoverRoute>(path: '/discover'),
    TypedGoRoute<InboxRoute>(path: '/inbox'),
    // 修正了 ProfileRoute 的定义方式，以匹配常见的带默认值的用法
    TypedGoRoute<ProfileRoute>(path: '/profile'),
  ],
)
class MainLayoutRoute extends ShellRouteData {
  const MainLayoutRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return MainLayout(child: navigator);
  }
}

// // 登录页（独立，不在底部导航内）
// @TypedGoRoute<LoginRoute>(path: '/login')
// class LoginRoute extends GoRouteData with $LoginRoute {
//   const LoginRoute();

//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       const LoginScreen();
// }

// 首页
@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

// 发现页
@TypedGoRoute<DiscoverRoute>(path: '/discover')
class DiscoverRoute extends GoRouteData with $DiscoverRoute {
  const DiscoverRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DiscoverPage();
}

// 趋势页
@TypedGoRoute<TrendingSoundsRoute>(path: '/trending-sounds')
class TrendingSoundsRoute extends GoRouteData with $TrendingSoundsRoute {
  const TrendingSoundsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TrendingSoundsPage();
}

// 趋势页
@TypedGoRoute<TrendingHashtagRoute>(path: '/trending-hashtag')
class TrendingHashtagRoute extends GoRouteData with $TrendingHashtagRoute {
  const TrendingHashtagRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TrendingHashtagPage();
}

// 消息页
@TypedGoRoute<InboxRoute>(path: '/inbox')
class InboxRoute extends GoRouteData with $InboxRoute {
  const InboxRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const InboxPage();
}

// 个人页
@TypedGoRoute<ProfileRoute>(path: '/profile')
class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfileScreen(userId: 'current_user');
}
