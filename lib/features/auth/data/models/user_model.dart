import 'package:mr_burger/features/auth/domain/entity/user_entities.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.token,
    required super.email,
    required super.name,
    required super.image,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    final userData = json['data'] as Map<String, dynamic>;
    return UserModel(
      token: userData['token']??"",
      email: userData['email']??"",
      name: userData['name']??"",
      image: userData['image']??"",
    );
  }
}
