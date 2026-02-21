import 'package:flutter/material.dart';
import 'package:mr_burger/main_screen.dart';

class GuestWidget extends StatelessWidget {
  const GuestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => MainScreen()),
        );
      },

      child: Text(
        "Continue as a guest?",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
