import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/core/constants/app_strings.dart';
import 'package:mr_burger/core/shared/shared_widgets/debit_card_widget.dart';
import 'package:mr_burger/features/auth/data/remote_datasource/update_profile_params.dart';
import 'package:mr_burger/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:mr_burger/features/auth/presentation/controller/cubit/auth_state.dart';
import 'package:mr_burger/features/auth/presentation/view/login_view.dart';
import 'package:mr_burger/features/shared/custom_button.dart';
import 'package:mr_burger/features/shared/custom_text_form_field.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    context.read<AuthCubit>().getProfile();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.all(AppSizes.h10),
              child: Icon(Icons.settings, color: AppColors.white),
            ),
          ],
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is GetProfileSuccess) {
              nameController.text = state.profile.name;
              emailController.text = state.profile.email;
              addressController.text = state.profile.address ?? "";
            }
            if (state is PickProfileImageSuccess) {
              pickedImage = state.image;
            }
            if (state is UpdateProfileSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.green,
                ),
              );
            }
            if (state is LogoutSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Logged out successfully")),
              );

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginView(),
                ),
              );
            }
          },
          builder: (context, state) {
            // if (state is GetProfileLoading) {
            //   return Center(
            //     child: CircularProgressIndicator(color: AppColors.white),
            //   );
            // }
            bool isSkeletonEnabled = state is GetProfileLoading;
            return Skeletonizer(
              enabled: isSkeletonEnabled,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppSizes.h20),
                child: Column(
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () => context.read<AuthCubit>().pickImage(),
                        child: Container(
                          height: AppSizes.h140,
                          width: AppSizes.w120,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(AppSizes.r30),
                            border: Border.all(
                              color: AppColors.grey,
                              width: AppSizes.w5,
                            ),
                            image: DecorationImage(
                              image: pickedImage != null
                                  ? FileImage(pickedImage!) as ImageProvider
                                  : NetworkImage(
                                      state is GetProfileSuccess
                                          ? state.profile.image
                                          : "https://tse4.mm.bing.net/th/id/OIP.hGSCbXlcOjL_9mmzerqAbQHaHa?pid=Api&P=0&h=220",
                                    ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.h50),

                    CustomTextFormField(
                      labelText: const Text(AppStrings.name),
                      controller: nameController,
                      isPassword: false,
                    ),
                    SizedBox(height: AppSizes.h36),

                    CustomTextFormField(
                      labelText: const Text(AppStrings.email),
                      controller: emailController,
                      isPassword: false,
                    ),
                    SizedBox(height: AppSizes.h36),

                    CustomTextFormField(
                      labelText: const Text(AppStrings.address),
                      controller: addressController,
                      isPassword: false,
                    ),
                    SizedBox(height: AppSizes.h36),

                    Divider(color: AppColors.white),
                    DebitCardWidget(
                      groupValue: AppStrings.debit,
                      onChanged: (v) {},
                    ),
                    SizedBox(height: AppSizes.h36),

                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: state is UpdateProfileLoading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.white,
                                  ),
                                )
                              : CustomButton(
                                  onTap: () {
                                    context.read<AuthCubit>().updateProfile(
                                      UpdateProfileParams(
                                        name: nameController.text,
                                        email: emailController.text,
                                        address: addressController.text,
                                        image: pickedImage,
                                      ),
                                    );
                                  },
                                  title: AppStrings.updateProfile,
                                  colors: AppColors.white,
                                  textColor: AppColors.primary,
                                  icon: Icon(
                                    Icons.save,
                                    color: AppColors.primary,
                                  ),
                                ),
                        ),
                        SizedBox(width: AppSizes.w10),
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                            onTap: () {
                              context.read<AuthCubit>().logout();
                            },
                            title: AppStrings.logout,
                            colors: AppColors.primary,
                            textColor: AppColors.white,
                            icon: Icon(Icons.logout, color: AppColors.white),
                          ),
                        ),
                      ],
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
