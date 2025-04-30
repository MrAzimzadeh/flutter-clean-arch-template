import 'package:cleanarcjh/src/features/auth/domain/entities/auth_entity.dart';

class LoginRepsonseModel extends AuthEntity{

    const LoginRepsonseModel({
        super.accessToken,
        super.refreshToken,
        super.id,
        super.username,
        super.email,
        super.firstName,
        super.lastName,
        super.gender,
        super.image,
    });

    factory LoginRepsonseModel.fromJson(Map<String, dynamic> json) => LoginRepsonseModel(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        image: json["image"],
    );

    @override
      Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
    };
}
