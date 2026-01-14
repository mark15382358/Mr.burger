import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/features/product/widgets/topping_card.dart';
import 'package:mr_burger/features/shared/custom_button.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.h12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/components.png",
                    height: AppSizes.h250,
                  ),
                  SizedBox(width: AppSizes.w16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                            Text(
                              "Customize ",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            const Text("Your Burger"),
                          ],
                        ),
                        const Text(
                          "to Your Tastes.\n Ultimate Experience",
                          style: TextStyle(height: 1.5),
                        ),
                        Slider(
                          value: 0.7,
                          onChanged: (v) {
                            var value = v;
                          },
                          activeColor: AppColors.primary,
                        ),
                        Row(
                          children: [
                            SizedBox(width: AppSizes.w16),
                            Text("🥶"),
                            SizedBox(width: AppSizes.w100),
                            Text("🌶️"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.h50),
              Text("Toppings", style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: AppSizes.h10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (int index) {
                    return Padding(
                      padding: EdgeInsets.only(right: AppSizes.h12),
                      child: ToppingCard(
                        imageUrl: "assets/images/meat.png",
                        title: "Meatmjkjj",
                        onAdd: () {},
                        color: AppColors.secondPrimary,
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: AppSizes.h50),
              Text("Toppings", style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: AppSizes.h10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (int index) {
                    return Padding(
                      padding: EdgeInsets.only(right: AppSizes.h12),
                      child: ToppingCard(
                        imageUrl: "assets/images/meat.png",
                        title: "Meatmjkjj",
                        onAdd: () {},
                        color: AppColors.secondPrimary,
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: AppSizes.h60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Total Price",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: AppSizes.h8),
                      Text(
                        "\$18.90",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  CustomButton(onTap: () {}, title: "Add to Cart"),
                ],
              ),
              SizedBox(height: AppSizes.h60),
            ],
          ),
        ),
      ),
    );
  }
}
