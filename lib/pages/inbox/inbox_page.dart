import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InboxPage extends StatelessWidget {
  final String? theme;
  final bool? notifications;

  const InboxPage({this.theme, this.notifications, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inbox')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Theme: $theme'),
            Text('Notifications: $notifications'),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
