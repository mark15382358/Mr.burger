import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/core/constants/app_strings.dart';
import 'package:mr_burger/features/product/presentation/controller/cubit/product_details_cubit.dart';
import 'package:mr_burger/features/product/presentation/controller/cubit/product_details_state.dart';
import 'package:mr_burger/features/product/presentation/widgets/topping_card.dart';
import 'package:mr_burger/features/shared/custom_button.dart';

class ProductDetailsView extends StatelessWidget {
  final int productId;
  final String productImage;
  final double productPrice;

  const ProductDetailsView({
    super.key,
    required this.productId,
    required this.productImage,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          final bool isLoading = state is ProductDetailsLoading;

          final sideOptions = state is ProductDetailsSuccess
              ? state.sideOptions
              : List.generate(6, (index) => null);

          final toppings = state is ProductDetailsSuccess
              ? state.toppings
              : List.generate(6, (index) => null);
          final sliderVal = state is ProductDetailsSuccess
              ? state.sliderValue
              : 0.7;
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(AppSizes.h12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Image.network(productImage, height: AppSizes.h250),
                      SizedBox(width: AppSizes.w16),
                      // Slider(
                      //   value: 0.7,
                      //   onChanged: (v) {},
                      //   activeColor: AppColors.primary,
                      // ),
                      Slider(
                        value: sliderVal,
                        onChanged: state is ProductDetailsSuccess
                            ? (v) => context
                                  .read<ProductDetailsCubit>()
                                  .updateSlider(v)
                            : null,
                        activeColor: AppColors.primary,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: AppSizes.w2),
                          const Text(AppStrings.imotion1),
                          SizedBox(width: AppSizes.w100),
                          const Text(AppStrings.imotion2),
                          SizedBox(width: AppSizes.w2),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.h50),
                  Text(
                    "Side Options",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: AppSizes.h10),

                  Skeletonizer(
                    enabled: isLoading,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: sideOptions.map((item) {
                          return Padding(
                            padding: EdgeInsets.only(right: AppSizes.h12),
                            child: ToppingCard(
                              imageUrl: item?.image ?? "assets/images/meat.png",
                              title: item?.name ?? "Loading...",
                              onAdd: () {},
                              color: AppColors.secondPrimary,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  SizedBox(height: AppSizes.h50),
                  Text(
                    "Toppings",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: AppSizes.h10),

                  // --- الـ Skeletonizer الخاص بالـ Toppings ---
                  Skeletonizer(
                    enabled: isLoading,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: toppings.map((item) {
                          return Padding(
                            padding: EdgeInsets.only(right: AppSizes.h12),
                            child: ToppingCard(
                              imageUrl: item?.image ?? "assets/images/meat.png",
                              title: item?.name ?? "Loading...",
                              onAdd: () {},
                              color: AppColors.secondPrimary,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.h60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Total Price",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: AppSizes.h8),
                          Text(
                            "\$${productPrice.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      CustomButton(onTap: () {}, title: "Add to Cart"),
                    ],
                  ),
                  SizedBox(height: AppSizes.h60),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
