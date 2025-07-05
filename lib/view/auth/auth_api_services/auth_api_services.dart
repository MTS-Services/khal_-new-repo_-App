
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zidney/view/auth/shared_preferences_services/shared_preference_services.dart';
import '../../freePlanScreen/mainpages/main_bottom_nav_screen.dart';
import '../../screens/freePlanScreen/gettingStarted/personal_info_screen.dart';
import '../otp_screen.dart';


class AuthApiServices{

  static String baseUrl="https://aliceblue-chinchilla-213948.hostingersite.com/api/v1";
  static String verificationEmail='';

  //login
  static Future<void> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/auth/login');


    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',

      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Save token or navigate to another screen
      String? token= data["token"];

      if(token!=null){
        SharedPreferenceServices.userInformation(token: token);
        Get.to(() => MainBottomNavScreen());

      }else{
        Get.snackbar(
          "Already Logged In",
          "You have already logged in from another device.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withValues(alpha: 0.9),
          colorText: Colors.white,
          icon: Icon(Icons.warning_amber_rounded, color: Colors.white),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          borderRadius: 12,
          duration: Duration(seconds: 4),
          animationDuration: Duration(milliseconds: 300),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }


    } else {

      print('Login failed: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }


  //logout
  static Future<void> logout(String email, String password) async {
    final url = Uri.parse('$baseUrl/auth/logout');


    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',

      },
      // body: jsonEncode({
      //   'email': email,
      //   'password': password,
      // }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Save token or navigate to another screen
      String? token= data["token"];

      if(token!=null){
        SharedPreferenceServices.userInformation(token: token);
        Get.to(() => MainBottomNavScreen());

      }else{
        Get.snackbar(
          "Already Logged In",
          "You have already logged in from another device.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withValues(alpha: 0.9),
          colorText: Colors.white,
          icon: Icon(Icons.warning_amber_rounded, color: Colors.white),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          borderRadius: 12,
          duration: Duration(seconds: 4),
          animationDuration: Duration(milliseconds: 300),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }


    } else {

      print('Login failed: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }


  //registration

  static Future<void> registration({required String email,required String password,required String phoneNumber}) async {
    final url = Uri.parse('$baseUrl/auth/register');


    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',

      },
      body: jsonEncode({
        'email': email,
        'password': password,
        'phone': phoneNumber
      }),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 201) {

      verificationEmail=data["data"]["email"];

      Get.to(() => OtpScreen());

    } else {


      Get.snackbar(
        "${data["data"]["email"]}",
        "${data["data"]["phone"]}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        colorText: Colors.white,
        icon: Icon(Icons.warning_amber_rounded, color: Colors.white),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        borderRadius: 12,
        duration: Duration(seconds: 4),
        animationDuration: Duration(milliseconds: 300),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );


    }
  }


  //otp verification
  static Future<void> otpVerification({required String otp,}) async {
    final url = Uri.parse('$baseUrl/auth/verify-otp');

    print("email: $verificationEmail");
    print("opt: $otp");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',

      },
      body: jsonEncode({
        'email': verificationEmail,
        'otp': otp,

      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      Get.to(() => PersonalInfo());
    } else {


      Get.snackbar(
        "OTP Error",
        "There seems to be a problem with your OTP code. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade700.withOpacity(0.95),
        colorText: Colors.white,
        icon: Icon(Icons.error_outline, color: Colors.white, size: 28),
        shouldIconPulse: true,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        borderRadius: 14,
        padding: EdgeInsets.all(16),
        duration: Duration(seconds: 5),
        animationDuration: Duration(milliseconds: 500),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutCubic,
        boxShadows: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      );



    }
  }

  //resent code

  static Future<void> resentOtp() async {
    final url = Uri.parse('$baseUrl/auth/resent-otp');

    print("email: $verificationEmail");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',

      },
      body: jsonEncode({
        'email': verificationEmail,
      }),
    );

    final data = jsonDecode(response.body);

    print(data);
    if (response.statusCode == 200) {

    } else {


      Get.snackbar(
        "Email  Error",
        "There seems to be a problem with your OTP code. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade700.withOpacity(0.95),
        colorText: Colors.white,
        icon: Icon(Icons.error_outline, color: Colors.white, size: 28),
        shouldIconPulse: true,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        borderRadius: 14,
        padding: EdgeInsets.all(16),
        duration: Duration(seconds: 5),
        animationDuration: Duration(milliseconds: 500),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutCubic,
        boxShadows: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      );



    }
  }
}