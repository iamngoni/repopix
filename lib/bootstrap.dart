import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'injection.dart';
import 'providers.dart';
import 'shared/configs/constants.dart';
import 'shared/utils/globals.dart';
import 'shared/utils/values.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    log('Setting immersive sticky mode for Android ✅');
  }

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  log('Setting preferred orientations ✅');

  configureInjection();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
    Sentry.captureException(details.exception, stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await $notifications.init();

  if ($storage.getFromDisk('first_time') == null) {
    final String title = $welcomeTitles.randomItem();
    final String body = $welcomeBodies.randomItem();
    await $notifications.showNotification(title, body);
    $storage.saveToDisk('first_time', true);
  }

  await SentryFlutter.init(
    (options) {
      options
        ..dsn = AppConstants.sentryDsn
        ..tracesSampleRate = 1.0;
    },
    appRunner: () async => runApp(
      MultiBlocProvider(
        providers: providers,
        child: SentryScreenshotWidget(
          child: await builder(),
        ),
      ),
    ),
  );
}
