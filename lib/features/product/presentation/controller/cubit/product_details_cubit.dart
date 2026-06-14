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
            ProductDetailsSuccess(
              toppings: toppings,
              sideOptions: sides,
              selectedSides: [],
              selectedToppings: [],
            ),
          ),
        );
      },
    );
  }

  /// Toggles the selection of a topping by its ID.
  void toggleTopping(int toppingId) {
    if (state is ProductDetailsSuccess) {
      final currentState = state as ProductDetailsSuccess;
      List<int> updatedToppings = List.from(currentState.selectedToppings);

      if (updatedToppings.contains(toppingId)) {
        updatedToppings.remove(toppingId); 
      } else {
        updatedToppings.add(toppingId);
      }
      emit(currentState.copyWith(selectedToppings: updatedToppings));
    }
  }
/// Toggles the selection of a side option by its ID.
  void toggleSideOption(int sideId) {
    if (state is ProductDetailsSuccess) {
      final currentState = state as ProductDetailsSuccess;
      List<int> updatedSides = List.from(currentState.selectedSides);

      if (updatedSides.contains(sideId)) {
        updatedSides.remove(sideId);
      } else {
        updatedSides.add(sideId);
      }
      emit(currentState.copyWith(selectedSides: updatedSides));
    }
  }
/// Updates the slider value in the state.
  void updateSlider(double newValue) {
    if (state is ProductDetailsSuccess) {
      final currentState = state as ProductDetailsSuccess;
      emit(currentState.copyWith(sliderValue: newValue));
    }
  }
}
