//
//  repopix
//  sj_no_label_dropdown_button
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';

class SjNoLabelDropdownButton<T> extends StatelessWidget {
  const SjNoLabelDropdownButton({
    required this.hint,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
    this.labelColor = AppColors.black,
    super.key,
  });

  final T? value;
  final List<T> items;
  final String hint;
  final String? Function(T?)? validator;
  final void Function(T?) onChanged;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          width: context.width,
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: AppColors.blue.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonFormField<T>(
            isExpanded: true,
            value: value,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
                fontSize: sy(9),
              ),
              border: InputBorder.none,
            ),
            items: items.map((T e) {
              return DropdownMenuItem<T>(
                value: e,
                child: Text(
                  e.toString(),
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(9),
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
            selectedItemBuilder: (BuildContext context) {
              return items.map<Widget>((T item) {
                return Text(
                  item.toString(),
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(9),
                  ),
                );
              }).toList();
            },
            icon: Icon(
              CupertinoIcons.chevron_down,
              color: AppColors.black,
              size: sy(12),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
          ),
        );
      },
    );
  }
}
