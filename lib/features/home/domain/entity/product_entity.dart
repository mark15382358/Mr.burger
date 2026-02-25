import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  final double price;
  final bool isFavorite;
  final String description;
  final String rating;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.isFavorite = false,
    required this.description,
    required this.rating,
  });

  ProductEntity copyWith({bool? isFavorite}) {
    return ProductEntity(
      description: description,
      rating: rating,
      id: id,
      name: name,
      image: image,
      price: price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    image,
    price,
    isFavorite,
    description,
    rating,
  ];
}
