import 'package:flutter/material.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  Color? colors;
  Color? textColor;
  Icon? icon;
  CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    this.colors,
    this.icon,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors ?? AppColors.primary,
          border: BoxBorder.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(AppSizes.r30),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.w10,
            vertical: AppSizes.h16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Text(
                  "$title",
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: textColor),
                ),
              ),
              // SizedBox(height: AppSizes.h5),
              if (icon != null) icon!,
            ],
          ),
        ),
      ),
    );
  }
}
