import 'package:flutter/material.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Color(0xffffffff),
  appBarTheme: AppBarTheme(backgroundColor: Color(0xffffffff)),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    enableFeedback: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey.shade700,
  ),
  splashFactory: NoSplash.splashFactory,

  textTheme: TextTheme(
    titleMedium: TextStyle(
      fontSize: AppSizes.sp18,
      fontWeight: FontWeight.w500,
      color: AppColors.secondPrimary,
    ),
    titleLarge: TextStyle(fontSize: AppSizes.sp16, fontWeight: FontWeight.w600),
    titleSmall: TextStyle(
      fontSize: AppSizes.sp16,
      fontWeight: FontWeight.w500,
      color: AppColors.primary,
    ),
    displaySmall: TextStyle(
      fontSize: AppSizes.sp13,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      color: Color(0xff6A6A6A),
      fontSize: AppSizes.sp18,
      fontWeight: FontWeight.w500,
    ),
    displayLarge: TextStyle(
      fontSize: AppSizes.sp16,
      fontWeight: FontWeight.w800,
      color: AppColors.secondPrimary,
    ),
    labelSmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: AppSizes.sp18,
      color: AppColors.checkoutPage1,
    ),
    labelMedium: TextStyle(
      fontSize: AppSizes.sp20,
      fontWeight: FontWeight.w600,
      color: AppColors.secondPrimary,
    ),
  ),
);
