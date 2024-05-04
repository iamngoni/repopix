//
//  repopix
//  github_device_auth_widget
//
//  Created by Ngonidzashe Mangudya on 04/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../l10n/l10n.dart';
import '../../../shared/configs/colors.dart';
import '../../../shared/extensions/context.dart';
import '../../../shared/widgets/sj_button.dart';
import '../../models/data/device_auth.dart';

class GithubDeviceAuthWidget extends StatelessWidget {
  const GithubDeviceAuthWidget({required this.deviceAuth, super.key});

  final DeviceAuth deviceAuth;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          height: context.height,
          width: context.width,
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
            vertical: sy(10),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      context.l10n.getStarted_DeviceAuthorization,
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: sy(10),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.goBack(value: false);
                    },
                    child: Container(
                      height: sy(20),
                      width: sy(20),
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.close,
                          color: AppColors.white,
                          size: sy(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sy(10),
              ),
              SizedBox(
                height: sy(30),
                width: context.width,
                child: Row(
                  children: deviceAuth.userCode.split('').map((e) {
                    return Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.blue.withOpacity(0.1),
                          border: Border.all(
                            color: AppColors.blue,
                            width: 0.5,
                          ),
                          // only right and left borders on first item and last item
                          borderRadius: BorderRadius.only(
                            topLeft: deviceAuth.userCode.indexOf(e) == 0
                                ? const Radius.circular(5)
                                : Radius.zero,
                            bottomLeft: deviceAuth.userCode.indexOf(e) == 0
                                ? const Radius.circular(5)
                                : Radius.zero,
                            topRight: deviceAuth.userCode.indexOf(e) ==
                                    deviceAuth.userCode.length - 1
                                ? const Radius.circular(5)
                                : Radius.zero,
                            bottomRight: deviceAuth.userCode.indexOf(e) ==
                                    deviceAuth.userCode.length - 1
                                ? const Radius.circular(5)
                                : Radius.zero,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            e,
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: sy(10),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: sy(10),
              ),
              Text(
                context.l10n.getStarted_DeviceAuthorizationExpiry(
                  '${deviceAuth.expiresIn.seconds.inMinutes}',
                ),
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: sy(10),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: sy(10),
              ),
              SjButton(
                text: context.l10n.getStarted_ContinueBtnTitle,
                onTap: () async {
                  try {
                    await Clipboard.setData(
                      ClipboardData(text: deviceAuth.userCode),
                    );
                    context.goBack(value: true);
                  } catch (_) {
                    context.goBack(value: false);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
