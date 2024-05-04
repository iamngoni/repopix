// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../device_auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceAuth _$DeviceAuthFromJson(Map<String, dynamic> json) {
  return _DeviceAuth.fromJson(json);
}

/// @nodoc
mixin _$DeviceAuth {
  /// The device verification code is 40 characters and used to verify the
  /// device.
  @JsonKey(name: 'device_code')
  String get deviceCode => throw _privateConstructorUsedError;

  /// The number of seconds before the device_code and user_code expire. The
  /// default is 900 seconds or 15 minutes.
  @JsonKey(name: 'expires_in')
  int get expiresIn => throw _privateConstructorUsedError;

  /// The minimum number of seconds that must pass before you can make a new
  /// access token request (POST https://github.com/login/oauth/access_token)
  /// to complete the device authorization. For example, if the interval is
  /// 5, then you cannot make a new request until 5 seconds pass. If you make
  /// more than one request over 5 seconds, then you will hit the rate limit
  /// and receive a slow_down error.
  int get interval => throw _privateConstructorUsedError;

  /// The user verification code is displayed on the device so the user can
  /// enter the code in a browser. This code is 8 characters with a hyphen
  /// in the middle.
  @JsonKey(name: 'user_code')
  String get userCode => throw _privateConstructorUsedError;

  /// The verification URL where users need to enter the user_code: https://github.com/login/device.
  @JsonKey(name: 'verification_uri')
  String get verificationUri => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceAuthCopyWith<DeviceAuth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceAuthCopyWith<$Res> {
  factory $DeviceAuthCopyWith(
          DeviceAuth value, $Res Function(DeviceAuth) then) =
      _$DeviceAuthCopyWithImpl<$Res, DeviceAuth>;
  @useResult
  $Res call(
      {@JsonKey(name: 'device_code') String deviceCode,
      @JsonKey(name: 'expires_in') int expiresIn,
      int interval,
      @JsonKey(name: 'user_code') String userCode,
      @JsonKey(name: 'verification_uri') String verificationUri});
}

/// @nodoc
class _$DeviceAuthCopyWithImpl<$Res, $Val extends DeviceAuth>
    implements $DeviceAuthCopyWith<$Res> {
  _$DeviceAuthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceCode = null,
    Object? expiresIn = null,
    Object? interval = null,
    Object? userCode = null,
    Object? verificationUri = null,
  }) {
    return _then(_value.copyWith(
      deviceCode: null == deviceCode
          ? _value.deviceCode
          : deviceCode // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      userCode: null == userCode
          ? _value.userCode
          : userCode // ignore: cast_nullable_to_non_nullable
              as String,
      verificationUri: null == verificationUri
          ? _value.verificationUri
          : verificationUri // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceAuthImplCopyWith<$Res>
    implements $DeviceAuthCopyWith<$Res> {
  factory _$$DeviceAuthImplCopyWith(
          _$DeviceAuthImpl value, $Res Function(_$DeviceAuthImpl) then) =
      __$$DeviceAuthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'device_code') String deviceCode,
      @JsonKey(name: 'expires_in') int expiresIn,
      int interval,
      @JsonKey(name: 'user_code') String userCode,
      @JsonKey(name: 'verification_uri') String verificationUri});
}

