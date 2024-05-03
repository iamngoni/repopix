//
//  repopix
//  toasts
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';

import '../configs/colors.dart';
import '../widgets/toasts_overlay.dart';

class Toasts {
  static void showSuccess(String title, String message, BuildContext context) {
    _show(title, message, AppColors.blue, context);
  }

  static void showError(String title, String message, BuildContext context) {
    _show(title, message, AppColors.red, context);
  }

  static void _show(
    String title,
    String message,
    Color backgroundColor,
    BuildContext context,
  ) {
    final OverlayState overlayState = Overlay.of(context);

    final overlayEntry = OverlayEntry(
      builder: (context) => ToastsOverlay(
        title: title,
        message: message,
        backgroundColor: backgroundColor,
      ),
    );

    overlayState.insert(overlayEntry);

    Future.delayed(5.seconds, overlayEntry.remove);
  }
}
