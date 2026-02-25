import 'package:dartz/dartz.dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/features/home/domain/entity/category_entity.dart';
import 'package:mr_burger/features/home/domain/entity/product_entity.dart';
import 'package:mr_burger/features/home/domain/use_case/get_product_use_case.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts({int? categoryId, 
    String? name,});
  Future<Either<Failure, List<ProductEntity>>> getFavorites();
  Future<Either<Failure, void>> toggleFavorite(int productId);
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
