import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/styles/app_text_styles.dart';
import 'package:zidney/view/screens/freePlanScreen/menusubpages/plans.dart';
import 'package:zidney/viewmodels/controller/bottom_nav_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.showTitle = false,
    this.title = '',
    this.classTitle = '',
    this.showAction = true,
    this.showActionIcon = false,
  });

  final bool showTitle;
  final String title;
  final String classTitle;
  final bool showAction;
  final bool showActionIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AppBar(
        leading: IconButton(
          onPressed: () {
            final navController = Get.find<BottomNavController>();
            if (navController.customChild.value == null) {
              Get.back();
            } else {
              navController.customChild.value = null;
            }
          },
          icon: Icon(Icons.arrow_back),
        ),
        automaticallyImplyLeading: false,
        title: showTitle
            ? Transform.translate(
          offset: Offset(-20, 0),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.primaryColor.value,
                    width: 2,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.regular14.apply(
                      fontSizeFactor: 1.5,
                    ),
                  ),
                  Text(
                    classTitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
            : SizedBox.fromSize(),
        actions: showAction
            ? [
          showActionIcon
              ? Image.asset('assets/images/bookmark_icon.png', scale: 3)
              : InkWell(
            onTap: () {
              Get.to(() => Plans());
            },
            child: Row(
              spacing: 10,
              children: [
                Text(
                  'Premium',
                  style: AppTextStyle.bold14.apply(
                    color: AppColors.secondaryColor.value,
                  ),
                ),
                SvgPicture.asset(
                  AssetPath.vector,
                  height: 23,
                  width: 23,
                ),
              ],
            ),
          ),
        ]
            : [],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
