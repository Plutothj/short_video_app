import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_video_flutter/utils/logger.dart';
import 'package:short_video_flutter/utils/http.dart';
import 'package:short_video_flutter/routes/app_router.dart';
import 'package:short_video_flutter/theme/theme.dart';
import 'package:short_video_flutter/provider/theme_provider.dart';
import 'package:short_video_flutter/provider/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化 HttpUtil
  await HttpUtil().init();

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

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    // 应用启动时自动获取用户信息
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeAuth();
    });
  }

  Future<void> _initializeAuth() async {
    try {
      await ref.read(authProvider.notifier).getUserInfo();
      logger.d('用户信息初始化成功');
    } catch (e) {
      logger.d('用户信息初始化失败: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(isDarkModeProvider);

    return ScreenUtilInit(
      designSize: const Size(428, 926),
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
