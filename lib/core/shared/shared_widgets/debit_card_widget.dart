import 'package:flutter/material.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';

class DebitCardWidget extends StatelessWidget {
  final String groupValue;
final ValueChanged<String?> onChanged;
  const DebitCardWidget({super.key,required this .onChanged,required this.groupValue});

  @override
  Widget build(BuildContext context) {
    return  Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.h20),
                  color: AppColors.blue,
                ),
                child: ListTile(
                  title: Text(
                    "Debit card",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  trailing: Radio<String>(
                    value: "visa",
                    activeColor: AppColors.white,
                    groupValue: groupValue,
                    onChanged: onChanged,
                  ),
                  subtitle: Text(
                    "3566 **** **** 0505",
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall?.copyWith(color: AppColors.white),
                  ),
                  leading: Image.asset(
                    "assets/images/visa.png",
                    width: AppSizes.w48,
                  ),
                ),
              );
  }
}