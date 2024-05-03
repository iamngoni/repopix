//
//  repopix
//  keyboard
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';

void dismissKeyboard(BuildContext context) {
  if (MediaQuery.of(context).viewInsets.bottom > 0) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
