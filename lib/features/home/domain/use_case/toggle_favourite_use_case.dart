import 'package:dartz/dartz.dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/core/usecase/base_use_case.dart';
import 'package:mr_burger/features/home/domain/repository/home_repository.dart';

class ToggleFavoriteUseCase extends BaseUsecase<void, int> {
  final HomeRepository repository;
  ToggleFavoriteUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(int productId) async {
    return await repository.toggleFavorite(productId);
  }
}