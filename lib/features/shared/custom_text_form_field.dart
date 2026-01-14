import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_burger/core/constants/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.isPassword,
    required this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obsecureText;
  @override
  void initState() {
    obsecureText = widget.isPassword;
    super.initState();
  }

  void togglePassword() {
    setState(() {
      obsecureText = !obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColors.primary,
      cursorHeight: 20,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: widget.hint,
        fillColor: Colors.white,
        filled: true,

        suffix: widget.isPassword
            ? GestureDetector(
                onTap: togglePassword,
                child: Icon(CupertinoIcons.eye),
              )
            : null,
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Please Enter the ${widget.hint}";
        } else {
        return  null;
        }
      },
      obscureText: obsecureText,
    );
  }
}
