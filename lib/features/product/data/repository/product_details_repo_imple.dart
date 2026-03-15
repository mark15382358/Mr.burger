import 'package:dartz/dartz.dart';
import 'package:mr_burger/core/error/exceptions..dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/features/product/data/data_source/product_details_data_source.dart';
import 'package:mr_burger/features/product/domain/entity/option_entity.dart';
import 'package:mr_burger/features/product/domain/repository/base_product_details_repo.dart';

class ProductDetailsRepoImple implements BaseProductDetailsRepo {
  final BaseProductDetailsDataSource baseProductDetailsDataSource;
  ProductDetailsRepoImple(this.baseProductDetailsDataSource);

  @override
  Future<Either<Failure, List<OptionEntity>>> getSlideOptions() async { 
    try {
      final result = await baseProductDetailsDataSource.sideOption();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OptionEntity>>> getToppings() async {
    try {
      final result = await baseProductDetailsDataSource.getToppings();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}