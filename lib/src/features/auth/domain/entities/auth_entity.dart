import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? email;
  /// Todo Buna Ne EHTIYAC Var
  final String? accessToken;
  final String? refreshToken;
  final String? password;
  const AuthEntity({
    this.email,
    this.accessToken,
    this.refreshToken,
    this.password,
  });

  @override
  List<Object?> get props => [email, accessToken, refreshToken, password];
}
