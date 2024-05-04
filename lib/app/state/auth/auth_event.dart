part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

class InitiateAuthEvent extends AuthEvent {
  const InitiateAuthEvent();
  @override
  List<Object> get props => [];
}

class AuthenticateEvent extends AuthEvent {
  const AuthenticateEvent(this.deviceAuth);
  final DeviceAuth deviceAuth;
  @override
  List<Object> get props => [deviceAuth];
}
