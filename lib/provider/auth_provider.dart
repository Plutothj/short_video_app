import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_video_flutter/common/model/user_model.dart';
import 'package:short_video_flutter/common/api/user.services.dart';

class AuthState {
  final bool isLoggedIn;
  final UserDataModel? user;

  AuthState({this.isLoggedIn = false, this.user});

  AuthState copyWith({bool? isLoggedIn, UserDataModel? user}) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      user: user ?? this.user,
    );
  }
}

final authProvider = AsyncNotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});

class AuthNotifier extends AsyncNotifier<AuthState> {
  @override
  Future<AuthState> build() async {
    return AuthState(isLoggedIn: false, user: null);
  }

  // 获取用户信息
  Future<void> getUserInfo() async {
    try {
      final userInfo = await UserServices.getUserInfo();

      // 如果返回的是数组，取第一个用户
      UserDataModel user;
      if (userInfo is List && userInfo.isNotEmpty) {
        user = UserDataModel.fromJson(userInfo[3]);
      } else if (userInfo is Map<String, dynamic>) {
        user = UserDataModel.fromJson(userInfo);
      } else {
        throw Exception('用户数据格式不正确');
      }

      // 一次性更新状态，避免重复设置
      state = AsyncValue.data(AuthState(isLoggedIn: true, user: user));
    } catch (e) {
      // 获取用户信息失败，设置为未登录状态
      state = AsyncValue.data(AuthState(isLoggedIn: false, user: null));
      rethrow; // 重新抛出异常，让调用者知道失败了
    }
  }

  // 登出
  void logout() {
    state = AsyncValue.data(AuthState(isLoggedIn: false, user: null));
  }
}

// 便捷方法 Provider（只读）
final isLoggedInProvider = Provider<bool>((ref) {
  return ref.watch(authProvider).value?.isLoggedIn ?? false;
});
