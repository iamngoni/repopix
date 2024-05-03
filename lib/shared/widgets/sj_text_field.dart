//
//  repopix
//  sj_text_field
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';

class SjTextField extends StatelessWidget {
  const SjTextField({
    required this.controller,
    required this.hint,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.maxLines = 1,
    this.backgroundColor = AppColors.altBackground,
    this.borderRadius = 5,
    super.key,
  });

  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool readOnly;
  final int maxLines;
  final Color backgroundColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: TextFormField(
            style: TextStyle(
              color: AppColors.blue,
              fontWeight: FontWeight.w500,
              fontSize: sy(9),
            ),
            controller: controller,
            decoration: InputDecoration(
              labelText: hint,
              labelStyle: TextStyle(
                color: AppColors.blue,
                fontWeight: FontWeight.w400,
                fontSize: sy(8),
              ),
              hintText: hint,
              hintStyle: TextStyle(
                color: AppColors.blue,
                fontWeight: FontWeight.w400,
                fontSize: sy(9),
              ),
              border: InputBorder.none,
            ),
            keyboardType: keyboardType,
            readOnly: readOnly,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            maxLines: maxLines,
          ),
        );
      },
    );
  }
}
