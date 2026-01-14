import 'package:flutter/material.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';

class ToppingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onAdd;
  final Color color;

  const ToppingCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onAdd,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onAdd,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.r16),
                child: Container(
                  color: color,

                  child: Column(
                    children: [
                      Container(
                        width: AppSizes.w120,
                        height: AppSizes.h80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSizes.r16),

                          color: Color(0xfffdfdfd),
                        ),

                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.contain,
                          width: AppSizes.w80,
                          height: AppSizes.h50,
                        ),
                      ),

                      SizedBox(height: AppSizes.h10),

                      Container(
                        width: AppSizes.w120,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.w8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: Color(0xffFFFFFF)),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: CircleAvatar(
                                  radius: AppSizes.r12,
                                  backgroundColor: Color(0xfffEF2A39),
                                  child: Icon(
                                    Icons.add,
                                    size: AppSizes.h16,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: AppSizes.h6),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
