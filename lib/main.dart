import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:zidney/api_services/api_urls.dart';
import 'package:zidney/test_screen.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/viewmodels/controller/payment_controller.dart';
import 'api_services/course_api_service.dart';
import 'controller/course/course_controller.dart';
import 'stripe_services/services.dart';
import 'package:get/get.dart';
import 'package:zidney/viewmodels/controller/bottom_nav_controller.dart';
import 'package:zidney/zidney.dart';

void main() async{

  _setup();
  runApp(const Zidney());
}


Future<void> _setup()async{
  Get.put(BottomNavController());
  Get.put(AppColors());
  Get.put(PaymentController());
  Get.put(AppTestColors());
  Get.put(CourseController());


  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey=stripePublishableKey;
}