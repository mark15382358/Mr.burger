import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String token;
  final String name;
  final String email;
  final String image;

  const UserEntity({
    required this.token,
    required this.email,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [token, name, email, image];
}
