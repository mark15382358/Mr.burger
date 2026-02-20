import 'package:dio/dio.dart' show Dio;
import 'package:get_it/get_it.dart';
import 'package:mr_burger/core/network/api_services.dart';
import 'package:mr_burger/core/network/dio_client.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/auth_remote_data_source.dart';
import 'package:mr_burger/features/auth/data/repository/auth_repo_implementation.dart';
import 'package:mr_burger/features/auth/domain/repository/auth_repo.dart';
import 'package:mr_burger/features/auth/domain/usecase/register_use_case.dart';
import 'package:mr_burger/features/auth/presentation/controller/cubit/auth_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerLazySingleton<Dio>(() => Dio()); 
    //  Core Services
sl.registerLazySingleton<DioClient>(() => DioClient()); 

    // 2. الـ ApiServices ياخد الـ dio اللي "جوه" الـ DioClient
    sl.registerLazySingleton<ApiServices>(() => ApiServices(sl<DioClient>().dio));
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
    sl.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(baseAuthRepo: sl()),
    );

    //cubit 
    sl.registerFactory(() => AuthCubit(registerUseCase: sl()));

   
  }
}
