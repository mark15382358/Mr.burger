import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/features/shared/custom_button.dart';

class CartItem extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  final String image;
  final Function onAdd;
  final Function onMinus;
  final Function onRemove;
  CartItem({
    super.key,
    required this.number,
    required this.title,
    required this.description,
    required this.image,
    required this.onAdd,
    required this.onMinus,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.h16),
      child: Container(
        height: AppSizes.h200,
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset(image),
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: AppSizes.h10),
                        child: Text(
                          description,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: AppSizes.w30),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              onAdd();
                            },
                            child: CircleAvatar(
                              backgroundColor: AppColors.primary,
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                          SizedBox(width: AppSizes.w10),
                          Text(
                            "$number",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(width: AppSizes.w10),

                          GestureDetector(
                            onTap: () {
                              onMinus();
                            },
                            child: CircleAvatar(
                              backgroundColor: AppColors.primary,
                              child: Icon(Icons.remove, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSizes.h20),
                      CustomButton(
                        onTap: () {
                          onRemove();
                        },
                        title: "Remove",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
