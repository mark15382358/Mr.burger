import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';

class AuthHeaderWidget extends StatelessWidget {
  bool isLogin = true;
  AuthHeaderWidget({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: AppSizes.h50),
        SvgPicture.asset(
          "assets/images/logo.svg",
          // ignore: deprecated_member_use
          color: AppColors.primary,
        ),
        SizedBox(height: AppSizes.h10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            isLogin
                ? "Welcome Back, Discover The Fast Food"
                : "Welcome to our Food App",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ],
    );
  }
}
