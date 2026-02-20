import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/core/utils/service_locator.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/register_params.dart';
import 'package:mr_burger/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:mr_burger/features/auth/presentation/controller/cubit/auth_state.dart';
import 'package:mr_burger/features/auth/presentation/widgets/auth_header_widget.dart';
import 'package:mr_burger/features/auth/presentation/widgets/custom_auth_btn_widget.dart';
import 'package:mr_burger/features/shared/custom_text_form_field.dart';
import 'package:mr_burger/main_screen.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? profileImage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: true,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Success! Welcome to Mr. Burger")),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MainScreen(),
                ),
              );
            } else if (state is RegisterError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(AppSizes.h30),

                          child: AuthHeaderWidget(isLogin: false),
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
                            key: formKey,
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
                                  hint: "Phone",
                                  controller: phoneController,
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

                                state is RegisterLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : CustomAuthBtnWidget(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          if (formKey.currentState!
                                              .validate()) {
                                            context
                                                .read<AuthCubit>()
                                                .registerUser(
                                                  RegisterParams(
                                                    name: nameController.text,
                                                    email: emailController.text,
                                                    password:
                                                        passwordController.text,
                                                    image: profileImage,
                                                    phone: phoneController.text,
                                                  ),
                                                );
                                          }
                                        },
                                        text: "Sign Up",
                                      ),

                                SizedBox(height: AppSizes.h20),
                                CustomAuthBtnWidget(
                                  colorButton: AppColors.primary,
                                  colorText: AppColors.white,
                                  onTap: () => Navigator.pop(context),
                                  text: "Go To Login ?",
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
            );
          },
        ),
      ),
    );
  }
}
