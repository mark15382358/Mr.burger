import 'package:flutter/material.dart';
import 'package:mr_burger/features/home/presentation/view/product_view.dart';
import 'package:mr_burger/features/home/presentation/widget/category_list.dart';
import 'package:mr_burger/features/home/presentation/widget/home_search_bar.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/features/home/presentation/widget/user_headers.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(AppSizes.pw20),
          child: Column(
            children: [
              SizedBox(height: AppSizes.h80),
              const UserHeaders(),
              SizedBox(height: AppSizes.h20),

              const HomeSearchBar(),

              SizedBox(height: AppSizes.h24),

              const CategoriesList(),

              const Expanded(child: ProductsView()),
            ],
          ),
        ),
      ),
    );
  }
}
