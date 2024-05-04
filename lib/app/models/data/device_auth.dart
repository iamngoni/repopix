//
//  repopix
//  device_auth
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/device_auth.freezed.dart';
part 'generated/device_auth.g.dart';

@freezed
class DeviceAuth with _$DeviceAuth {
  const factory DeviceAuth({
    /// The device verification code is 40 characters and used to verify the
    /// device.
    @JsonKey(name: 'device_code') required String deviceCode,

    /// The number of seconds before the device_code and user_code expire. The
    /// default is 900 seconds or 15 minutes.
    @JsonKey(name: 'expires_in') required int expiresIn,

    /// The minimum number of seconds that must pass before you can make a new
    /// access token request (POST https://github.com/login/oauth/access_token)
    /// to complete the device authorization. For example, if the interval is
    /// 5, then you cannot make a new request until 5 seconds pass. If you make
    /// more than one request over 5 seconds, then you will hit the rate limit
    /// and receive a slow_down error.
    required int interval,

    /// The user verification code is displayed on the device so the user can
    /// enter the code in a browser. This code is 8 characters with a hyphen
    /// in the middle.
    @JsonKey(name: 'user_code') required String userCode,

    /// The verification URL where users need to enter the user_code: https://github.com/login/device.
    @JsonKey(name: 'verification_uri') required String verificationUri,
  }) = _DeviceAuth;

  const DeviceAuth._();

  factory DeviceAuth.fromJson(Map<String, dynamic> json) =>
      _$DeviceAuthFromJson(json);

  factory DeviceAuth.fromString(String data) {
    final parts = data.split('&');
    final deviceCode = parts[0].split('=')[1];
    final expiresIn = int.parse(parts[1].split('=')[1]);
    final interval = int.parse(parts[2].split('=')[1]);
    final userCode = parts[3].split('=')[1];
    final verificationUri = parts[4].split('=')[1];
    return DeviceAuth(
      deviceCode: deviceCode,
      expiresIn: expiresIn,
      interval: interval,
      userCode: userCode,
      verificationUri: verificationUri,
    );
  }
}
