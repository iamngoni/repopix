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
  }) = _TokenResponse;

  const TokenResponse._();

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);

  List<String> get scopes => scope.split(',');
}
