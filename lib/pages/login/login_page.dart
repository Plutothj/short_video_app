// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:short_video_flutter/common/model/user_model.dart';
// import 'package:short_video_flutter/provider/auth_provider.dart';

// class LoginScreen extends ConsumerWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Login')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             ref
//                 .read(authProvider.notifier)
//                 .login(
//                   UserModel(
//                     id: '1',
//                     name: 'Alice',
//                     email: 'alice@example.com',
//                     phone: '1234567890',
//                     avatar: 'https://example.com/avatar.jpg',
//                   ),
//                 );
//             // 登录后自动跳首页（由 redirect 控制）
//             context.push('/');
//           },
//           child: const Text('Login as Alice'),
//         ),
//       ),
//     );
//   }
// }
