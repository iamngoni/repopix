//
//  repopix
//  github_app_repository
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/models/application_error.dart';
import '../../data/token_response.dart';
import '../abs/app_repository.dart';

@LazySingleton(as: AppRepository)
class GithubAppRepository implements AppRepository {
  @override
  Future<Either<ApplicationError, TokenResponse>> authenticate() {
    // TODO: implement authenticate
    throw UnimplementedError();
  }

  @override
  Future<Either<ApplicationError, bool>> isAuthenticated() {
    // TODO: implement isAuthenticated
    throw UnimplementedError();
  }
}
