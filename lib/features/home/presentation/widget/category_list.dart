import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/core/constants/app_strings.dart';
import 'package:mr_burger/core/utils/enums.dart';
import 'package:mr_burger/features/home/presentation/controller/cubit/home_cubit.dart';
import 'package:mr_burger/features/home/presentation/controller/cubit/home_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.categories != current.categories ||
          previous.selectedCategoryId != current.selectedCategoryId,

      builder: (context, state) {
        return Skeletonizer(
          enabled: state.status == HomeStatus.loading,
          child: SizedBox(
            height: AppSizes.h50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.status == HomeStatus.loading
                  ? 5
                  : state.categories.length,
              itemBuilder: (context, index) {
                final category = state.status == HomeStatus.loading
                    ? null
                    : state.categories[index];

                return GestureDetector(
                  onTap: () {
                    if (category != null) {
                      context.read<HomeCubit>().getFilteredProducts(
                        category.id,
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: state.selectedCategoryId == category?.id
                          ? AppColors.primary
                          : AppColors.greyShade,
                      borderRadius: BorderRadius.circular(AppSizes.r20),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.h27,
                      vertical: AppSizes.h16,
                    ),
                    child: Center(
                      child: Text(
                        category?.name ?? AppStrings.loading,
                        style: TextStyle(
                          color: state.selectedCategoryId == category?.id
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
