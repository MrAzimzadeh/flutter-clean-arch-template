part of 'auth_login_form_bloc.dart';

sealed class AuthLoginFormState extends Equatable {
  final String userName;
  final String password;
  final bool isValid;
  const AuthLoginFormState({
    required this.userName,
    required this.password,
    required this.isValid,
  });
  @override
  List<Object?> get props => [userName, password, isValid];
}

class LoginFormInitialState extends AuthLoginFormState {
  const LoginFormInitialState()
    : super(userName: "", password: "", isValid: false);
}

class LoginFormDataState extends AuthLoginFormState {
  final String inputUserName;
  final String inputPassword;
  final bool inputIsValid;
  const LoginFormDataState({
    required this.inputUserName,
    required this.inputPassword,
    required this.inputIsValid,
  }) : super(
         userName: inputUserName,
         password: inputPassword,
         isValid: inputIsValid,
       );
  @override
  List<Object?> get props => [inputUserName, inputPassword, inputIsValid];
}
