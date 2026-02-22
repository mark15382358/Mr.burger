import 'package:flutter/material.dart';
import 'package:mr_burger/core/constants/app_strings.dart';
import 'package:mr_burger/main_screen.dart';

class GuestWidget extends StatelessWidget {
  const GuestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (BuildContext context) => MainScreen()),
        );
      },

      child: Text(
        AppStrings.continueAsGuest,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
