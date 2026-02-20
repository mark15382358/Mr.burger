import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/features/auth/presentation/view/sign_up_view.dart';
import 'package:mr_burger/features/auth/presentation/widgets/auth_header_widget.dart';
import 'package:mr_burger/features/auth/presentation/widgets/custom_auth_btn_widget.dart';
import 'package:mr_burger/features/auth/presentation/widgets/guest_widget.dart';
import 'package:mr_burger/features/shared/custom_text.dart';
import 'package:mr_burger/features/shared/custom_text_form_field.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: screenHeight * 0.4,
                color: AppColors.white,
                child: AuthHeaderWidget(isLogin: true),
              ),
              Container(
                width: double.infinity,
                height: screenHeight * 0.6,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.r30),
                    topRight: Radius.circular(AppSizes.r30),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.w20,
                  vertical: AppSizes.h30,
                ),
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      SizedBox(height: AppSizes.h20),
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
                      SizedBox(height: AppSizes.h40),
                      CustomAuthBtnWidget(
                        onTap: () {
                          if (_key.currentState!.validate()) {}
                        },
                        text: "Login",
                        colorButton: AppColors.white,
                        colorText: AppColors.primary,
                      ),
                      SizedBox(height: AppSizes.h20),

                      CustomAuthBtnWidget(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SignUpView(),
                            ),
                          );
                        },
                        text: "Create Account ?",
                        colorButton: AppColors.primary,
                        colorText: AppColors.white,
                      ),
                      SizedBox(height: AppSizes.h20),
                      GuestWidget(),
                      SizedBox(height: AppSizes.h20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
