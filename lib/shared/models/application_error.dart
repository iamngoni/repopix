//
//  repopix
//  application_error
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

class ApplicationError implements Exception {
  ApplicationError(
    this.message, {
    this.title = "Hey, it's not your fault",
  });

  factory ApplicationError.unknownError() => ApplicationError(
        'An unknown error occurred',
      );

  final String message;
  final String title;
}
