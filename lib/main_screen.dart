import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/features/auth/view/profile_view.dart';
import 'package:mr_burger/features/cart/views/cart_view.dart';
import 'package:mr_burger/features/home/view/home_view.dart';
import 'package:mr_burger/features/orderHistory/views/order_history_view.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController pageController;

  int currentScreen = 0;

  late List<Widget> screens;
  void initState() {
    screens = [HomeView(), CartView(), OrderHistoryView(), ProfileView()];
    pageController = PageController(initialPage: currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(AppSizes.h10),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.r30),
            topRight: Radius.circular(AppSizes.r30),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: currentScreen,
          onTap: (index) => {
            setState(() {
              currentScreen = index;
            }),
            pageController.jumpToPage(currentScreen),
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_restaurant),
              label: "Order History",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        children: screens,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
