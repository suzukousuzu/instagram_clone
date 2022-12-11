import 'dart:collection';

import 'package:flutter/foundation.dart' show immutable;
import 'package:instagram_clone/state/posts/typedefs/user_id.dart';

import '../../constants/firebase_field_name.dart';

//String:StringのMapを作るためのクラス
@immutable
class UserInfoPayload extends MapView<String, String> {
  UserInfoPayload({
    required UserId userId,
    required String? displayName,
    required String? email,
  }) : super(
          {
            FirebaseFieldName.userId: userId,
            FirebaseFieldName.displayName: displayName ?? '',
            FirebaseFieldName.email: email ?? '',
          },
        );
}
