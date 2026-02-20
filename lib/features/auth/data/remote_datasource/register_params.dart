import 'dart:io';
import 'package:equatable/equatable.dart';
class RegisterParams extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String password;
  final File? image;

  const RegisterParams({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.image,
  });

  @override
  List<Object?> get props => [name, email, phone, password, image];
}
