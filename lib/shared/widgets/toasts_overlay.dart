//
//  repopix
//  toasts_overlay
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';

class ToastsOverlay extends StatefulWidget {
  const ToastsOverlay({
    required this.title,
    required this.message,
    required this.backgroundColor,
    super.key,
  });

  final String title;
  final String message;
  final Color backgroundColor;

  @override
  State<ToastsOverlay> createState() => _ToastsOverlayState();
}

class _ToastsOverlayState extends State<ToastsOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _animation = Tween(begin: 1.0, end: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Positioned(
        top: sy(40),
        left: sx(20),
        right: sx(20),
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: sx(20),
              vertical: sy(5),
            ),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.white.withOpacity(0.5),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.white.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: sy(8),
                      ),
                    ),
                    SizedBox(
                      height: sy(12),
                      width: sy(12),
                      child: Stack(
                        children: [
                          CircularProgressIndicator(
                            value: _animation.value,
                            backgroundColor: Colors.white.withOpacity(0.5),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.white,
                            ),
                            strokeCap: StrokeCap.round,
                          ),
                          Center(
                            child: Icon(
                              Icons.close,
                              color: AppColors.white,
                              size: sy(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: sy(2),
                ),
                Text(
                  widget.message,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(8),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
