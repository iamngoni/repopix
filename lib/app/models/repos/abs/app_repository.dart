//
//  repopix
//  app_repository
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:dartz/dartz.dart';

import '../../../../shared/models/application_error.dart';
import '../../data/token_response.dart';

abstract class AppRepository {
  /// [bool]: Check if the user is authenticated
  Future<Either<ApplicationError, bool>> isAuthenticated();

  /// [TokenResponse]: Authenticate the user and return a token
  Future<Either<ApplicationError, TokenResponse>> authenticate();
}
