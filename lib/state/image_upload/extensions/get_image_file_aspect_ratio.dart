import 'dart:async';

import 'package:flutter/material.dart';

///画像サイズの取得
extension GetImageAspectRatio on Image {
  Future<double> getAspectRatio() async {
    final completer = Completer<double>();
    image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (image, _) {
          final aspectRatio = image.image.width / image.image.height;
          image.image.dispose();
          completer.complete(aspectRatio);
        },
      ),
    );
    return completer.future;
  }
}
