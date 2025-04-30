import 'package:cleanarcjh/src/features/user/domein/entity/user_entity.dart';
import 'package:equatable/equatable.dart';

class AuthEntity extends UserEntity {
  final String? accessToken;
  final String? refreshToken;
  final String? password;
  final int? expiresInMins;
  
  const AuthEntity({
    this.accessToken,
    this.refreshToken,
    this.password,
    this.expiresInMins,
    super.username,
    super.email,
    super.firstName,
    super.gender,
    super.id,
    super.image,
    super.lastName,
  });

  @override
  List<Object?> get props => [email, accessToken, refreshToken, password];

  /// Login Json

  /// Register Json
}
