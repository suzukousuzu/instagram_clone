import 'package:flutter/material.dart';

import 'empty_contensts_animation_view.dart';

class EmptyContentsWithTextAnimationView extends StatelessWidget {
  const EmptyContentsWithTextAnimationView({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white54),
            ),
          ),
          const EmptyContentsAnimationView(),
        ],
      ),
    );
  }
}
