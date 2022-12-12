import 'package:flutter/material.dart';
import 'package:instagram_clone/views/components/animations/models/lotte_animations.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationView extends StatelessWidget {
  const LottieAnimationView({
    Key? key,
    required this.animation,
    this.repeat = true,
    this.reverse = false,
  }) : super(key: key);

  final LottieAnimation animation;
  final bool repeat;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(animation.fullPath, reverse: reverse, repeat: repeat);
  }
}

extension GetFulPath on LottieAnimation {
  String get fullPath => 'assets/animations/$name.json';
}
