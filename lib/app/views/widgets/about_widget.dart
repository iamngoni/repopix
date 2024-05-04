//
//  repopix
//  about_widget
//
//  Created by Ngonidzashe Mangudya on 04/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../shared/configs/colors.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
            vertical: sy(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'RepoPix',
                style: TextStyle(
                  color: AppColors.blue,
                  fontWeight: FontWeight.w900,
                  fontSize: sy(20),
                ),
              ),
              SizedBox(
                height: sy(5),
              ),
              Text(
                'Pet project to showcase your Flutter skills and just find'
                ' something to do with your free time (when bored). It is a'
                ' gallery app that allows you to view and images on a Github'
                ' repository.',
                style: TextStyle(
                  color: AppColors.blue,
                  fontWeight: FontWeight.w400,
                  fontSize: sy(10),
                ),
              ),
              SizedBox(
                height: sy(10),
              ),
              Text(
                'Contributors',
                style: TextStyle(
                  color: AppColors.blue,
                  fontWeight: FontWeight.w900,
                  fontSize: sy(20),
                ),
              ),
              SizedBox(
                height: sy(5),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Ngonidzashe Mangudya',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w700,
                          fontSize: sy(12),
                        ),
                      ),
                      subtitle: Text(
                        'Github: iamngoni',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
