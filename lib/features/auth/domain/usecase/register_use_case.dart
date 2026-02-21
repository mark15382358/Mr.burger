import 'package:dartz/dartz.dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/core/usecase/base_use_case.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/register_params.dart';
import 'package:mr_burger/features/auth/domain/entity/user_entities.dart';
import 'package:mr_burger/features/auth/domain/repository/auth_repo.dart';

class RegisterUseCase implements BaseUsecase<UserEntity, RegisterParams> {
  final BaseAuthRepo baseAuthRepo;
  RegisterUseCase({required this.baseAuthRepo});
  @override
  Future<Either<Failure, UserEntity>> call(RegisterParams params) async {
    return await baseAuthRepo.register(params);
  }
}
