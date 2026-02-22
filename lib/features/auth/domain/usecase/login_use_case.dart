import 'package:dartz/dartz.dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/core/usecase/base_use_case.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/login_params.dart';
import 'package:mr_burger/features/auth/domain/entity/user_entities.dart';
import 'package:mr_burger/features/auth/domain/repository/auth_repo.dart';

class LoginUseCase implements BaseUsecase<UserEntity, LoginParams> {
  final BaseAuthRepo baseAuthRepo;
  const LoginUseCase({required this.baseAuthRepo});
  @override
  Future<Either<Failure, UserEntity>> call(LoginParams parameters) async {
    return await baseAuthRepo.login(parameters);
  }

}


