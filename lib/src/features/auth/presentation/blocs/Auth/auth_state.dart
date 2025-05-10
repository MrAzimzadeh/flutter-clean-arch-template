part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoginInitialState extends AuthState {}

final class AuthLoginLoadingState extends AuthState {}

final class AuthLoginSuccesstate extends AuthState {
  final UserEntity userEntity;
  const AuthLoginSuccesstate(this.userEntity);
}

final class AuthLoginFailurstate extends AuthState {
  final String? message;

  const AuthLoginFailurstate(this.message);
}

/// Auth Check
class AuthCheckSignInStatusSuccessState extends AuthState {}

class AuthCheckSignInStatusFailureState extends AuthState {}

/// Login
