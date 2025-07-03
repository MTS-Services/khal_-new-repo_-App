import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/utils/asset_path.dart';

class CustomPremiumCotainer extends StatelessWidget {
  const CustomPremiumCotainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: AppStyles.screenHeightPercentage(context, 0.12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: const Color(0xFFF1EBF4),
          ),
          child: SvgPicture.asset(
            AssetPath.vectorSmallBackground,
            fit: BoxFit.cover,
          ),
        ),
        Obx(()=>Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetPath.vector),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Zidney Premium',
                  style: TextStyle(
                    fontSize: AppStyles.fontXL,
                    fontWeight: AppStyles.weightMedium,
                    color: AppColors.secondaryColor.value,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Unlimited Attempts",
                      style: TextStyle(
                        fontSize: AppStyles.fontM,
                        fontWeight: AppStyles.weightMedium,
                        color: AppColors.blackColor,
                      ),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset(AssetPath.vectorInfinity),
                  ],
                ),
              ],
            ),
          ],
        ),)
      ],
    );
  }
}
