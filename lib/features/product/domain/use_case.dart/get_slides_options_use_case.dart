import 'package:dartz/dartz.dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/features/product/domain/entity/option_entity.dart';
import 'package:mr_burger/features/product/domain/repository/base_product_details_repo.dart';

class GetSlideOptionsUseCase {
  final BaseProductDetailsRepo repository;
  GetSlideOptionsUseCase(this.repository);
  Future<Either<Failure, List<OptionEntity>>> call() async {
    return await repository.getSlideOptions();
  }
}