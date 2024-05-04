// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:repopix/app/models/repos/abs/app_repository.dart' as _i9;
import 'package:repopix/app/models/repos/impl/github_app_repository.dart'
    as _i10;
import 'package:repopix/app/state/auth/auth_bloc.dart' as _i12;
import 'package:repopix/app/state/gallery/gallery_bloc.dart' as _i13;
import 'package:repopix/app/state/navigation/navigation_bloc.dart' as _i5;
import 'package:repopix/shared/services/notifications.dart' as _i8;
import 'package:repopix/shared/services/secure_storage.dart' as _i7;
import 'package:repopix/shared/services/storage.dart' as _i6;
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
    gh.factory<_i5.NavigationBloc>(() => _i5.NavigationBloc());
    gh.singletonAsync<_i6.StorageService>(
        () => _i6.StorageService.getInstance());
    gh.singletonAsync<_i7.SecureStorageService>(
        () => _i7.SecureStorageService.getInstance());
    gh.singleton<_i8.PushNotifications>(() => _i8.PushNotifications());
    gh.lazySingleton<_i9.AppRepository>(
        () => _i10.GithubAppRepository(gh<_i11.Dio>()));
    gh.factory<_i12.AuthBloc>(
        () => _i12.AuthBloc(repository: gh<_i9.AppRepository>()));
    gh.factory<_i13.GalleryBloc>(
        () => _i13.GalleryBloc(repository: gh<_i9.AppRepository>()));
    return this;
  }
}
