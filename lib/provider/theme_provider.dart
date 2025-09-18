import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 主题状态类
class ThemeState {
  final bool isDarkMode;
  final bool isSystemMode;

  const ThemeState({required this.isDarkMode, required this.isSystemMode});

  ThemeState copyWith({bool? isDarkMode, bool? isSystemMode}) {
    return ThemeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isSystemMode: isSystemMode ?? this.isSystemMode,
    );
  }
}

// 主题 Provider
class ThemeNotifier extends Notifier<ThemeState> {
  static const String _themeKey = 'theme_mode';
  static const String _systemKey = 'system_mode';

  @override
  ThemeState build() {
    // 初始化时从本地存储读取主题设置
    _loadTheme();
    return const ThemeState(isDarkMode: false, isSystemMode: true);
  }

  // 加载主题设置
  Future<void> _loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isSystemMode = prefs.getBool(_systemKey) ?? true;
      final savedIsDark = prefs.getBool(_themeKey) ?? false;

      // 如果是系统模式，根据系统设置确定是否为暗色模式
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      final systemIsDark = brightness == Brightness.dark;

      final isDark = isSystemMode ? systemIsDark : savedIsDark;

      state = ThemeState(isDarkMode: isDark, isSystemMode: isSystemMode);
    } catch (e) {
      // 如果读取失败，使用默认设置
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      final systemIsDark = brightness == Brightness.dark;

      state = ThemeState(isDarkMode: systemIsDark, isSystemMode: true);
    }
  }

  // 设置主题模式（亮色/暗色）
  Future<void> setThemeMode({required bool isDark, bool? isSystem}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final useSystem = isSystem ?? false;

      await prefs.setBool(_systemKey, useSystem);
      if (!useSystem) {
        await prefs.setBool(_themeKey, isDark);
      }

      // 如果是系统模式，根据系统设置确定是否为暗色模式
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      final systemIsDark = brightness == Brightness.dark;

      final finalIsDark = useSystem ? systemIsDark : isDark;

      state = ThemeState(isDarkMode: finalIsDark, isSystemMode: useSystem);
    } catch (e) {
      // 如果保存失败，仍然更新状态
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      final systemIsDark = brightness == Brightness.dark;
      final useSystem = isSystem ?? false;

      final finalIsDark = useSystem ? systemIsDark : isDark;

      state = ThemeState(isDarkMode: finalIsDark, isSystemMode: useSystem);
    }
  }

  // 切换亮色/暗色模式
  Future<void> toggleTheme() async {
    await setThemeMode(isDark: !state.isDarkMode, isSystem: false);
  }

  // 设置跟随系统
  Future<void> setSystemMode() async {
    await setThemeMode(isDark: false, isSystem: true);
  }

  // 监听系统主题变化
  void updateSystemTheme() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final systemIsDark = brightness == Brightness.dark;

    // 只有在系统主题模式下才更新
    if (state.isSystemMode) {
      state = state.copyWith(isDarkMode: systemIsDark);
    }
  }
}

// Provider 实例
final themeProvider = NotifierProvider<ThemeNotifier, ThemeState>(() {
  return ThemeNotifier();
});

// 便捷的只读 Provider
final isDarkModeProvider = Provider<bool>((ref) {
  return ref.watch(themeProvider).isDarkMode;
});

final isSystemModeProvider = Provider<bool>((ref) {
  return ref.watch(themeProvider).isSystemMode;
});
