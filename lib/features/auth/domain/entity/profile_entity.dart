import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String name;
  final String email;
  final String image;
  final String message;
  final String? address;
  final String? visa;

  const ProfileEntity({
    required this.message,
    required this.name,
    required this.email,
    required this.image,
    this.address,
    this.visa,
  });

  @override
  List<Object?> get props => [name, email, image, address, visa,message];
}
