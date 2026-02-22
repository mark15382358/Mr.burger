import 'package:mr_burger/features/auth/domain/entity/profile_entity.dart'; // تأكد من المسار

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.name,
    required super.email,
    required super.image,
    required super.message,
    super.address,
    super.visa,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      message: json['message'] ?? "",
      name: json['data']['name'] ?? "",
      email: json['data']['email'] ?? "",
      image: json['data']['image'] ?? "",
      address: json['data']['address'] ?? "",
      visa: json['data']['Visa'] ?? "",
    );
  }
}
