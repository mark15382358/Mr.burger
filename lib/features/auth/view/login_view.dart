import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/features/auth/widgets/custom_auth_btn.dart';
import 'package:mr_burger/features/shared/custom_text.dart';
import 'package:mr_burger/features/shared/custom_text_form_field.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.pw18),
                child: Column(
                  children: [
                    SizedBox(height: AppSizes.h100),
                    SvgPicture.asset("assets/images/logo.svg"),
                    SizedBox(height: AppSizes.h10),
                    Text(
                      "Welcome Back, Discover The Fast Food",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(height: AppSizes.h70),
                    CustomTextFormField(
                      hint: "Email Address",
                      isPassword: false,
                      controller: emailController,
                    ),
                    SizedBox(height: AppSizes.h20),
                    CustomTextFormField(
                      hint: "Password",
                      isPassword: true,
                      controller: passwordController,
                    ),
                    SizedBox(height: AppSizes.h30),
                    CustomAuthBtn(
                      onTap: () {
                        if (_key.currentState!.validate()) {
                          print("success");
                        } else {
                          return null;
                        }
                      },
                      text: "Login",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
