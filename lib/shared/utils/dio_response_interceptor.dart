//
//  repopix
//  dio_response_interceptor
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../models/api_response.dart';

class DioResponseInterceptor extends Interceptor {
  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    try {
      if (response.data is Map<String, dynamic>) {
        final ApiResponse apiResponse =
            ApiResponse.fromJson(response.data as Map<String, dynamic>);
        response.data = apiResponse;
      }
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      unawaited(Sentry.captureException(e, stackTrace: s));
    }
    return handler.next(response);
  }
}
