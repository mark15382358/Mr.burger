import 'package:flutter/material.dart';
import 'package:mr_burger/checkout/widgets/custom_checkout_text.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.h20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order summary",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: AppSizes.sp20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: AppSizes.h20),
            CustomCheckoutText(
              text: "Order",
              sale: "\$16.48",
              style: Theme.of(context).textTheme.labelSmall!,
            ),
            SizedBox(height: AppSizes.h10),
            CustomCheckoutText(
              text: "Taxes",
              sale: "\$0.3",

              style: Theme.of(context).textTheme.labelSmall!,
            ),
            SizedBox(height: AppSizes.h10),
            CustomCheckoutText(
              text: "Delivery fees",
              sale: "\$1.5",
              style: Theme.of(context).textTheme.labelSmall!,
            ),
            SizedBox(height: AppSizes.h10),
            Divider(),
            CustomCheckoutText(
              sale: "\$18.19:",
              text: "Total:",
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: AppSizes.h10),
            CustomCheckoutText(
              sale: "15 - 30 mins",
              text: "Estimated delivery time:",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.sp14,
              ),
            ),
            SizedBox(height: AppSizes.h70),
            Text(
              "Payment methods",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: AppSizes.h30 ),
          ],
        ),
      ),
    );
  }
}
