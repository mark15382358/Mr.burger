import 'package:dartz/dartz.dart';
import 'package:mr_burger/core/error/exceptions..dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/features/home/data/data_source/home_remote_data_source.dart';
import 'package:mr_burger/features/home/domain/entity/category_entity.dart';
import 'package:mr_burger/features/home/domain/entity/product_entity.dart';
import 'package:mr_burger/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final BaseHomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    int? categoryId,
    String? name,
  }) async {
    try {
      final products = await remoteDataSource.getProducts(
        categoryId: categoryId,
        name: name,
      );
      return Right(products);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavorites() async {
    try {
      final result = await remoteDataSource.getFavorites();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> toggleFavorite(int productId) async {
    try {
      await remoteDataSource.toggleFavorite(productId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      return Right(categories);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
