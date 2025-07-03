import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/common/custom_background_image.dart';
import 'package:zidney/utils/common/custom_bottom_shape.dart';
import 'package:zidney/view/auth/auth_api_services/auth_api_services.dart';
import 'package:zidney/view/auth/create_account_screen.dart';
import 'package:zidney/view/freePlanScreen/mainpages/main_bottom_nav_screen.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_button.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_text_form_field.dart';

import '../screens/freePlanScreen/questionquiz/widgets/custom_logo.dart';

class LoginScreen1 extends StatefulWidget {
   LoginScreen1({super.key});

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  //controller
  final TextEditingController _emailTEController=TextEditingController(text: "admin@dev.com");

  final TextEditingController _passwordTEController=TextEditingController(text: "admin@dev.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          CustomBackground(image: AssetPath.appBackgroundPng),
          // Positioned bottom container
          CustomBottomShape(
            buttonText: 'Create Account',
            onTap: () {
              Get.to(() => CreateAccountScreen());
            },
          ),
          // Main content inside the Column
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomLogo(
                  titleText: 'Welcome to Zidney',
                  subTitleText: 'We missed you',
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  hintText: 'example@gmail.com',
                  labelText: 'Email',
                  controller: _emailTEController,
                ),
                CustomTextFormField(
                    hintText: '*******',
                    labelText: 'Password',
                    controller: _passwordTEController,
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  width: AppStyles.screenHeightPercentage(context, 0.15),
                  onTap: () {

                    AuthApiServices.login(_emailTEController.text.trim(), _passwordTEController.text);

                    //Get.to(() => MainBottomNavScreen());
                  },
                  buttonText: 'Login',
                  prefix: Image.asset(AssetPath.logInIcon, height: 25),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
