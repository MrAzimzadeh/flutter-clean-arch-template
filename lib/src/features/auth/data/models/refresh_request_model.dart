import 'package:cleanarcjh/src/features/auth/domain/entities/auth_entity.dart';

class RefreshRequestModel extends AuthEntity {
  
  const RefreshRequestModel({
    required super.refreshToken,
    super.expiresInMins = 30,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'refreshToken': refreshToken,
      'expiresInMins': expiresInMins,
    };
  }

  factory RefreshRequestModel.fromJson(Map<String, dynamic> json) {
    return RefreshRequestModel(
      refreshToken: json['refresh_token'] as String,
      expiresInMins: json['expires_in_mins'] as int?,
    );
  }
  
}