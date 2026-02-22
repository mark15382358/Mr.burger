import 'package:dartz/dartz.dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/core/usecase/base_use_case.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/update_profile_params.dart';
import 'package:mr_burger/features/auth/domain/entity/profile_entity.dart';
import 'package:mr_burger/features/auth/domain/repository/auth_repo.dart';

class UpdateProfileUseCase
    implements BaseUsecase<ProfileEntity, UpdateProfileParams> {
  final BaseAuthRepo baseAuthRepo;
  const UpdateProfileUseCase({required this.baseAuthRepo});
  @override
  Future<Either<Failure, ProfileEntity>> call(
    UpdateProfileParams parameters,
  ) async {
    return await baseAuthRepo.updateProfile(parameters);
  }
}
