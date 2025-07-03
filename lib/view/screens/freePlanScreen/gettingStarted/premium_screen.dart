import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/common/custom_background_image.dart';
import 'package:zidney/view/freePlanScreen/mainpages/main_bottom_nav_screen.dart';
import 'package:zidney/view/screens/freePlanScreen/menusubpages/plans.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_button.dart';

import '../../../../utils/app_style.dart';
import '../../../../utils/asset_path.dart';
import '../../../../utils/styles/app_text_styles.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomBackground(image: AssetPath.appBackgroundtow),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppStyles.screenHeightPercentage(context, 0.2),
                ),
                Center(
                  child: SvgPicture.asset(
                    AssetPath.vector,
                    width: 64,
                    height: 64,
                  ),
                ),
                SizedBox(
                  height: AppStyles.screenHeightPercentage(context, 0.02),
                ),
                Text("Zidney Premium ", style: AppTextStyle.bold20),
                Text("Starts at \$9.99 only", style: AppTextStyle.regular16),
                SizedBox(
                  height: AppStyles.screenHeightPercentage(context, 0.05),
                ),

                featureRow(
                  context,
                  "Unlimited attempts",
                  AssetPath.vectorInfinity,
                ),
                SizedBox(
                  height: AppStyles.screenHeightPercentage(context, 0.02),
                ),

                featureRow(
                  context,
                  "Access to all questions",
                  AssetPath.accessIcon,
                ),
                SizedBox(
                  height: AppStyles.screenHeightPercentage(context, 0.02),
                ),

                featureRow(
                  context,
                  "Access to solutions",
                  AssetPath.sulationIcon,
                ),
                SizedBox(
                  height: AppStyles.screenHeightPercentage(context, 0.02),
                ),

                featureRow(context, "Priority support", AssetPath.priorityIcon),
                SizedBox(height: 32.h),
                CustomButton(
                  onTap: () {
                    Get.to(() => Plans());
                  },
                  width: AppStyles.screenWidthPercentage(context, 0.4),
                  buttonText: "Get stared",
                  backgroundColor: AppColors.secondaryColor,
                  shadowColor: AppColors.secondaryShadow,
                  prefix: Image.asset(AssetPath.logInIcon, scale: 4),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 0,
            right: 0,
            child: TextButton.icon(
              onPressed: () => Get.to(() => MainBottomNavScreen()),
              label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Skip For Now", style: AppTextStyle.bold14),
                  Icon(Icons.double_arrow_outlined),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget featureRow(
    BuildContext context,
    String text,
    String imageAssetPath, {
    double iconWidth = 24,
    TextStyle? textStyle,
  }) {
    final isSvg = imageAssetPath.toLowerCase().endsWith('.svg');

    return Padding(
      padding: const EdgeInsets.only(left: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isSvg
              ? SvgPicture.asset(imageAssetPath, width: iconWidth)
              : Image.asset(
                imageAssetPath,
                width: iconWidth,
                height: iconWidth,
              ),
          SizedBox(width: AppStyles.screenWidthPercentage(context, 0.03)),
          Text(text, style: textStyle ?? AppTextStyle.bold14),
        ],
      ),
    );
  }
}
