import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_video_flutter/utils/logger.dart';
import 'package:short_video_flutter/routes/app_router.dart';
import 'package:short_video_flutter/theme/theme.dart';
import 'package:short_video_flutter/provider/theme_provider.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [LoggerObserver()], // 可选：调试用
      child: const MyApp(),
    ),
  );
}

base class LoggerObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    logger.d('[$context.provider] $previousValue → $newValue');
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: createAppRouter(ref),
        title: 'Short Video',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}
