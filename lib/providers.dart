//
//  repopix
//  providers
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection.dart';
import 'shared/state/connectivity_status/connectivity_status_bloc.dart';
import 'shared/state/locale/locale_bloc.dart';

List<BlocProvider> providers = [
  BlocProvider<LocaleBloc>(
    create: (_) => getIt<LocaleBloc>()..add(const LoadLocale()),
  ),
  BlocProvider<ConnectivityStatusBloc>(
    create: (_) => getIt<ConnectivityStatusBloc>(),
  ),
];
