//
//  repopix
//  theme
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: AppColors.materialBlue,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'NunitoSans',
      );
}
