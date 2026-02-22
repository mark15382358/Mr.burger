import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';

class CustomTextFormField extends StatefulWidget {
  final String? Function(String?)? validator; 
  final String? hint;
  final bool isPassword;
  final Widget? labelText;
  final TextEditingController controller;
  const CustomTextFormField({
    this.validator,
    this.labelText,
    super.key,
     this.hint,
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
      cursorColor: AppColors.white,
      cursorHeight: 20,
      decoration: InputDecoration(
        label: widget.labelText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(AppSizes.r30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
          borderRadius: BorderRadius.circular(AppSizes.r30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.r30),
          borderSide: BorderSide(color: AppColors.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red),
          borderRadius: BorderRadius.circular(AppSizes.r30),
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(color: AppColors.white),
        fillColor: AppColors.primary,
        filled: true,

        suffix: widget.isPassword
            ? GestureDetector(
                onTap: togglePassword,
                child: Icon(CupertinoIcons.eye),
              )
            : null,
      ),
     validator: widget.validator ?? (value) { // التعديل هنا: نستخدم الـ widget.validator أولاً
  if (value == null || value.trim().isEmpty) {
    return "Please Enter the ${widget.hint}";
  }
  return null;
},
      obscureText: obsecureText,
    );
  }
}
