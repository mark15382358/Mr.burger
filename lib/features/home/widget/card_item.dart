import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';

class CardItem extends StatelessWidget {
  CardItem({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.rate,
  });
  String image;
  String title;
  String description;
  String rate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsetsGeometry.all(AppSizes.h8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(image, width: AppSizes.w100),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            Text(description, style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: AppSizes.h12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("⭐ $rate", style: Theme.of(context).textTheme.titleMedium),
                Icon(CupertinoIcons.heart_fill, color: AppColors.primary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
