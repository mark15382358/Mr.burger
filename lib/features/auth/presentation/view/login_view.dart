import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/core/constants/app_strings.dart';
import 'package:mr_burger/core/utils/service_locator.dart'; // تأكد من استيراد sl
import 'package:mr_burger/core/utils/validators.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/login_params.dart';
import 'package:mr_burger/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:mr_burger/features/auth/presentation/controller/cubit/auth_state.dart';
import 'package:mr_burger/features/auth/presentation/view/sign_up_view.dart';
import 'package:mr_burger/features/auth/presentation/widgets/auth_header_widget.dart';
import 'package:mr_burger/features/auth/presentation/widgets/custom_auth_btn_widget.dart';
import 'package:mr_burger/features/auth/presentation/widgets/guest_widget.dart';
import 'package:mr_burger/features/shared/custom_text_form_field.dart';
import 'package:mr_burger/main_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: AppColors.green,
                  ),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MainScreen(),
                  ),
                );
              } else if (state is LoginError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: AppColors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: screenHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: screenHeight * 0.4,
                          color: AppColors.white,
                          child: AuthHeaderWidget(isLogin: true),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppSizes.r30),
                                topRight: Radius.circular(AppSizes.r30),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.w20,
                              vertical: AppSizes.h20,
                            ),
                            child: Form(
                              key: _key,
                              child: Column(
                                children: [
                                  SizedBox(height: AppSizes.h20),
                                  CustomTextFormField(
                                    hint: AppStrings.emailaddress,
                                    isPassword: false,
                                    controller: emailController,
                                    validator: AppValidator.validateEmail,
                                  ),
                                  SizedBox(height: AppSizes.h20),
                                  CustomTextFormField(
                                    hint: AppStrings.password,
                                    isPassword: true,
                                    controller: passwordController,
                                    validator: AppValidator.validatePassword,
                                  ),
                                  SizedBox(height: AppSizes.h40),

                                  state is LoginLoading
                                      ? CircularProgressIndicator(
                                          color: AppColors.white,
                                        )
                                      : CustomAuthBtnWidget(
                                          onTap: () {
                                            if (_key.currentState!.validate()) {
                                              context
                                                  .read<AuthCubit>()
                                                  .loginUser(
                                                    LoginParams(
                                                      email:
                                                          emailController.text,
                                                      password:
                                                          passwordController
                                                              .text,
                                                    ),
                                                  );
                                            }
                                          },
                                          text: AppStrings.login,
                                          colorButton: AppColors.white,
                                          colorText: AppColors.primary,
                                        ),
                                  SizedBox(height: AppSizes.h20),
                                  CustomAuthBtnWidget(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignUpView(),
                                        ),
                                      );
                                    },
                                    text: AppStrings.createAccount,
                                    colorButton: AppColors.primary,
                                    colorText: AppColors.white,
                                  ),
                                  const Spacer(),
                                  const GuestWidget(),
                                  SizedBox(height: AppSizes.h10),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
