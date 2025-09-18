import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:short_video_flutter/provider/auth_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello, ${authState.user?.name ?? 'Guest'}!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 跳转到个人页
                context.push('/profile');
              },
              child: const Text('View Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).logout();
                // 自动被 redirect 到 /login
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
