import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/core/usecase/base_use_case.dart';
import 'package:mr_burger/features/home/domain/entity/product_entity.dart';
import 'package:mr_burger/features/home/domain/repository/home_repository.dart';

class GetProductsUseCase extends BaseUsecase<List<ProductEntity>, ProductParams> {
  final HomeRepository repository;

  GetProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(ProductParams params) async {
    return await repository.getProducts(
      categoryId: params.categoryId,
      name: params.name,  
    );
  }
}
class ProductParams extends Equatable {
  final int? categoryId;
  final String? name;

  const ProductParams({this.categoryId, this.name});

  @override
  List<Object?> get props => [categoryId, name];
}