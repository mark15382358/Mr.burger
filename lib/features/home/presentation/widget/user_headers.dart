import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';

class UserHeaders extends StatefulWidget {
  const UserHeaders({super.key});

  @override
  State<UserHeaders> createState() => _UserHeadersState();
}

class _UserHeadersState extends State<UserHeaders> {
  ValueNotifier<bool> m = ValueNotifier(true);
  @override
  void dispose() {
    m.dispose();
    super.dispose();
  }

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
              "Hello, Mark Khristo ",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
        // IconButton(
        //   icon: ValueListenableBuilder(
        //     valueListenable: m,
        //     builder: (context, value, child) {
        //       return Icon(m.value == true ? Icons.add : Icons.mic);
        //     },
        //   ),
        //   onPressed: () {
        //     m.value = !m.value;
        //   },
        // ),
        const Spacer(),
        CircleAvatar(
          radius: AppSizes.r30,
          child: Icon(CupertinoIcons.person, color: AppColors.white),
          backgroundColor: AppColors.primary,
        ),
      ],
    );
  }
}
