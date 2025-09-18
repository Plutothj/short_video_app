import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_video_flutter/provider/theme_provider.dart';

class ProfileScreen extends ConsumerWidget {
  final String userId;

  const ProfileScreen({required this.userId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final isSystemMode = ref.watch(isSystemModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
        actions: [
          // 主题切换按钮
          IconButton(
            onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            tooltip: isDarkMode ? '切换到亮色模式' : '切换到暗色模式',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 用户信息卡片
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Text(
                        userId.isNotEmpty ? userId[0].toUpperCase() : 'U',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '用户 $userId',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            'ID: $userId',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 设置选项
            Text('设置', style: Theme.of(context).textTheme.titleLarge),

            const SizedBox(height: 16),

            // 主题设置
            Card(
              child: ListTile(
                leading: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
                title: const Text('主题模式'),
                subtitle: Text(
                  isSystemMode ? '跟随系统' : (isDarkMode ? '暗色模式' : '亮色模式'),
                ),
                trailing: PopupMenuButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  onSelected: (mode) {
                    switch (mode) {
                      case 'light':
                        ref
                            .read(themeProvider.notifier)
                            .setThemeMode(isDark: false);
                        break;
                      case 'dark':
                        ref
                            .read(themeProvider.notifier)
                            .setThemeMode(isDark: true);
                        break;
                      case 'system':
                        ref.read(themeProvider.notifier).setSystemMode();
                        break;
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'light',
                      child: Row(
                        children: [
                          Icon(Icons.light_mode),
                          SizedBox(width: 8),
                          Text('亮色模式'),
                          if (!isSystemMode && !isDarkMode)
                            Icon(Icons.check, size: 16),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'dark',
                      child: Row(
                        children: [
                          Icon(Icons.dark_mode),
                          SizedBox(width: 8),
                          Text('暗色模式'),
                          if (!isSystemMode && isDarkMode)
                            Icon(Icons.check, size: 16),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'system',
                      child: Row(
                        children: [
                          Icon(Icons.settings_system_daydream),
                          SizedBox(width: 8),
                          Text('跟随系统'),
                          if (isSystemMode) Icon(Icons.check, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 其他设置项
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text('通知设置'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // TODO: 跳转到通知设置页面
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.privacy_tip),
                    title: const Text('隐私设置'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // TODO: 跳转到隐私设置页面
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('帮助与反馈'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // TODO: 跳转到帮助页面
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 退出登录按钮
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // TODO: 实现退出登录逻辑
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('退出登录功能待实现')));
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('退出登录'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
