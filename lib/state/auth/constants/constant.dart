import 'package:flutter/foundation.dart';

@immutable
class Constants {
  static const accountExistsWithDifferentCredential =
      'account-exists-with-different-credential';

  static const googleCom = 'google.com';
  static const emailScope = 'email';

  //複数回インスタンス化できないようにするプライベートコンストラクタ
  //たった一度のインスタンス化
  const Constants._();
}
