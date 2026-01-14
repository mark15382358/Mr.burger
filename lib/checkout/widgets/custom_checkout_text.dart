import 'package:flutter/material.dart';

class CustomCheckoutText extends StatelessWidget {
  final String text;
  final String sale;
  final TextStyle style;
  const CustomCheckoutText({
    super.key,
    required this.sale,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: style),
        Text(sale, style: style),
      ],
    );
  }
}
