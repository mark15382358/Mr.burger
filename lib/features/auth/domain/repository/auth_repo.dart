import 'package:dartz/dartz.dart';
import 'package:mr_burger/core/network/failure.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/register_params.dart';
import 'package:mr_burger/features/auth/domain/entity/user_entities.dart';

abstract class BaseAuthRepo {
  Future<Either<Failure, UserEntity>> register(RegisterParams params);
}
