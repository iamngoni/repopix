part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  const AuthInitial();
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  const AuthLoading();
  @override
  List<Object> get props => [];
}

class AuthInitiated extends AuthState {
  const AuthInitiated(this.deviceAuth);
  final DeviceAuth deviceAuth;
  @override
  List<Object> get props => [deviceAuth];
}

class AuthSuccess extends AuthState {
  const AuthSuccess(this.token);
  final TokenResponse token;
  @override
  List<Object> get props => [token];
}

class AuthError extends AuthState {
  const AuthError(this.error);
  final ApplicationError error;
  @override
  List<Object> get props => [error];
}
