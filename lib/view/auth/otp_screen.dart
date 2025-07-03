import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/common/custom_background_image.dart';
import 'package:zidney/utils/common/custom_bottom_shape.dart';
import 'package:zidney/view/auth/auth_api_services/auth_api_services.dart';
import 'package:zidney/view/screens/freePlanScreen/gettingStarted/personal_info_screen.dart';

import '../screens/freePlanScreen/questionquiz/widgets/custom_button.dart';
import '../screens/freePlanScreen/questionquiz/widgets/custom_logo.dart';
import '../screens/freePlanScreen/questionquiz/widgets/custom_text_form_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int secondRemaining = 30;
  bool enableResend = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    enableResend = false;
    secondRemaining = 30;
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondRemaining > 0) {
        setState(() => secondRemaining--);
      } else {
        setState(() => enableResend = true);
        timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  //controller

  final TextEditingController _firstDigitOtp=TextEditingController();
  final TextEditingController _secondDigitOtp=TextEditingController();
  final TextEditingController _thirdDigitOtp=TextEditingController();
  final TextEditingController _fourDigitOtp=TextEditingController();







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomBackground(image: AssetPath.appBackgroundPng),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomLogo(
                    titleText: 'Welcome to Zidney',
                    subTitleText: 'Sent on OTP to ex********mail.com',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(child: CustomTextFormField(controller: _firstDigitOtp,)),
                        SizedBox(width: 20),
                        Expanded(child: CustomTextFormField(controller: _secondDigitOtp,)),
                        SizedBox(width: 20),
                        Expanded(child: CustomTextFormField(controller: _thirdDigitOtp,)),
                        SizedBox(width: 20),
                        Expanded(child: CustomTextFormField(controller: _fourDigitOtp,)),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        backgroundColor: Colors.grey,
                        shadowColor: AppColors.greyShadow,
                        onTap: () {
                          if (enableResend) {
                            startTimer();
                            AuthApiServices.resentOtp();
                          }
                        },
                        buttonText:
                            enableResend
                                ? 'Resend OTP'
                                : 'Resent OTP in ${secondRemaining}s',
                      ),
                      SizedBox(width: 30),
                      CustomButton(

                        onTap: (){
                          String allOtpCode="${_firstDigitOtp.text}${_secondDigitOtp.text}${_thirdDigitOtp.text}${_fourDigitOtp.text}";
                          AuthApiServices.otpVerification(otp: allOtpCode);

                        },

                        buttonText: 'Verify',
                        suffix: Icon(
                          Icons.double_arrow_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          CustomBottomShape(showTextButton: true),
        ],
      ),
    );
  }
}
