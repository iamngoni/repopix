//
//  repopix
//  github_app_repository
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../shared/configs/constants.dart';
import '../../../../shared/models/application_error.dart';
import '../../../../shared/utils/dio_error_to_application_error.dart';
import '../../../../shared/utils/globals.dart';
import '../../data/device_auth.dart';
import '../../data/token_response.dart';
import '../abs/app_repository.dart';

@LazySingleton(as: AppRepository)
class GithubAppRepository implements AppRepository {
  const GithubAppRepository(this.dio);
  final Dio dio;
  @override
  Future<Either<ApplicationError, TokenResponse>> authenticate(
    DeviceAuth deviceAuth,
  ) async {
    try {
      final Response<String> response = await dio.post(
        'https://github.com/login/oauth/access_token',
        queryParameters: {
          'client_id': AppConstants.githubClientId,
          'device_code': deviceAuth.deviceCode,
          'grant_type': 'urn:ietf:params:oauth:grant-type:device_code',
        },
      );

      final TokenResponse tokenResponse =
          TokenResponse.fromString(response.data!);

      await $secureStorage.saveToDisk(
        'access_token',
        tokenResponse.accessToken,
      );
      await $secureStorage.saveToDisk('scope', tokenResponse.scope);
      await $secureStorage.saveToDisk('token_type', tokenResponse.tokenType);
      await $secureStorage.saveToDisk(
        'expires_in',
        tokenResponse.expiresIn.toString(),
      );
      await $secureStorage.saveToDisk(
        'refresh_token',
        tokenResponse.refreshToken,
      );
      await $secureStorage.saveToDisk(
        'refresh_token_expires_in',
        tokenResponse.refreshTokenExpiresIn.toString(),
      );

      return Right(tokenResponse);
    } on DioException catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      unawaited(Sentry.captureException(e, stackTrace: s));
      return Left(dioErrorToApplicationError(e));
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      unawaited(Sentry.captureException(e, stackTrace: s));
      return Left(ApplicationError.unknownError());
    }
  }

  @override
  Future<Either<ApplicationError, bool>> isAuthenticated() {
    // TODO: implement isAuthenticated
    throw UnimplementedError();
  }

  @override
  Future<Either<ApplicationError, DeviceAuth>> getDeviceAuth() async {
    try {
      final Response<String> response = await dio.post(
        'https://github.com/login/device/code?client_id=${AppConstants.githubClientId}&scope=repo,user',
      );
      return Right(DeviceAuth.fromString(response.data!));
    } on DioException catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      unawaited(Sentry.captureException(e, stackTrace: s));
      return Left(dioErrorToApplicationError(e));
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      unawaited(Sentry.captureException(e, stackTrace: s));
      return Left(ApplicationError.unknownError());
    }
  }

  @override
  Future<Either<ApplicationError, void>> checkForRepository() async {
    try {
      final String? token = await $secureStorage.getFromDisk('access_token');

      final Response<List<dynamic>> response = await dio.get(
        'https://api.github.com/user/repos',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      bool hasOurRepository = false;

      if (response.data!.isEmpty) {
        hasOurRepository = false;
      }

      // check if the user has a repository named 'repopix'
      final bool hasRepository = response.data!.any(
        (element) =>
            (element as Map<String, dynamic>)['name'] ==
            AppConstants.repositoryName,
      );

      if (hasRepository) {
        hasOurRepository = true;
      }

      if (!hasOurRepository) {
        // create the repository
        final Either<ApplicationError, void> response =
            await createRepository();
        if (response.isLeft()) {
          return response;
        }
      }

      return const Right(null);
    } on DioException catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      unawaited(Sentry.captureException(e, stackTrace: s));
      return Left(dioErrorToApplicationError(e));
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      unawaited(Sentry.captureException(e, stackTrace: s));
      return Left(ApplicationError.unknownError());
    }
  }

  @override
  Future<Either<ApplicationError, void>> createRepository() async {
    try {
      final String? token = await $secureStorage.getFromDisk('access_token');
      final Response<dynamic> _ = await dio.post(
        'https://api.github.com/user/repos',
        data: {
          'name': AppConstants.repositoryName,
          'private': true,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return const Right(null);
    } on DioException catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      unawaited(Sentry.captureException(e, stackTrace: s));
      return Left(dioErrorToApplicationError(e));
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      unawaited(Sentry.captureException(e, stackTrace: s));
      return Left(ApplicationError.unknownError());
    }
  }

  @override
  Future<Either<ApplicationError, void>> uploadTestImage() async {
    try {
      // todo: implement image upload
      return const Right(null);
    } on DioException catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      unawaited(Sentry.captureException(e, stackTrace: s));
      return Left(dioErrorToApplicationError(e));
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      unawaited(Sentry.captureException(e, stackTrace: s));
      return Left(ApplicationError.unknownError());
    }
  }
}
