import 'package:mr_burger/features/home/domain/use_case/get_product_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/core/usecase/base_use_case.dart';
import 'package:mr_burger/core/utils/enums.dart';
import 'package:mr_burger/features/home/domain/entity/category_entity.dart';
import 'package:mr_burger/features/home/domain/entity/product_entity.dart';
import 'package:mr_burger/features/home/domain/use_case/get_categories_use_case.dart';
import 'package:mr_burger/features/home/domain/use_case/get_favourites_use_case.dart';
import 'package:mr_burger/features/home/domain/use_case/toggle_favourite_use_case.dart';
import 'package:mr_burger/features/home/presentation/controller/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetProductsUseCase getProductsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  HomeCubit(
    this.getProductsUseCase,
    this.getCategoriesUseCase,
    this.getFavoritesUseCase,
    this.toggleFavoriteUseCase,
  ) : super(const HomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<ProductEntity> _mapProductsWithFavorites(
    List<ProductEntity> products,
    List<ProductEntity> favorites,
  ) {
    final favIds = favorites.map((e) => e.id).toSet();
    return products.map((product) {
      return product.copyWith(isFavorite: favIds.contains(product.id));
    }).toList();
  }

  Future<void> getHomeData() async {
    emit(state.copyWith(status: HomeStatus.loading));
    final categoriesResult = await getCategoriesUseCase(NoParameters());

    await categoriesResult.fold(
      (failure) async => emit(
        state.copyWith(status: HomeStatus.error, errorMessage: failure.message),
      ),
      (categoriesList) async {
        List<CategoryEntity> fullCategories = [
          CategoryEntity(id: null, name: "All"),
          ...categoriesList,
        ];

        final results = await Future.wait([
          getProductsUseCase(ProductParams()),
          getFavoritesUseCase(NoParameters()),
        ]);

        final productsResult =
            results[0] as Either<Failure, List<ProductEntity>>;
        final favoritesResult =
            results[1] as Either<Failure, List<ProductEntity>>;

        productsResult.fold(
          (failure) => emit(
            state.copyWith(
              status: HomeStatus.error,
              errorMessage: failure.message,
            ),
          ),
          (productsList) {
            favoritesResult.fold(
              (failure) => emit(
                state.copyWith(
                  status: HomeStatus.success,
                  categories: fullCategories,
                  products: productsList,
                  selectedCategoryId: null,
                  overrideSelectedId: true,
                ),
              ),
              (favList) => emit(
                state.copyWith(
                  status: HomeStatus.success,
                  categories: fullCategories,
                  products: _mapProductsWithFavorites(productsList, favList),
                  selectedCategoryId: null,
                  overrideSelectedId: true,
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> getFilteredProducts(int? categoryId) async {
    emit(
      state.copyWith(
        status: HomeStatus.filterLoading,
        selectedCategoryId: categoryId,
        overrideSelectedId: true,
      ),
    );

    final results = await Future.wait([
      getProductsUseCase(ProductParams(categoryId: categoryId)),
      getFavoritesUseCase(NoParameters()),
    ]);

    final productsResult = results[0] as Either<Failure, List<ProductEntity>>;
    final favoritesResult = results[1] as Either<Failure, List<ProductEntity>>;

    productsResult.fold(
      (failure) => emit(
        state.copyWith(status: HomeStatus.error, errorMessage: failure.message),
      ),
      (productsList) {
        favoritesResult.fold(
          (_) => emit(
            state.copyWith(status: HomeStatus.success, products: productsList),
          ),
          (favList) => emit(
            state.copyWith(
              status: HomeStatus.success,
              products: _mapProductsWithFavorites(productsList, favList),
            ),
          ),
        );
      },
    );
  }

  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      getFilteredProducts(state.selectedCategoryId);
      return;
    }

    emit(state.copyWith(status: HomeStatus.loading));

    final result = await getProductsUseCase(
      ProductParams(name: query, categoryId: null),
    );

    result.fold((failure) => emit(state.copyWith(status: HomeStatus.error)), (
      productsList,
    ) async {
      final favResult = await getFavoritesUseCase(NoParameters());
      final favList = favResult.getOrElse(() => []);

      final mappedProducts = _mapProductsWithFavorites(productsList, favList);

      emit(
        state.copyWith(status: HomeStatus.success, products: mappedProducts),
      );
    });
  }

  Future<void> toggleFavorite(int productId) async {
    final previousProducts = List<ProductEntity>.from(state.products);
    final updatedProducts = state.products.map((product) {
      if (product.id == productId) {
        return product.copyWith(isFavorite: !product.isFavorite);
      }
      return product;
    }).toList();

    emit(state.copyWith(products: updatedProducts));

    final result = await toggleFavoriteUseCase(productId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          products: previousProducts,
          status: HomeStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (success) => getFavorites(),
    );
  }

  Future<void> getFavorites() async {
    final result = await getFavoritesUseCase(NoParameters());
    result.fold(
      (failure) => emit(
        state.copyWith(status: HomeStatus.error, errorMessage: failure.message),
      ),
      (favList) =>
          emit(state.copyWith(favorites: favList, status: HomeStatus.success)),
    );
  }
}
