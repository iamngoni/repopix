//
//  repopix
//  token_response
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/token_response.freezed.dart';
part 'generated/token_response.g.dart';

@freezed
class TokenResponse with _$TokenResponse {
  const factory TokenResponse({
    @JsonKey(name: 'access_token') required String accessToken,
    required String scope,
    @JsonKey(name: 'token_type') required String tokenType,
    @JsonKey(name: 'expires_in') required int expiresIn,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'refresh_token_expires_in')
    required int refreshTokenExpiresIn,
  }) = _TokenResponse;

  const TokenResponse._();

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);

  factory TokenResponse.fromString(String text) {
    final parts = text.split('&');
    final accessToken = parts[0].split('=')[1];
    final expiresIn = int.parse(parts[1].split('=')[1]);
    final refreshToken = parts[2].split('=')[1];
    final refreshTokenExpiresIn = int.parse(parts[3].split('=')[1]);
    final tokenType = parts[5].split('=')[1];
    final scope = parts[4].split('=')[1];

    return TokenResponse(
      accessToken: accessToken,
      tokenType: tokenType,
      scope: scope,
      expiresIn: expiresIn,
      refreshToken: refreshToken,
      refreshTokenExpiresIn: refreshTokenExpiresIn,
    );
  }

  List<String> get scopes => scope.split(',');
}
