import 'package:dartz/dartz.dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/core/usecase/base_use_case.dart';
import 'package:mr_burger/features/home/domain/entity/product_entity.dart';
import 'package:mr_burger/features/home/domain/repository/home_repository.dart';

class GetFavoritesUseCase extends BaseUsecase<List<ProductEntity>, NoParameters> {
  final HomeRepository repository;
  GetFavoritesUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParameters parameters) async {
    return await repository.getFavorites();
  }
}