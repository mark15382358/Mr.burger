import 'package:dartz/dartz.dart';
import 'package:mr_burger/core/error/failure.dart';
import 'package:mr_burger/core/error/exceptions..dart';
import 'package:mr_burger/core/utils/pref_helper.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/auth_remote_data_source.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/login_params.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/register_params.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/update_profile_params.dart';
import 'package:mr_burger/features/auth/domain/entity/profile_entity.dart';
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

  @override
  Future<Either<Failure, UserEntity>> login(LoginParams params) async {
    try {
      final result = await authRemoteDataSource.login(params);
      await PrefHelper.saveToken(result.token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final result = await authRemoteDataSource.getProfile();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateProfile(
    UpdateProfileParams params,
  ) async {
    try {
      final result = await authRemoteDataSource.updateProfile(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
