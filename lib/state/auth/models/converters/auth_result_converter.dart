import 'package:enum_to_string/enum_to_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../auth_result.dart';

class AuthResultConverter implements JsonConverter<AuthResult?, String?> {
  const AuthResultConverter();

  @override
  AuthResult? fromJson(String? json) => EnumToString.fromString(
        AuthResult.values,
        json ?? '',
      );

  @override
  String? toJson(AuthResult? object) =>
      object == null ? null : EnumToString.convertToString(object);
}
