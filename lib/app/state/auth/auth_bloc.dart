import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../shared/models/application_error.dart';
import '../../models/data/device_auth.dart';
import '../../models/data/token_response.dart';
import '../../models/repos/abs/app_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repository}) : super(const AuthInitial()) {
    on<InitiateAuthEvent>(onInitiateAuth);
    on<AuthenticateEvent>(onAuthenticate);
  }

  Future<void> onInitiateAuth(
    InitiateAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final Either<ApplicationError, DeviceAuth> response =
          await repository.getDeviceAuth();
      response.fold(
        (l) => emit(AuthError(l)),
        (r) => emit(AuthInitiated(r)),
      );
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      unawaited(Sentry.captureException(e, stackTrace: s));
      emit(AuthError(ApplicationError.unknownError()));
    }
  }

  Future<void> onAuthenticate(
    AuthenticateEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final Either<ApplicationError, TokenResponse> response =
          await repository.authenticate(event.deviceAuth);
      response.fold(
        (l) => emit(AuthError(l)),
        (r) => emit(AuthSuccess(r)),
      );
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      unawaited(Sentry.captureException(e, stackTrace: s));
      emit(AuthError(ApplicationError.unknownError()));
    }
  }

  final AppRepository repository;
}
