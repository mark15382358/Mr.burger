import 'package:flutter/material.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/features/shared/custom_button.dart';

class SuccessDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.r20),
          ),
          child: Container(
            padding: EdgeInsets.all(AppSizes.h20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.r20),
              color: AppColors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: AppSizes.h10),
                CircleAvatar(
                  radius: AppSizes.r30,
                  backgroundColor: AppColors.primary,
                  child: Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: AppSizes.h40,
                  ),
                ),
                SizedBox(height: AppSizes.h20),
                Text(
                  "Success !",
                  style: TextStyle(
                    fontSize: AppSizes.sp24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: AppSizes.h10),
                Text(
                  "Your payment was successful.\nA receipt for this purchase has\nbeen sent to your email.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(height: AppSizes.h30),
                CustomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: "Go Back",
                ),
                SizedBox(height: AppSizes.h10),
              ],
            ),
          ),
        );
      },
    );
  }
}
