import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zidney/utils/common/navigation_container.dart';
import 'package:zidney/viewmodels/controller/bottom_nav_controller.dart';

class MainBottomNavScreen extends StatelessWidget {
  MainBottomNavScreen({super.key});

  final BottomNavController navController = Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        body:
            navController.customChild.value ??
            navController.screens[navController.selectedIndex.value],
        bottomNavigationBar: NavigationContainer(navController: navController),
      ),
    );
  }
}
