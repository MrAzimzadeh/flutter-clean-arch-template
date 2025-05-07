part of 'auth_login_form_bloc.dart';

sealed class AuthLoginFormEvent extends Equatable {
  const AuthLoginFormEvent();

  @override
  List<Object> get props => [];
}

class LoginFormUsernameChangedEvent extends AuthLoginFormEvent {
  final String username;

  const LoginFormUsernameChangedEvent(this.username);

  @override
  List<Object> get props => [username];
}

class LoginFormPasswordChangedEvent extends AuthLoginFormEvent {
  final String password;

  const LoginFormPasswordChangedEvent(this.password);

  @override
  List<Object> get props => [password];
}
