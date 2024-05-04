// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenResponseImpl _$$TokenResponseImplFromJson(Map json) =>
    _$TokenResponseImpl(
      accessToken: json['access_token'] as String,
      scope: json['scope'] as String,
      tokenType: json['token_type'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
      refreshToken: json['refresh_token'] as String,
      refreshTokenExpiresIn: (json['refresh_token_expires_in'] as num).toInt(),
    );

Map<String, dynamic> _$$TokenResponseImplToJson(_$TokenResponseImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'scope': instance.scope,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'refresh_token': instance.refreshToken,
      'refresh_token_expires_in': instance.refreshTokenExpiresIn,
    };
