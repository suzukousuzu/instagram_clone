import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../state/auth/providers/auth_state_provider.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginView'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () async {
              //final result =
              await ref.read(authStateProvider.notifier).loginWIthGoogle();
              //print()だと省略されてしまったり、ログが流れてしまったりして確認しづらいことがある
              //より便利なデバッグ方法として、「dart:developer」ライブラリを使ったログ出力
              // result.log();
            },
            child: Text('Sign with google'),
          ),
          TextButton(
            onPressed: () async {
              //todo:facebookログイン
              await ref.read(authStateProvider.notifier).loginWithFacebook();
            },
            child: Text('Sign with google'),
          ),
        ],
      ),
    );
  }
}
