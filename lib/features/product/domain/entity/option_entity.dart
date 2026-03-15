import 'package:equatable/equatable.dart';

class OptionEntity extends Equatable {
  final int id;
  final String name;
  final String image;

  const OptionEntity({
    required this.id, 
    required this.name, 
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];
}