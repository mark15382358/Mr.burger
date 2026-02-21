import 'package:dartz/dartz.dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/core/error/exceptions..dart';
import 'package:mr_burger/features/auth/data/remote_datasource/auth_remote_data_source.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/register_params.dart';
import 'package:mr_burger/features/auth/domain/entity/user_entities.dart';
import 'package:mr_burger/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImplementation implements BaseAuthRepo {
  final BaseAuthRemoteDataSource authRemoteDataSource;
  AuthRepoImplementation({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, UserEntity>> register(RegisterParams params) async {
    try {
      final result = await authRemoteDataSource.register(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
