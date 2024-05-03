// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:repopix/shared/services/notifications.dart' as _i7;
import 'package:repopix/shared/services/secure_storage.dart' as _i6;
import 'package:repopix/shared/services/storage.dart' as _i5;
import 'package:repopix/shared/state/connectivity_status/connectivity_status_bloc.dart'
    as _i4;
import 'package:repopix/shared/state/locale/locale_bloc.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.LocaleBloc>(() => _i3.LocaleBloc());
    gh.factory<_i4.ConnectivityStatusBloc>(() => _i4.ConnectivityStatusBloc());
    gh.singletonAsync<_i5.StorageService>(
        () => _i5.StorageService.getInstance());
    gh.singletonAsync<_i6.SecureStorageService>(
        () => _i6.SecureStorageService.getInstance());
    gh.singleton<_i7.PushNotifications>(() => _i7.PushNotifications());
    return this;
  }
}
