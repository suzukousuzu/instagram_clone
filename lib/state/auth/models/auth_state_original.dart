import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_clone/state/auth/models/converters/auth_result_converter.dart';

import 'auth_result.dart';

part 'auth_state_original.freezed.dart';
part 'auth_state_original.g.dart';

@freezed
class AuthStateOriginal with _$AuthStateOriginal {
  const factory AuthStateOriginal({
    required bool isLoading,
    String? userId,
    @AuthResultConverter() AuthResult? result,
  }) = _AuthStateOriginal;

  factory AuthStateOriginal.fromJson(Map<String, dynamic> json) =>
      _$AuthStateOriginalFromJson(json);
}
