import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../state/auth/providers/auth_state_provider.dart';
import '../components/constants/app_color.dart';
import '../constants/strings.dart';
import 'divider_with_margins.dart';
import 'facebook_button.dart';
import 'google_button.dart';
import 'login_view_signup_links.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                Strings.welcomeToAppName,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const DividerWithMargins(),
              Text(
                Strings.logIntoYourAccount,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(height: 1.5),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.loginButtonColor,
                  foregroundColor: AppColors.loginButtonTextColor,
                ),
                onPressed:
                    //print()だと省略されてしまったり、ログが流れてしまったりして確認しづらいことがある
                    //より便利なデバッグ方法として、「dart:developer」ライブラリを使ったログ出力
                    // result.log();
                    ref.read(authStateProvider.notifier).loginWithFacebook,
                child: const FacebookButton(),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.loginButtonColor,
                  foregroundColor: AppColors.loginButtonTextColor,
                ),
                onPressed: ref.read(authStateProvider.notifier).loginWithGoogle,
                child: const GoogleButton(),
              ),
              const DividerWithMargins(),
              const LoginViewSignupLinks(),
            ],
          ),
        ),
      ),
    );
  }
}
