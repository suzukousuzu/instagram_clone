// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state_original.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthStateOriginal _$AuthStateOriginalFromJson(Map<String, dynamic> json) {
  return _AuthStateOriginal.fromJson(json);
}

/// @nodoc
mixin _$AuthStateOriginal {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  @AuthResultConverter()
  AuthResult? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthStateOriginalCopyWith<AuthStateOriginal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateOriginalCopyWith<$Res> {
  factory $AuthStateOriginalCopyWith(
          AuthStateOriginal value, $Res Function(AuthStateOriginal) then) =
      _$AuthStateOriginalCopyWithImpl<$Res, AuthStateOriginal>;
  @useResult
  $Res call(
      {bool isLoading,
      String? userId,
      @AuthResultConverter() AuthResult? result});
}

/// @nodoc
class _$AuthStateOriginalCopyWithImpl<$Res, $Val extends AuthStateOriginal>
    implements $AuthStateOriginalCopyWith<$Res> {
  _$AuthStateOriginalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userId = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AuthResult?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthStateOriginalCopyWith<$Res>
    implements $AuthStateOriginalCopyWith<$Res> {
  factory _$$_AuthStateOriginalCopyWith(_$_AuthStateOriginal value,
          $Res Function(_$_AuthStateOriginal) then) =
      __$$_AuthStateOriginalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? userId,
      @AuthResultConverter() AuthResult? result});
}

/// @nodoc
class __$$_AuthStateOriginalCopyWithImpl<$Res>
    extends _$AuthStateOriginalCopyWithImpl<$Res, _$_AuthStateOriginal>
    implements _$$_AuthStateOriginalCopyWith<$Res> {
  __$$_AuthStateOriginalCopyWithImpl(
      _$_AuthStateOriginal _value, $Res Function(_$_AuthStateOriginal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userId = freezed,
    Object? result = freezed,
  }) {
    return _then(_$_AuthStateOriginal(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AuthResult?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthStateOriginal implements _AuthStateOriginal {
  const _$_AuthStateOriginal(
      {required this.isLoading,
      this.userId,
      @AuthResultConverter() this.result});

  factory _$_AuthStateOriginal.fromJson(Map<String, dynamic> json) =>
      _$$_AuthStateOriginalFromJson(json);

  @override
  final bool isLoading;
  @override
  final String? userId;
  @override
  @AuthResultConverter()
  final AuthResult? result;

  @override
  String toString() {
    return 'AuthStateOriginal(isLoading: $isLoading, userId: $userId, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStateOriginal &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading, userId, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStateOriginalCopyWith<_$_AuthStateOriginal> get copyWith =>
      __$$_AuthStateOriginalCopyWithImpl<_$_AuthStateOriginal>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthStateOriginalToJson(
      this,
    );
  }
}

abstract class _AuthStateOriginal implements AuthStateOriginal {
  const factory _AuthStateOriginal(
      {required final bool isLoading,
      final String? userId,
      @AuthResultConverter() final AuthResult? result}) = _$_AuthStateOriginal;

  factory _AuthStateOriginal.fromJson(Map<String, dynamic> json) =
      _$_AuthStateOriginal.fromJson;

  @override
  bool get isLoading;
  @override
  String? get userId;
  @override
  @AuthResultConverter()
  AuthResult? get result;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStateOriginalCopyWith<_$_AuthStateOriginal> get copyWith =>
      throw _privateConstructorUsedError;
}
