// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state_original.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthStateOriginal _$$_AuthStateOriginalFromJson(Map<String, dynamic> json) =>
    _$_AuthStateOriginal(
      isLoading: json['isLoading'] as bool,
      userId: json['userId'] as String?,
      result: const AuthResultConverter().fromJson(json['result'] as String?),
    );

Map<String, dynamic> _$$_AuthStateOriginalToJson(
        _$_AuthStateOriginal instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'userId': instance.userId,
      'result': const AuthResultConverter().toJson(instance.result),
    };
