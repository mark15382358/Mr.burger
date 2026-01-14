import 'package:flutter/material.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';

class CustomButton extends StatelessWidget {
  final Function ()onTap;
  final String title;
  Color? colors;
  CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors ?? AppColors.primary,
          borderRadius: BorderRadius.circular(AppSizes.r30),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.w40,
            vertical: AppSizes.h16,
          ),
          child: Center(
            child: Text(
              "$title",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
