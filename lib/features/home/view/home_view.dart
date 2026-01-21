import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/features/home/widget/user_headers.dart';
import 'package:mr_burger/features/home/widget/view_item.dart';
import 'package:mr_burger/features/product/widgets/topping_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List category = ["All", "Combo", "Sliders", "Small", "Mediam", "Large"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(AppSizes.pw20),
          child: Column(
            children: [
              SizedBox(height: AppSizes.h80),
              UserHeaders(),
              SizedBox(height: AppSizes.h20),
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(AppSizes.r16),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(CupertinoIcons.search),
                    hintText: "Search....",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSizes.r16),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSizes.r16),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.h24),
              SizedBox(
                height: AppSizes.h50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? AppColors.primary
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(AppSizes.r20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.h27,
                          vertical: AppSizes.h16,
                        ),
                        child: Center(
                          child: Text(
                            "${category[index]}",
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ViewItem(),
            ],
          ),
        ),
      ),
    );
  }
}
