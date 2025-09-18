import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_video_flutter/common/model/user_model.dart';

class AuthState {
  final bool isLoggedIn;
  final UserModel? user;

  AuthState({this.isLoggedIn = false, this.user});

  AuthState copyWith({bool? isLoggedIn, UserModel? user}) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      user: user ?? this.user,
    );
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    return AuthState();
  }

  void login(UserModel user) {
    state = state.copyWith(isLoggedIn: true, user: user);
  }

  void logout() {
    state = state.copyWith(isLoggedIn: false, user: null);
  }
}

// 便捷方法 Provider（只读）
final isLoggedInProvider = Provider<bool>((ref) {
  return ref.watch(authProvider).isLoggedIn;
});
