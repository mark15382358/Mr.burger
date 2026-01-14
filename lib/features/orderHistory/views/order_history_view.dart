import 'package:flutter/material.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/features/cart/widgets/cart_item.dart';
import 'package:mr_burger/features/shared/custom_button.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: AppSizes.h10),
              itemCount: 50,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Image.asset("assets/images/booo.png"),
                                ],
                              ),
                              SizedBox(width: AppSizes.w30),
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Text(
                                      "AHA",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: AppSizes.h10,
                                    ),
                                    child: Text(
                                      "Qty:x3",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Text(
                                      "price : 20\$",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: AppSizes.h20),
                          CustomButton(
                            onTap: () {},
                            title: "Order Again",
                            colors: Colors.grey.shade400,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
