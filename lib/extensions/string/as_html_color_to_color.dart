import 'package:flutter/material.dart' show Color;
import 'package:instagram_clone/extensions/string/remove_all.dart';

///#ab00ss0→0Xffab00ss0
extension AsHtmlColorToColor on String {
  Color htmlColorToColor() => Color(
        int.parse(
          removeAll(['0x', '#']).padLeft(8, 'ff'),
          radix: 16,
        ),
      );
}
