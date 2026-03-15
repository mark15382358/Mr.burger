
import 'package:mr_burger/features/product/domain/entity/option_entity.dart';

class OptionModel extends OptionEntity {
  const OptionModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}