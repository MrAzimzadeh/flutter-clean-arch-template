import 'package:cleanarcjh/src/features/user/domein/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.id,
    super.age,
    super.email,
    super.firstName,
    super.lastName,
    super.image,
    super.gender,
    super.maidenName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      age: json['age'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['image'],
      gender: json['gender'],
      maidenName: json['maidenName'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'age': age,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'image': image,
      'gender': gender,
      'maidenName': maidenName,
    };
  }
}
