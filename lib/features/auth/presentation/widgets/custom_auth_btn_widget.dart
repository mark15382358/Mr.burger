import 'package:flutter/material.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
class CustomAuthBtnWidget extends StatelessWidget {
  final Function()? onTap;
  final String text;
  Color? colorButton;
  Color? colorText;

  CustomAuthBtnWidget({
    required this.onTap,
    super.key,
    required this.text,
    this.colorText,
    this.colorButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.white),
          color: colorButton ?? AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "$text",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: colorText ?? AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
