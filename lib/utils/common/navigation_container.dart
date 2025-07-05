import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zidney/utils/asset_path.dart';

import '../../viewmodels/controller/bottom_nav_controller.dart';
import '../../viewmodels/controller/payment_controller.dart';
import '../app_colors.dart';

class NavigationContainer extends StatelessWidget {
  const NavigationContainer({super.key, required this.navController});

  final BottomNavController navController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: PaymentController.isPaymentSuccess.value?Color(0xfff1ebf4):AppColors.navigationColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: navController.selectedIndex.value,
            onTap: navController.changeIndex,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetPath.homeIcon,
                  scale: 3,
                  color:
                      navController.selectedIndex.value == 0
                          ? AppColors.primaryColor.value
                          : Color(0xFF4D3D36),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetPath.bookmarkIcon,
                  scale: 3,
                  color:
                      navController.selectedIndex.value == 1
                          ? AppColors.primaryColor.value
                          : Color(0xFF4D3D36),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetPath.dashBoardIcon,
                  scale: 3,
                  color:
                      navController.selectedIndex.value == 2
                          ? AppColors.primaryColor.value
                          : Color(0xFF4D3D36),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetPath.menuIcon,
                  scale: 16,
                  color:
                      navController.selectedIndex.value == 3
                          ? AppColors.primaryColor.value
                          : Color(0xFF4D3D36),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
