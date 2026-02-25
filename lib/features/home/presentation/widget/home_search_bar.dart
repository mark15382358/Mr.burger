import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/core/constants/app_strings.dart';
import 'package:mr_burger/features/home/presentation/controller/cubit/home_cubit.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(AppSizes.r16),
      child: TextField(
        onChanged: (value) {
          context.read<HomeCubit>().searchProducts(value);
        },
        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          prefixIcon: const Icon(CupertinoIcons.search),
          hintText: AppStrings.search,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.r16),
            borderSide:  BorderSide(color: AppColors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.r16),
            borderSide:  BorderSide(color: AppColors.grey),
          ),
        ),
      ),
    );
  }
}
