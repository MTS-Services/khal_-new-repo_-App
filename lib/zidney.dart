import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zidney/test_screen.dart';
import 'package:zidney/utils/theme_data.dart';
import 'package:zidney/view/auth/language_screen.dart';
import 'package:zidney/view/freePlanScreen/mainpages/bookmark_screen.dart';
import 'package:zidney/view/freePlanScreen/mainpages/home_screen.dart';
import 'package:zidney/view/freePlanScreen/mainpages/main_bottom_nav_screen.dart';
import 'package:zidney/view/screens/freePlanScreen/gettingStarted/personal_info_screen.dart';
import 'package:zidney/view/screens/freePlanScreen/menusubpages/plans.dart';


class Zidney extends StatelessWidget {
  const Zidney({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themData(),
          home: BookmarkScreen()
        );
      },
    );
  }
}
