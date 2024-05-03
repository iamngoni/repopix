//
//  repopix
//  sj_sensitive_text_field
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';

class SjSensitiveTextField extends StatefulWidget {
  const SjSensitiveTextField({
    required this.controller,
    required this.hint,
    this.readOnly = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.backgroundColor = AppColors.altBackground,
    super.key,
  });

  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final bool readOnly;
  final TextInputType keyboardType;
  final Color backgroundColor;

  @override
  State<SjSensitiveTextField> createState() => _SjSensitiveTextFieldState();
}

class _SjSensitiveTextFieldState extends State<SjSensitiveTextField> {
  bool obscureText = true;

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
          ),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: widget.controller,
            style: TextStyle(
              color: AppColors.blue,
              fontWeight: FontWeight.w500,
              fontSize: sy(9),
            ),
            decoration: InputDecoration(
              labelText: widget.hint,
              labelStyle: TextStyle(
                color: AppColors.blue,
                fontWeight: FontWeight.w400,
                fontSize: sy(8),
              ),
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: AppColors.blue,
                fontWeight: FontWeight.w400,
                fontSize: sy(9),
              ),
              border: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: toggleObscureText,
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.blue,
                ),
              ),
            ),
            obscureText: widget.readOnly || obscureText,
            keyboardType: widget.keyboardType,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            readOnly: widget.readOnly,
          ),
        );
      },
    );
  }
}
