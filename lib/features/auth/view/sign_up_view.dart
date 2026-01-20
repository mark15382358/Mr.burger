import 'package:flutter/material.dart';
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: true,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.h118),
                      child: SvgPicture.asset(
                        "assets/images/logo.svg",
                        // ignore: deprecated_member_use
                        color: AppColors.primary,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSizes.r30),
                          topRight: Radius.circular(AppSizes.r30),
                        ),
                      ),
                      padding: EdgeInsets.all(AppSizes.h30),
                      child: Form(
                        key: _key,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextFormField(
                              hint: "Name",
                              controller: nameController,
                              isPassword: false,
                            ),
                            SizedBox(height: AppSizes.h15),
                            CustomTextFormField(
                              hint: "Email",
                              controller: emailController,
                              isPassword: false,
                            ),
                            SizedBox(height: AppSizes.h15),
                            CustomTextFormField(
                              hint: "Password",
                              isPassword: true,
                              controller: passwordController,
                            ),
                            SizedBox(height: AppSizes.h15),
                            CustomTextFormField(
                              hint: "Confirm Password",
                              isPassword: true,
                              controller: confirmPasswordController,
                            ),
                            SizedBox(height: AppSizes.h40),
                            CustomAuthBtn(
                              onTap: () {
                                if (_key.currentState!.validate()) {}
                              },
                              text: "Sign Up",
                            ),
                            SizedBox(height: AppSizes.h20),

                            CustomAuthBtn(
                              onTap: () {
                                if (_key.currentState!.validate()) {}
                              },
                              text: "Sign Up",
                            ),
                            SizedBox(height: AppSizes.h20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
