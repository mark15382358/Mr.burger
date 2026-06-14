import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';

class ToppingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Color? color;
  final VoidCallback? onTap;

  const ToppingCard({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Colors.grey[200];

    return GestureDetector(
      onTap: onTap,
      child: Container(
      width: AppSizes.w100,
      height: AppSizes.h130,
      padding: EdgeInsets.all(AppSizes.h8),
      decoration: BoxDecoration(
        color: effectiveColor,
        borderRadius: BorderRadius.circular(AppSizes.r20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Skeleton.keep(
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.fastfood, size: 40),
                ),
              ),
            ),
          ),

          SizedBox(height: AppSizes.h10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
    );

    
  }
}
