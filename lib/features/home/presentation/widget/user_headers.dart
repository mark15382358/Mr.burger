import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';

class UserHeaders extends StatelessWidget {
  const UserHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/images/logo.svg",
              color: AppColors.primary,
              width: AppSizes.w140,
              height: AppSizes.h42,
            ),
            SizedBox(height: AppSizes.h16),
            Text(
              "Hello, Mark Khristo",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: AppSizes.r30,
          child: Icon(CupertinoIcons.person, color: AppColors.white),
          backgroundColor: AppColors.primary,
        ),
      ],
    );
  }
}
