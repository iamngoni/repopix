// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../token_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) {
  return _TokenResponse.fromJson(json);
}

/// @nodoc
mixin _$TokenResponse {
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  String get scope => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_type')
  String get tokenType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenResponseCopyWith<TokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenResponseCopyWith<$Res> {
  factory $TokenResponseCopyWith(
          TokenResponse value, $Res Function(TokenResponse) then) =
      _$TokenResponseCopyWithImpl<$Res, TokenResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      String scope,
      @JsonKey(name: 'token_type') String tokenType});
}

/// @nodoc
class _$TokenResponseCopyWithImpl<$Res, $Val extends TokenResponse>
    implements $TokenResponseCopyWith<$Res> {
  _$TokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? scope = null,
    Object? tokenType = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenResponseImplCopyWith<$Res>
    implements $TokenResponseCopyWith<$Res> {
  factory _$$TokenResponseImplCopyWith(
          _$TokenResponseImpl value, $Res Function(_$TokenResponseImpl) then) =
      __$$TokenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      String scope,
      @JsonKey(name: 'token_type') String tokenType});
}

/// @nodoc
class __$$TokenResponseImplCopyWithImpl<$Res>
    extends _$TokenResponseCopyWithImpl<$Res, _$TokenResponseImpl>
    implements _$$TokenResponseImplCopyWith<$Res> {
  __$$TokenResponseImplCopyWithImpl(
      _$TokenResponseImpl _value, $Res Function(_$TokenResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? scope = null,
    Object? tokenType = null,
  }) {
    return _then(_$TokenResponseImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenResponseImpl extends _TokenResponse {
  const _$TokenResponseImpl(
      {@JsonKey(name: 'access_token') required this.accessToken,
      required this.scope,
      @JsonKey(name: 'token_type') required this.tokenType})
      : super._();

  factory _$TokenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenResponseImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  final String scope;
  @override
  @JsonKey(name: 'token_type')
  final String tokenType;

  @override
  String toString() {
    return 'TokenResponse(accessToken: $accessToken, scope: $scope, tokenType: $tokenType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, scope, tokenType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenResponseImplCopyWith<_$TokenResponseImpl> get copyWith =>
      __$$TokenResponseImplCopyWithImpl<_$TokenResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenResponseImplToJson(
      this,
    );
  }
}

abstract class _TokenResponse extends TokenResponse {
  const factory _TokenResponse(
          {@JsonKey(name: 'access_token') required final String accessToken,
          required final String scope,
          @JsonKey(name: 'token_type') required final String tokenType}) =
      _$TokenResponseImpl;
  const _TokenResponse._() : super._();

  factory _TokenResponse.fromJson(Map<String, dynamic> json) =
      _$TokenResponseImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  String get scope;
  @override
  @JsonKey(name: 'token_type')
  String get tokenType;
  @override
  @JsonKey(ignore: true)
  _$$TokenResponseImplCopyWith<_$TokenResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
