
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/features/auth/widgets/custom_auth_btn.dart';
import 'package:mr_burger/features/shared/custom_text_form_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    GlobalKey<FormState> _key = GlobalKey<FormState>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.pw18),
              child: Form(
                key: _key,

                child: Column(
                  children: [
                    SizedBox(height: AppSizes.h100),
                    SvgPicture.asset("assets/images/logo.svg"),
                    SizedBox(height: AppSizes.h60),
                    CustomTextFormField(
                      hint: "Name",
                      isPassword: false,
                      controller: nameController,
                    ),
                    SizedBox(height: AppSizes.h10),
                    CustomTextFormField(
                      hint: "Email",
                      isPassword: false,
                      controller: emailController,
                    ),
                    SizedBox(height: AppSizes.h10),
                    CustomTextFormField(
                      hint: "Password",
                      isPassword: true,
                      controller: passwordController,
                    ),
                    SizedBox(height: AppSizes.h10),
                    CustomTextFormField(
                      hint: "ConfirmPassword",
                      isPassword: true,
                      controller: confirmPasswordController,
                    ),
                    SizedBox(height: AppSizes.h30),

                    CustomAuthBtn(
                      onTap: () {
                        if (_key.currentState!.validate()) {
                          print("success");
                        } else {
                          null;
                        }
                      },
                      text: "Sign Up",
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
