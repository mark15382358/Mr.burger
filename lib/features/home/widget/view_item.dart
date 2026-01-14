import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_burger/features/home/widget/card_item.dart';
import 'package:mr_burger/features/product/product_details_view.dart';

class ViewItem extends StatelessWidget {
  const ViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(0),

        itemCount: 50,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailsView()),
              );
            },
            child: CardItem(
              title: "Cheeseburger",
              description: "Wendy's Burger ",
              image: "assets/images/booo.png",
              rate: "4.9",
            ),
          );
        },
      ),
    );
  }
}
