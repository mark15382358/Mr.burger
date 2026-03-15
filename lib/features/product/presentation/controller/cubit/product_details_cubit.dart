import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_burger/features/product/domain/use_case.dart/get_slides_options_use_case.dart';
import 'package:mr_burger/features/product/domain/use_case.dart/get_toppings_use_case.dart';
import 'package:mr_burger/features/product/presentation/controller/cubit/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetToppingsUseCase getToppingsUseCase;
  final GetSlideOptionsUseCase getSlideOptionsUseCase;

  ProductDetailsCubit({
    required this.getToppingsUseCase,
    required this.getSlideOptionsUseCase,
  }) : super(ProductDetailsInitial());

  Future<void> getProductOptions() async {
    emit(ProductDetailsLoading());

    final toppingsResult = await getToppingsUseCase();
    final sideOptionsResult = await getSlideOptionsUseCase();

    toppingsResult.fold(
      (failure) => emit(ProductDetailsError(failure.message)),
      (toppings) {
        sideOptionsResult.fold(
          (failure) => emit(ProductDetailsError(failure.message)),
          (sides) => emit(
            ProductDetailsSuccess(toppings: toppings, sideOptions: sides),
          ),
        );
      },
    );
  }

  void updateSlider(double newValue) {
    if (state is ProductDetailsSuccess) {
      final currentState = state as ProductDetailsSuccess;
      emit(currentState.copyWith(sliderValue: newValue));
    }
  }
}