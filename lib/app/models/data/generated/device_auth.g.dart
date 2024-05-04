// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../device_auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceAuthImpl _$$DeviceAuthImplFromJson(Map json) => _$DeviceAuthImpl(
      deviceCode: json['device_code'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
      interval: (json['interval'] as num).toInt(),
      userCode: json['user_code'] as String,
      verificationUri: json['verification_uri'] as String,
    );

Map<String, dynamic> _$$DeviceAuthImplToJson(_$DeviceAuthImpl instance) =>
    <String, dynamic>{
      'device_code': instance.deviceCode,
      'expires_in': instance.expiresIn,
      'interval': instance.interval,
      'user_code': instance.userCode,
      'verification_uri': instance.verificationUri,
    };
