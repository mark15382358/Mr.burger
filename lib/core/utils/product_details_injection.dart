import 'package:get_it/get_it.dart';
import 'package:mr_burger/features/product/data/data_source/product_details_data_source.dart';
import 'package:mr_burger/features/product/data/repository/product_details_repo_imple.dart';
import 'package:mr_burger/features/product/domain/repository/base_product_details_repo.dart';
import 'package:mr_burger/features/product/domain/use_case.dart/get_slides_options_use_case.dart';
import 'package:mr_burger/features/product/domain/use_case.dart/get_toppings_use_case.dart';
import 'package:mr_burger/features/product/presentation/controller/cubit/product_details_cubit.dart';
final sl = GetIt.instance;

void initProductDetails() {

  //cubit
  sl.registerFactory(() => ProductDetailsCubit(getToppingsUseCase: sl(), getSlideOptionsUseCase: sl()));
  // UseCases
  sl.registerLazySingleton(() => GetToppingsUseCase(sl()));
  sl.registerLazySingleton(() => GetSlideOptionsUseCase(sl()));
  // Repository
  sl.registerLazySingleton<BaseProductDetailsRepo>(() => ProductDetailsRepoImple(sl()));
  // Data Sources
  sl.registerLazySingleton<BaseProductDetailsDataSource>(
    () => ProductDetailsDataSourceImpl(sl()),
  );
}
