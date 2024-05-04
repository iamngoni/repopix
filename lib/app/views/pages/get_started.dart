//
//  repopix
//  get_started
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../l10n/l10n.dart';
import '../../../shared/configs/colors.dart';
import '../../../shared/extensions/context.dart';
import '../../../shared/utils/modal.dart';
import '../../../shared/widgets/loader.dart';
import '../../../shared/widgets/sj_button.dart';
import '../../state/auth/auth_bloc.dart';
import '../widgets/github_auth_webview_widget.dart';
import '../widgets/github_device_auth_widget.dart';
import 'gallery.dart';

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
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) async {
                if (state is AuthError) {
                  context.notify(
                    state.error.message,
                    isError: true,
                  );
                }

                if (state is AuthInitiated) {
                  final response = await $showModal(
                    context,
                    maxHeight: sy(170),
                    isDismissible: false,
                    child: GithubDeviceAuthWidget(
                      deviceAuth: state.deviceAuth,
                    ),
                  );

                  log('Response: $response');

                  if (response != null && response == true) {
                    log('User has authorization code. Redirecting to GitHub.');
                    final authResponse = await $showModal(
                      context,
                      child: const GithubAuthWebviewWidget(),
                    );

                    log('Auth Response: $authResponse');

                    if (authResponse != null && authResponse == true) {
                      log('Authenticating');
                      context.read<AuthBloc>().add(
                            AuthenticateEvent(state.deviceAuth),
                          );
                    } else {
                      context.notify(
                        context.l10n.getStarted_AuthorizationFailed,
                        isError: true,
                      );
                    }
                  }
                }

                if (state is AuthSuccess) {
                  context.notify(context.l10n.getStarted_AuthorizationSuccess);
                  await context.goTo(page: const GalleryPage());
                }
              },
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
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const Center(
                          child: LoaderWidget(
                            color: AppColors.white,
                          ),
                        );
                      }

                      return SjButton(
                        text: 'Continue',
                        backgroundColor: AppColors.white,
                        color: AppColors.blue,
                        onTap: () {
                          context
                              .read<AuthBloc>()
                              .add(const InitiateAuthEvent());
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
