import 'package:mr_burger/features/product/domain/entity/option_entity.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  final List<OptionEntity> toppings;
  final List<OptionEntity> sideOptions;
  final double sliderValue;
  final List<int> selectedToppings; 
  final List<int> selectedSides;

  ProductDetailsSuccess({
  this.selectedToppings = const [],
  this.selectedSides = const [],  
    required this.toppings,
    required this.sideOptions,
    this.sliderValue = 0.7, 
  });

  ProductDetailsSuccess copyWith({
    List<OptionEntity>? toppings,
    List<OptionEntity>? sideOptions,
    List<int>? selectedToppings,
    List<int>? selectedSides,
    double? sliderValue,
  }) {
    return ProductDetailsSuccess(
      selectedSides: selectedSides ?? this.selectedSides,
      selectedToppings: selectedToppings ?? this.selectedToppings,
      toppings: toppings ?? this.toppings,
      sideOptions: sideOptions ?? this.sideOptions,
      sliderValue: sliderValue ?? this.sliderValue,
    );
  }
}

class ProductDetailsError extends ProductDetailsState {
  final String message;
  ProductDetailsError(this.message);
}