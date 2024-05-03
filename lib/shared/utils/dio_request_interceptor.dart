//
//  repopix
//  dio_request_interceptor
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'dart:developer';

import 'package:dio/dio.dart';

import 'globals.dart';

class DioRequestInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final String? accessToken =
          await $secureStorage.getFromDisk('access_token');
      if (accessToken != null) {
        options.headers.addAll({'Authorization': 'Bearer $accessToken'});
      }
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
    }

    return handler.next(options);
  }
}