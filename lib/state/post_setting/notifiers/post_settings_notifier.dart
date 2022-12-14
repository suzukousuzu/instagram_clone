import 'dart:collection';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/post_setting/models/post_setting.dart';

class PostSettingNotifier extends StateNotifier<Map<PostSetting, bool>> {
  PostSettingNotifier()
      //Mapの変更を許可しない(=immutable)
      : super(
          UnmodifiableMapView(
            {for (final setting in PostSetting.values) setting: true},
          ),
        );

  void setSetting(
    PostSetting setting,
    bool value,
  ) {
    final existingValue = state[setting];

    if (existingValue == null) {
      return;
    }
    //これじゃだめ？？(immutableにしてるから？)
    //state[setting] = value;

    //こういう書き方だと覚えておく
    state = Map.unmodifiable(Map.from(state)..[setting] = value);
  }
}
