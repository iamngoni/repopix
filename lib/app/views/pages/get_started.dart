//
//  repopix
//  get_started
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../l10n/l10n.dart';
import '../../../shared/configs/colors.dart';
import '../../../shared/widgets/sj_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          backgroundColor: AppColors.blue,
          body: Container(
            height: context.height,
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: sx(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage('assets/images/black.png'),
                  height: sy(200),
                ),
                SizedBox(
                  height: sy(20),
                ),
                Text(
                  context.l10n.getStarted_Title('RepoPix'),
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: sy(20),
                  ),
                ),
                Text(
                  context.l10n.getStarted_Subtitle,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(9),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: sy(30),
                ),
                SjButton(
                  text: 'Continue',
                  backgroundColor: AppColors.white,
                  color: AppColors.blue,
                  onTap: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
