import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/auth/backend/authenticator.dart';
import 'package:instagram_clone/state/auth/models/auth_result.dart';
import 'package:instagram_clone/state/auth/models/auth_state_original.dart';
import 'package:instagram_clone/state/user_info/backend/user_info_storage.dart';

class AuthStateNotifier extends StateNotifier<AuthStateOriginal> {
  AuthStateNotifier(
      {Key? key, required this.authenticator, required this.userInfoStorage})
      : super(const AuthStateOriginal(
          result: null,
          isLoading: false,
          userId: null,
        )) {
    if (authenticator.isAlreadyLoggedIn) {
      state = AuthStateOriginal(
          result: AuthResult.success,
          isLoading: false,
          userId: authenticator.userId);
    }
  }

  final Authenticator authenticator;
  final UserInfoStorage userInfoStorage;

  Future<void> logOut() async {
    state = state.copyWith(isLoading: true);
    await authenticator.logOut();
    state = state.copyWith(
      result: null,
      isLoading: false,
      userId: null,
    );
  }

  Future<void> loginWIthGoogle() async {
    state = state.copyWith(isLoading: true);
    final result = await authenticator.loginWithGoogle();
    final userId = authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      //user情報を保存
      await saveUserInfo(userId);
    }
    state = AuthStateOriginal(result: result, isLoading: false, userId: userId);
  }

  Future<void> loginWithFacebook() async {
    state = state.copyWith(isLoading: true);
    final result = await authenticator.loginWithFacebook();
    final userId = authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      await saveUserInfo(userId);
    }
    state = AuthStateOriginal(
      result: result,
      isLoading: false,
      userId: authenticator.userId,
    );
  }

  Future<void> saveUserInfo(String userId) async {
    userInfoStorage.saveUserInfo(
      userId: userId,
      displayName: authenticator.displayName,
      email: authenticator.email,
    );
  }
}
