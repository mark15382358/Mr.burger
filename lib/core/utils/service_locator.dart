import 'package:dio/dio.dart' show Dio;
import 'package:get_it/get_it.dart';
import 'package:mr_burger/core/network/api_services.dart';
import 'package:mr_burger/core/network/dio_client.dart';
import 'package:mr_burger/core/utils/auth_injection.dart';
import 'package:mr_burger/core/utils/home_injection.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    initHome();
    initAuth();

    sl.registerLazySingleton<Dio>(() => Dio());
    //  Core Services
    sl.registerLazySingleton<DioClient>(() => DioClient());

    sl.registerLazySingleton<ApiServices>(
      () => ApiServices(sl<DioClient>().dio),
    );
  }
}
