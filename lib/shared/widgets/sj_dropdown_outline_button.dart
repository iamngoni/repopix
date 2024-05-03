//
//  repopix
//  sj_dropdown_outline_button
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';

class SjDropdownOutlineButton<T> extends StatelessWidget {
  const SjDropdownOutlineButton({
    required this.label,
    required this.hint,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
    this.borderRadius = 0,
    this.readOnly = false,
    super.key,
  });

  final T? value;
  final List<T> items;
  final String label;
  final String hint;
  final String? Function(T?)? validator;
  final void Function(T?) onChanged;
  final double borderRadius;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w400,
                fontSize: sy(10),
              ),
            ),
            SizedBox(
              height: sy(5),
            ),
            Container(
              width: context.width,
              padding: EdgeInsets.symmetric(
                horizontal: sx(20),
                vertical: sy(3),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grey,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
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
                onChanged: readOnly ? null : onChanged,
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
            ),
          ],
        );
      },
    );
  }
}
