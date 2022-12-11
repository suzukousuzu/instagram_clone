import 'package:flutter/foundation.dart';

//immutableなクラス定義
//オブジェクトを一度生成すると、後から変更不可(=immutable)
@immutable
class FirebaseCollectionName {
  //thumbnailsはstorageで使用する
  static const thumbnails = 'thumbnails';
  static const comments = 'comments';
  static const likes = 'likes';
  static const posts = 'posts';
  static const users = 'users';
  const FirebaseCollectionName._();
}
