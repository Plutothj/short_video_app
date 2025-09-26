// import 'dart:async';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/widgets.dart';
// import 'package:short_video_flutter/utils/logger.dart';
// import 'package:short_video_flutter/common/api/user.services.dart';
// import '../utils/sign_params.dart';

// class TokenRefreshService extends GetxService with WidgetsBindingObserver {
//   Timer? _timer;
//   static const Duration refreshInterval = Duration(minutes: 5);

//   String? _token;
//   final SharedPreferences _prefs = Get.find<SharedPreferences>();
//   String? _platform;
//   String? _refreshToken;
//   String? get token => _token;

//   String? _rbstdc;
//   Future<void> init() async {
//     _token = _prefs.getString('token');
//     _platform = _prefs.getString('platform');
//     _rbstdc = _prefs.getString('rbstdc');
//     _refreshToken = _prefs.getString('refresh_token');
//     startTokenRefresh();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   void startTokenRefresh() {
//     if (_timer != null && _timer!.isActive) return;

//     _timer = Timer.periodic(refreshInterval, (timer) async {
//       try {
//         final newToken = await fetchNewToken();
//         await _saveToken(newToken);
//         logger.d("Token 刷新成功: $newToken");
//       } catch (e) {
//         logger.d("Token 刷新失败: $e");
//         // 可在此添加重试逻辑
//       }
//     });
//   }

//   void stopTokenRefresh() {
//     if (_timer != null && _timer!.isActive) {
//       _timer!.cancel();
//       logger.d("Token 刷新已停止");
//     }
//   }

//   Future<String> fetchNewToken() async {
//     // 示例：调用刷新 Token 接口
//     final params = SignParams.signParams({
//       "refresh_token": _refreshToken,
//       "platform": _platform,
//       "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
//       "rbstdc": _rbstdc,
//     });
//     final response = await UserServices.refreshToken(params);
//     logger.d("_fetchNewToken: $params");
//     if (response['code'] == 1) {
//       return response['data']['token'];
//     } else {
//       logger.d("response['msg']: ${response['msg']}");
//       throw Exception('刷新 Token 失败');
//     }
//   }

//   Future<void> _saveToken(String token) async {
//     _token = token;
//     await _prefs.setString('token', token);
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.paused) {
//       stopTokenRefresh();
//     } else if (state == AppLifecycleState.resumed) {
//       startTokenRefresh();
//     }
//   }

//   @override
//   void onClose() {
//     stopTokenRefresh();
//     WidgetsBinding.instance.removeObserver(this);
//     super.onClose();
//   }
// }
