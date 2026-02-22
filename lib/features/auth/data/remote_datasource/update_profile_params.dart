import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

class UpdateProfileParams extends Equatable {
  final String name;
  final String email;
  final File? image;
  final String? address;
  final String? visa;

  const UpdateProfileParams({
    required this.name,
    required this.email,
    this.image,
    this.address,
    this.visa,
  });

  Future<Map<String, dynamic>> toMap() async {
    final Map<String, dynamic> data = {
      "name": name,
      "email": email,
      if (address != null) "address": address,
      if (visa != null) "Visa": visa,
    };

    if (image != null) {
      data["image"] = await MultipartFile.fromFile(
        image!.path,
        filename: image!.path.split('/').last,
      );
    }

    return data;
  }

  @override
  List<Object?> get props => [name, email, image, address, visa];
}
