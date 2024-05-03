//
//  repopix
//  context
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';

import '../utils/toasts.dart';

extension ContextExtensions<T> on BuildContext {
  Future<T?> goTo({required Widget page}) => Navigator.of(this).push(
        MaterialPageRoute(builder: (_) => page),
      );

  Future<T?> goToAndReplace({required Widget page}) =>
      Navigator.of(this).pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );

  Future<T?> goToAndRemoveUntil({required Widget page}) =>
      Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => page),
        (route) => false,
      );

  void goBack({dynamic value}) => Navigator.of(this).pop(value);

  // notify
  void notify(String message, {bool isError = false, String? title}) => isError
      ? Toasts.showError(title ?? 'Attention Needed', message, this)
      : Toasts.showSuccess(title ?? 'Success!', message, this);
}
