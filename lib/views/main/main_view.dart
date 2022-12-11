import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../state/auth/providers/auth_state_provider.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main VIew'),
      ),
      body: Consumer(builder: (context, ref, chile) {
        return TextButton(
          onPressed: () async {
            await ref.read(authStateProvider.notifier).logOut();
          },
          child: const Text('logout'),
        );
      }),
    );
  }
}
