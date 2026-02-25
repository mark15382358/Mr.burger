import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/core/constants/app_strings.dart';
import 'package:mr_burger/features/home/presentation/controller/cubit/home_cubit.dart';

class CardItem extends StatelessWidget {
 const CardItem({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.rate,
    required this.productId,
    required this.price,
    this.isFavorite = false,
  });
 final String image;
 final String title;
final  String description;
 final double price;
 final String rate;
 final int productId;
 final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsetsGeometry.all(AppSizes.h8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Image.network(image, width: AppSizes.w100)),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            // Text("\$${price.toStringAsFixed(2)}", style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: AppSizes.h12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text("${AppStrings.star} $rate", style: Theme.of(context).textTheme.titleMedium)),
                IconButton(
                  icon: const Icon(CupertinoIcons.heart_fill),
                  color: isFavorite ? AppColors.red : AppColors.grey,
                  onPressed: () {
                    context.read<HomeCubit>().toggleFavorite(productId);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
