import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/views/components/rich_text/link_text.dart';

import 'base_text.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    Key? key,
    this.styleForAll,
    required this.texts,
  }) : super(key: key);

  final TextStyle? styleForAll;
  final Iterable<BaseText> texts;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: texts.map((baseText) {
          if (baseText is LinkText) {
            return TextSpan(
                text: baseText.text,
                //baseTextのstyleが優先される
                style: styleForAll?.merge(baseText.style),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    baseText.onTapped();
                  });
          } else {
            return TextSpan(
              text: baseText.text,
              style: styleForAll?.merge(baseText.style),
            );
          }
        }).toList(),
      ),
    );
  }
}
