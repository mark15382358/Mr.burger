import 'package:dartz/dartz.dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/core/usecase/base_use_case.dart';
import 'package:mr_burger/features/auth/domain/entity/profile_entity.dart';
import 'package:mr_burger/features/auth/domain/repository/auth_repo.dart';

class GetProfileUseCase implements BaseUsecase<ProfileEntity, NoParameters> {
  BaseAuthRepo baseAuthRepo;
  GetProfileUseCase({required this.baseAuthRepo});

  @override
  Future<Either<Failure, ProfileEntity>> call(NoParameters parameters) async {
    return await baseAuthRepo.getProfile();
  }
}
