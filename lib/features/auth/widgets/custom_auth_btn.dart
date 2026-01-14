import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/features/shared/custom_text.dart';

class CustomAuthBtn extends StatelessWidget {
  final Function()? onTap;
  final String text;
  CustomAuthBtn({required this.onTap, super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
       
          child: Text("$text", style: Theme.of(context).textTheme.titleSmall),
        ),
      ),
    );
  }
}
