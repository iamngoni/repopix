//
//  repopix
//  device_offline_page
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../l10n/l10n.dart';
import '../configs/colors.dart';
import '../state/connectivity_status/connectivity_status_bloc.dart';
import 'language_selector.dart';
import 'sj_button.dart';

class DeviceOfflinePage extends StatelessWidget {
  const DeviceOfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          backgroundColor: AppColors.blue,
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  padding: EdgeInsets.symmetric(
                    horizontal: sx(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Platform.isAndroid
                            ? Icons.wifi_off_rounded
                            : CupertinoIcons.wifi_slash,
                        color: Colors.white,
                        size: sy(30),
                      ),
                      SizedBox(
                        height: sy(20),
                      ),
                      Text(
                        context.l10n.deviceOffline_Title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: sy(12),
                        ),
                      ),
                      SizedBox(
                        height: sy(3),
                      ),
                      Text(
                        context.l10n.deviceOffline_Message,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(10),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: sy(20),
                      ),
                      SjButton(
                        text: context.l10n.deviceOffline_BtnTitle,
                        backgroundColor: AppColors.white,
                        color: AppColors.blue,
                        onTap: () {
                          context
                              .read<ConnectivityStatusBloc>()
                              .add(CheckConnection());
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: sx(20),
                  bottom: sy(10),
                  child: const LanguageSelector(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
