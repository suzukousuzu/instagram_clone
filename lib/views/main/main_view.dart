import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/views/components/animations/data_not_found_animation_view.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main VIew'),
      ),
      body: Consumer(builder: (_, ref, chile) {
        return const DataNotFoundAnimationView();
        // return TextButton(
        //   onPressed: () async {
        //     await ref.read(authStateProvider.notifier).logOut();
        //   },
        //   child: const Text('logout'),
        // );
      }),
    );
  }
}
