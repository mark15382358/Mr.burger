import 'package:get_it/get_it.dart';
import 'package:mr_burger/core/usecase/base_use_case.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/auth_remote_data_source.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/login_params.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/register_params.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/update_profile_params.dart';
import 'package:mr_burger/features/auth/data/repository/auth_repo_implementation.dart';
import 'package:mr_burger/features/auth/domain/entity/profile_entity.dart';
import 'package:mr_burger/features/auth/domain/entity/user_entities.dart';
import 'package:mr_burger/features/auth/domain/repository/auth_repo.dart';
import 'package:mr_burger/features/auth/domain/usecase/get_profile_use_case.dart';
import 'package:mr_burger/features/auth/domain/usecase/login_use_case.dart';
import 'package:mr_burger/features/auth/domain/usecase/register_use_case.dart';
import 'package:mr_burger/features/auth/domain/usecase/update_profile_use_case.dart';
import 'package:mr_burger/features/auth/presentation/controller/cubit/auth_cubit.dart';

final sl=GetIt.instance;
void initAuth(){

//  Data Sources
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()),
    );

    //  Repositories
    sl.registerLazySingleton<BaseAuthRepo>(
      () => AuthRepoImplementation(
        authRemoteDataSource: sl<BaseAuthRemoteDataSource>(),
      ),
    );

    // Use Cases
    sl.registerLazySingleton<BaseUsecase<UserEntity, RegisterParams>>(
      () => RegisterUseCase(baseAuthRepo: sl()),
    );
    sl.registerLazySingleton<BaseUsecase<ProfileEntity, NoParameters>>(
      () => GetProfileUseCase(baseAuthRepo: sl()),
    );

    sl.registerLazySingleton<BaseUsecase<UserEntity, LoginParams>>(
      () => LoginUseCase(baseAuthRepo: sl()),
    );
    sl.registerLazySingleton<BaseUsecase<ProfileEntity, UpdateProfileParams>>(
      () => UpdateProfileUseCase(baseAuthRepo: sl()),
    );

    //cubit
    sl.registerFactory(
      () => AuthCubit(
        registerUseCase: sl(),
        loginUseCase: sl(),
        getProfileUseCase: sl(),
        updateProfileUseCase: sl(),
      ),
    );}
