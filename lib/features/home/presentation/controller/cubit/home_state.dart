import 'package:equatable/equatable.dart';
import 'package:mr_burger/core/utils/enums.dart';
import 'package:mr_burger/features/home/domain/entity/category_entity.dart';
import 'package:mr_burger/features/home/domain/entity/product_entity.dart';

class HomeState extends Equatable {
  final List<CategoryEntity> categories;
  final List<ProductEntity> products;
  final List<ProductEntity> favorites;
  final int? selectedCategoryId;
  final HomeStatus status;
  final String? errorMessage;

  const HomeState({
    this.categories = const [],
    this.products = const [],
    this.favorites = const [],
    this.status = HomeStatus.initial,
    this.errorMessage,
    this.selectedCategoryId,
  });

  HomeState copyWith({
    List<CategoryEntity>? categories,
    List<ProductEntity>? products,
    List<ProductEntity>? favorites,
    HomeStatus? status,
    String? errorMessage,
    int? selectedCategoryId,
    bool? overrideSelectedId,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      products: products ?? this.products,
      favorites: favorites ?? this.favorites,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedCategoryId: overrideSelectedId == true ? selectedCategoryId : (selectedCategoryId ?? this.selectedCategoryId),
    );
  }

  @override
  List<Object?> get props => [
    categories,
    products,
    favorites,
    status,
    errorMessage,
    selectedCategoryId,
  ];
}
