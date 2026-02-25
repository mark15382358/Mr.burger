import 'package:dartz/dartz.dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/core/usecase/base_use_case.dart';
import 'package:mr_burger/features/home/domain/entity/category_entity.dart';
import 'package:mr_burger/features/home/domain/repository/home_repository.dart';

class GetCategoriesUseCase
    extends BaseUsecase<List<CategoryEntity>, NoParameters> {
  final HomeRepository repository;

  GetCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(
    NoParameters parameters,
  ) async {
    return await repository.getCategories();
  }
}
