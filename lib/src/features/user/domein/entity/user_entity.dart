import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;
  final String? maidenName;
  final int? age;

  const UserEntity({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.maidenName,
    this.age,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: json["gender"],
    image: json["image"],
    maidenName: json["maidenName"],
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
    "image": image,
  };

  @override
  List<Object?> get props => [id, email];
}
