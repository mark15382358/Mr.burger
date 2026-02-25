import 'package:flutter/material.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/features/home/domain/entity/product_entity.dart';
import 'package:mr_burger/features/home/presentation/widget/card_item.dart';
import 'package:mr_burger/features/product/product_details_view.dart';

class ViewItem extends StatelessWidget {
  final List<ProductEntity> products;
  final int productLength;

  const ViewItem({super.key, required this.products, required this.productLength});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 80, color: AppColors.grey),
            SizedBox(height: 16),
            Text(
              "No burgers found!",
              style: TextStyle(fontSize: 18, color: AppColors.grey, fontWeight: FontWeight.bold),
            ),
            Text("Try searching for something else", style: TextStyle(color: AppColors.grey)),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductDetailsView()),
            );
          },
          child: CardItem(
            price: product.price,
            isFavorite: product.isFavorite,
            productId: product.id,
            title: product.name,
            description: product.description,
            image: product.image,
            rate: product.rating.toString(),
          ),
        );
      },
    );
  }
}