/// @nodoc
class __$$DeviceAuthImplCopyWithImpl<$Res>
    extends _$DeviceAuthCopyWithImpl<$Res, _$DeviceAuthImpl>
    implements _$$DeviceAuthImplCopyWith<$Res> {
  __$$DeviceAuthImplCopyWithImpl(
      _$DeviceAuthImpl _value, $Res Function(_$DeviceAuthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceCode = null,
    Object? expiresIn = null,
    Object? interval = null,
    Object? userCode = null,
    Object? verificationUri = null,
  }) {
    return _then(_$DeviceAuthImpl(
      deviceCode: null == deviceCode
          ? _value.deviceCode
          : deviceCode // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      userCode: null == userCode
          ? _value.userCode
          : userCode // ignore: cast_nullable_to_non_nullable
              as String,
      verificationUri: null == verificationUri
          ? _value.verificationUri
          : verificationUri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceAuthImpl extends _DeviceAuth {
  const _$DeviceAuthImpl(
      {@JsonKey(name: 'device_code') required this.deviceCode,
      @JsonKey(name: 'expires_in') required this.expiresIn,
      required this.interval,
      @JsonKey(name: 'user_code') required this.userCode,
      @JsonKey(name: 'verification_uri') required this.verificationUri})
      : super._();

  factory _$DeviceAuthImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceAuthImplFromJson(json);

  /// The device verification code is 40 characters and used to verify the
  /// device.
  @override
  @JsonKey(name: 'device_code')
  final String deviceCode;

  /// The number of seconds before the device_code and user_code expire. The
  /// default is 900 seconds or 15 minutes.
  @override
  @JsonKey(name: 'expires_in')
  final int expiresIn;

  /// The minimum number of seconds that must pass before you can make a new
  /// access token request (POST https://github.com/login/oauth/access_token)
  /// to complete the device authorization. For example, if the interval is
  /// 5, then you cannot make a new request until 5 seconds pass. If you make
  /// more than one request over 5 seconds, then you will hit the rate limit
  /// and receive a slow_down error.
  @override
  final int interval;

  /// The user verification code is displayed on the device so the user can
  /// enter the code in a browser. This code is 8 characters with a hyphen
  /// in the middle.
  @override
  @JsonKey(name: 'user_code')
  final String userCode;

  /// The verification URL where users need to enter the user_code: https://github.com/login/device.
  @override
  @JsonKey(name: 'verification_uri')
  final String verificationUri;

  @override
  String toString() {
    return 'DeviceAuth(deviceCode: $deviceCode, expiresIn: $expiresIn, interval: $interval, userCode: $userCode, verificationUri: $verificationUri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceAuthImpl &&
            (identical(other.deviceCode, deviceCode) ||
                other.deviceCode == deviceCode) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.userCode, userCode) ||
                other.userCode == userCode) &&
            (identical(other.verificationUri, verificationUri) ||
                other.verificationUri == verificationUri));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, deviceCode, expiresIn, interval, userCode, verificationUri);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceAuthImplCopyWith<_$DeviceAuthImpl> get copyWith =>
      __$$DeviceAuthImplCopyWithImpl<_$DeviceAuthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceAuthImplToJson(
      this,
    );
  }
}

abstract class _DeviceAuth extends DeviceAuth {
  const factory _DeviceAuth(
      {@JsonKey(name: 'device_code') required final String deviceCode,
      @JsonKey(name: 'expires_in') required final int expiresIn,
      required final int interval,
      @JsonKey(name: 'user_code') required final String userCode,
      @JsonKey(name: 'verification_uri')
      required final String verificationUri}) = _$DeviceAuthImpl;
  const _DeviceAuth._() : super._();

  factory _DeviceAuth.fromJson(Map<String, dynamic> json) =
      _$DeviceAuthImpl.fromJson;

  @override

  /// The device verification code is 40 characters and used to verify the
  /// device.
  @JsonKey(name: 'device_code')
  String get deviceCode;
  @override

  /// The number of seconds before the device_code and user_code expire. The
  /// default is 900 seconds or 15 minutes.
  @JsonKey(name: 'expires_in')
  int get expiresIn;
  @override

  /// The minimum number of seconds that must pass before you can make a new
  /// access token request (POST https://github.com/login/oauth/access_token)
  /// to complete the device authorization. For example, if the interval is
  /// 5, then you cannot make a new request until 5 seconds pass. If you make
  /// more than one request over 5 seconds, then you will hit the rate limit
  /// and receive a slow_down error.
  int get interval;
  @override

  /// The user verification code is displayed on the device so the user can
  /// enter the code in a browser. This code is 8 characters with a hyphen
  /// in the middle.
  @JsonKey(name: 'user_code')
  String get userCode;
  @override

  /// The verification URL where users need to enter the user_code: https://github.com/login/device.
  @JsonKey(name: 'verification_uri')
  String get verificationUri;
  @override
  @JsonKey(ignore: true)
  _$$DeviceAuthImplCopyWith<_$DeviceAuthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
