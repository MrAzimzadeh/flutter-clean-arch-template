import 'package:cleanarcjh/src/features/auth/domain/entities/auth_entity.dart';

class LoginRequestModel extends AuthEntity {
  const LoginRequestModel({
    super.username,
    super.password,
    super.expiresInMins,
  });

  /// To Json
  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        username: json["username"],
        password: json["password"],
        expiresInMins: json["expiresInMins"],
      );

  @override
  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "expiresInMins": expiresInMins,
  };
}
