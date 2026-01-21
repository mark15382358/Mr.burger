import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mr_burger/core/constants/app_colors.dart';
import 'package:mr_burger/core/constants/app_sizes.dart';
import 'package:mr_burger/core/shared/shared_widgets/debit_card_widget.dart';
import 'package:mr_burger/features/shared/custom_button.dart';
import 'package:mr_burger/features/shared/custom_text_form_field.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final selectedMethod = "debit";
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          actions: [
            Padding(
              padding: EdgeInsets.all(AppSizes.h10),
              child: Icon((Icons.settings), color: AppColors.white),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.h20),
            child: Container(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: AppSizes.h140,
                      width: AppSizes.w120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/mark.jpg"),
                          fit: BoxFit.cover,
                        ),
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(AppSizes.r30),
                        border: Border.all(
                          color: AppColors.grey,
                          width: AppSizes.w5,
                        ),
                      ),
                      // child: Image.asset(""),
                    ),
                  ),
                  SizedBox(height: AppSizes.h50),
                  CustomTextFormField(
                    labelText: Text("Name"),
                    hint: "Mark",
                    isPassword: false,
                    controller: email,
                  ),
                  SizedBox(height: AppSizes.h36),

                  CustomTextFormField(
                    labelText: Text("Email"),
                    hint: "markkhristo@gmail.com",
                    isPassword: false,
                    controller: email,
                  ),
                  SizedBox(height: AppSizes.h36),

                  CustomTextFormField(
                    labelText: Text("Address"),
                    hint: "Egypt-Cairo",
                    isPassword: false,
                    controller: email,
                  ),
                  SizedBox(height: AppSizes.h36),
                  Divider(),
                  DebitCardWidget(
                    groupValue: selectedMethod,
                    onChanged: (value) {
                      // selectedMethod = value;
                    },
                  ),
                  SizedBox(height: AppSizes.h36),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: CustomButton(
                          onTap: () {},
                          title: "Edit Profile",
                          colors: AppColors.white,
                          textColor: AppColors.primary,
                          icon: Icon(Icons.edit, color: AppColors.primary),
                        ),
                      ),
                      SizedBox(width: AppSizes.w20),
                      Expanded(
                        child: CustomButton(
                          onTap: () {},
                          title: "Log out",
                          colors: AppColors.primary,
                          textColor: AppColors.white,
                          icon: Icon(
                            Icons.login_outlined,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.h36),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
