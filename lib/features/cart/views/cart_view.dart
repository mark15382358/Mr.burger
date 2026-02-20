import 'package:flutter/material.dart';
import 'package:mr_burger/features/checkout/view/checkout_view.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/features/cart/widgets/cart_item.dart';
import 'package:mr_burger/features/shared/custom_button.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int number = 1;
  int itemCount = 20;
  late List<int> quantities = [];
  @override
  void initState() {
    quantities = List.generate(20, (_) => 1);
    super.initState();
  }

  void onAdd(index) {
    setState(() {
      quantities[index]++;
    });
  }

  void onMinus(index) {
    setState(() {
      if (quantities[index] > 1) {
        quantities[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: AppSizes.h10),
                itemCount: quantities.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return CartItem(
                    number: quantities[index],
                    title: 'Hamburger',
                    description: " Veggie Burger ",
                    image: "assets/images/booo.png",
                    onAdd: () {
                      onAdd(index);
                    },
                    onMinus: () {
                      onMinus(index);
                    },
                    onRemove: () {},
                  );
                },
              ),
            ),

            Container(
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => CheckoutView(),
                        ),
                      );
                    },
                    title: "Checkout",
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
