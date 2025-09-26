// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $mainLayoutRoute,
  $homeRoute,
  $discoverRoute,
  $trendingSoundsRoute,
  $trendingHashtagRoute,
  $inboxRoute,
  $profileRoute,
];

RouteBase get $mainLayoutRoute => ShellRouteData.$route(
  factory: $MainLayoutRouteExtension._fromState,
  routes: [
    GoRouteData.$route(path: '/', factory: $HomeRoute._fromState),
    GoRouteData.$route(path: '/discover', factory: $DiscoverRoute._fromState),
    GoRouteData.$route(path: '/inbox', factory: $InboxRoute._fromState),
    GoRouteData.$route(path: '/profile', factory: $ProfileRoute._fromState),
  ],
);

extension $MainLayoutRouteExtension on MainLayoutRoute {
  static MainLayoutRoute _fromState(GoRouterState state) =>
      const MainLayoutRoute();
}

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $DiscoverRoute on GoRouteData {
  static DiscoverRoute _fromState(GoRouterState state) => const DiscoverRoute();

  @override
  String get location => GoRouteData.$location('/discover');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $InboxRoute on GoRouteData {
  static InboxRoute _fromState(GoRouterState state) => const InboxRoute();

  @override
  String get location => GoRouteData.$location('/inbox');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProfileRoute on GoRouteData {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  @override
  String get location => GoRouteData.$location('/profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeRoute =>
    GoRouteData.$route(path: '/', factory: $HomeRoute._fromState);

RouteBase get $discoverRoute =>
    GoRouteData.$route(path: '/discover', factory: $DiscoverRoute._fromState);

RouteBase get $trendingSoundsRoute => GoRouteData.$route(
  path: '/trending-sounds',
  factory: $TrendingSoundsRoute._fromState,
);

mixin $TrendingSoundsRoute on GoRouteData {
  static TrendingSoundsRoute _fromState(GoRouterState state) =>
      const TrendingSoundsRoute();

  @override
  String get location => GoRouteData.$location('/trending-sounds');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $trendingHashtagRoute => GoRouteData.$route(
  path: '/trending-hashtag',
  factory: $TrendingHashtagRoute._fromState,
);

mixin $TrendingHashtagRoute on GoRouteData {
  static TrendingHashtagRoute _fromState(GoRouterState state) =>
      const TrendingHashtagRoute();

  @override
  String get location => GoRouteData.$location('/trending-hashtag');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $inboxRoute =>
    GoRouteData.$route(path: '/inbox', factory: $InboxRoute._fromState);

RouteBase get $profileRoute =>
    GoRouteData.$route(path: '/profile', factory: $ProfileRoute._fromState);
