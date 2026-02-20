import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_burger/features/checkout/widgets/custom_checkout_text.dart';
import 'package:mr_burger/features/checkout/widgets/success_dialog.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/core/shared/shared_widgets/debit_card_widget.dart';
import 'package:mr_burger/features/shared/custom_button.dart';

class CheckoutView extends StatefulWidget {
  CheckoutView({super.key});
  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedMethod = "cash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Container(
        height: AppSizes.h100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.r20),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey,
              offset: Offset(0, 1),
              blurRadius: AppSizes.r20,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(AppSizes.h16),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Price",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: AppSizes.h4),
                  Text(
                    "\$18.90",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              CustomButton(
                onTap: () {
                  SuccessDialog.show(context);
                },
                title: "Pay Now",
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.h20),
        child: SingleChildScrollView(
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
              SizedBox(height: AppSizes.h30),
              Container(
                height: AppSizes.h70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.h20),
                  color: AppColors.cashColor,
                ),
                child: ListTile(
                  title: Text(
                    "Cach on delivery",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  trailing: Radio<String>(
                    value: "cash",
                    activeColor: AppColors.white,
                    groupValue: selectedMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedMethod = value!;
                      });
                    },
                  ),
                  leading: Image.asset(
                    "assets/images/cash_icon.png",
                    width: AppSizes.w48,
                  ),
                ),
              ),
              SizedBox(height: AppSizes.h30),

              DebitCardWidget(
                groupValue: selectedMethod,
                onChanged: (value) {
                  setState(() {
                    selectedMethod = value!;
                  });
                },
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.red,
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text(
                    "Save card details for future payments",
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(color: AppColors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
