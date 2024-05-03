//
//  repopix
//  injection
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sentry_dio/sentry_dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'injection.config.dart';
import 'shared/utils/dio_request_interceptor.dart';
import 'shared/utils/dio_response_interceptor.dart';

final GetIt getIt = GetIt.instance
  ..registerSingleton<Dio>(
    Dio()
      ..options.baseUrl = 'http://localhost:5243/api/1.0'
      ..interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true))
      ..interceptors.add(DioRequestInterceptor())
      ..interceptors.add(DioResponseInterceptor())
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
      )
      ..options.connectTimeout = 60000.milliseconds
      ..addSentry(
        failedRequestStatusCodes: [
          SentryStatusCode.range(400, 404),
          SentryStatusCode(500),
          SentryStatusCode(502),
          SentryStatusCode(524),
        ],
      ),
  );

@InjectableInit()
void configureInjection() => getIt.init();
