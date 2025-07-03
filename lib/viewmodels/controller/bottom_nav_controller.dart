import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zidney/view/freePlanScreen/mainpages/bookmark_screen.dart';
import 'package:zidney/view/freePlanScreen/mainpages/dashboard_screen.dart';
import 'package:zidney/view/freePlanScreen/mainpages/home_screen.dart';
import 'package:zidney/view/freePlanScreen/mainpages/menu_screen.dart';

class BottomNavController extends GetxController {
  final screens = [
    HomeScreen(),
    BookmarkScreen(),
    DashboardScreen(),
    MenuScreen(),
  ];

  var selectedIndex = 0.obs;

  var customChild = Rx<Widget?>(null);

  void changeIndex(int index) {
    selectedIndex.value = index;
    customChild.value = null; // Clear custom child when navigating via bottom nav
  }

  void openWithChild(Widget widget) {
    customChild.value = widget;
  }
}
