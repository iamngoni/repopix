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
    );

Map<String, dynamic> _$$TokenResponseImplToJson(_$TokenResponseImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'scope': instance.scope,
      'token_type': instance.tokenType,
    };
