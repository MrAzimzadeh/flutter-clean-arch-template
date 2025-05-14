import 'package:cleanarcjh/src/features/auth/domain/entities/auth_entity.dart';

class RefreshAccesstokenModel extends AuthEntity {
  const RefreshAccesstokenModel({super.accessToken, super.refreshToken});

  factory RefreshAccesstokenModel.fromJson(Map<String, dynamic> json) =>
      RefreshAccesstokenModel(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  @override
  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };

  @override
  List<Object?> get props => [
    accessToken,
    refreshToken,
  ];
}
