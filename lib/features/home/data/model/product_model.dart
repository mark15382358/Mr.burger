import 'package:mr_burger/features/home/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
    required super.rating,
    required super.price,
    super.isFavorite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      rating: json['rating'].toString(),
      price: double.parse(json['price'].toString()), 
      isFavorite: json['is_favorite'] ?? false, 
    );
  }
}