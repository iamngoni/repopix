// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl _$$ApiResponseImplFromJson(Map json) => _$ApiResponseImpl(
      status: json['status'] as bool,
      statusDescription: json['statusDescription'] as String,
      message: json['message'] as String?,
      data: (json['data'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e),
      ),
      issues: json['issues'],
    );

Map<String, dynamic> _$$ApiResponseImplToJson(_$ApiResponseImpl instance) {
  final val = <String, dynamic>{
    'status': instance.status,
    'statusDescription': instance.statusDescription,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('data', instance.data);
  writeNotNull('issues', instance.issues);
  return val;
}
