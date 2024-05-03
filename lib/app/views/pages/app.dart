//
//  repopix
//  app
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/l10n.dart';
import '../../../shared/configs/colors.dart';
import '../../../shared/configs/theme.dart';
import '../../../shared/models/language.dart';
import '../../../shared/state/connectivity_status/connectivity_status_bloc.dart';
import '../../../shared/state/locale/locale_bloc.dart';
import '../../../shared/utils/keyboard.dart';
import '../../../shared/widgets/device_offline_page.dart';
import '../../../shared/widgets/loader.dart';
import 'get_started.dart';

class RepoPixApp extends StatelessWidget {
  const RepoPixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, Language>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Shakesphere',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(state.code),
          builder: (context, child) {
            return GestureDetector(
              onTap: () {
                dismissKeyboard(context);
              },
              child: child,
            );
          },
          home: BlocBuilder<ConnectivityStatusBloc, ConnectivityStatusState>(
            builder: (context, state) {
              return switch (state.runtimeType) {
                Idle => const ColoredBox(
                    color: AppColors.blue,
                    child: Center(
                      child: LoaderWidget(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                Offline => const DeviceOfflinePage(),
                Connected => const GetStartedPage(),
                Type() => const SizedBox.shrink(),
              };
            },
          ),
        );
      },
    );
  }
}
