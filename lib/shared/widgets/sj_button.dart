//
//  repopix
//  sj_button
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';

class SjButton extends StatelessWidget {
  const SjButton({
    required this.text,
    this.onTap,
    this.color = AppColors.white,
    this.backgroundColor = AppColors.blue,
    this.borderRadius = 10,
    this.verticalPadding = 7,
    this.icon = Icons.arrow_forward,
    super.key,
  });

  final String text;
  final VoidCallback? onTap;
  final Color color;
  final Color backgroundColor;
  final double borderRadius;
  final double verticalPadding;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: sx(20),
              vertical: sy(verticalPadding),
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w500,
                    fontSize: sy(9),
                  ),
                ),
                Icon(
                  icon,
                  color: color,
                  size: sy(12),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
