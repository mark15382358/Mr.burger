import 'package:get_it/get_it.dart';
import 'package:mr_burger/features/home/data/data_source/home_remote_data_source.dart';
import 'package:mr_burger/features/home/data/repository/home_repo_implementation.dart';
import 'package:mr_burger/features/home/domain/repository/home_repository.dart';
import 'package:mr_burger/features/home/domain/use_case/get_categories_use_case.dart';
import 'package:mr_burger/features/home/domain/use_case/get_favourites_use_case.dart'
    show GetFavoritesUseCase;
import 'package:mr_burger/features/home/domain/use_case/get_product_use_case.dart';
import 'package:mr_burger/features/home/domain/use_case/toggle_favourite_use_case.dart';
import 'package:mr_burger/features/home/presentation/controller/cubit/home_cubit.dart';

final sl = GetIt.instance;

void initHome() {

  //cubit
  sl.registerFactory(() => HomeCubit(sl(), sl(), sl(), sl()));
  // UseCases
  sl.registerLazySingleton(() => GetProductsUseCase(sl()));
  sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));
  sl.registerLazySingleton(() => GetFavoritesUseCase(sl()));
  sl.registerLazySingleton(() => ToggleFavoriteUseCase(sl()));

  // Repository
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));

  // Data Sources
  sl.registerLazySingleton<BaseHomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(sl()),
  );
}
