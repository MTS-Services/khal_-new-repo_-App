import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/common/custom_app_bar.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_container.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(showTitle: true,title: 'Sophie',classTitle: 'class', showAction: false),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: AppStyles.screenHeightPercentage(context, 0.01)),
              CustomContainer(
                height: 218,
                width: 218,
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(AssetPath.menuImage),
              ),
              SizedBox(height: AppStyles.screenHeightPercentage(context, 0.03)),
              Text(
                'Sophie',
                style: TextStyle(
                  color: AppColors.chocolate,
                  fontWeight: AppStyles.weightMedium,
                  fontSize: 24,
                ),
              ),

              SizedBox(height: AppStyles.screenHeightPercentage(context, 0.09)),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: SvgPicture.asset(
                      AssetPath.personIcon,
                      height: 16,
                      width: 16,
                    ),
                  ),
                  const SizedBox(width: 18),
                  Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: AppStyles.fontM,
                      fontWeight: AppStyles.weightRegular,
                      color: AppColors.chocolate,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),
              Divider(height: 1, color: AppColors.grey),

              SizedBox(height: 22),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: SvgPicture.asset(
                      AssetPath.languageIcon,
                      height: 16,
                      width: 16,
                    ),
                  ),
                  const SizedBox(width: 18),
                  Text(
                    'Language',
                    style: TextStyle(
                      fontSize: AppStyles.fontM,
                      fontWeight: AppStyles.weightRegular,
                      color: AppColors.chocolate,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),
              Divider(height: 1, color: AppColors.grey),
              SizedBox(height: 22),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: SvgPicture.asset(
                      AssetPath.vector,
                      height: 16,
                      width: 16,
                    ),
                  ),
                  const SizedBox(width: 18),
                  Text(
                    'Plans',
                    style: TextStyle(
                      fontSize: AppStyles.fontM,
                      fontWeight: AppStyles.weightRegular,
                      color: AppColors.chocolate,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),
              Divider(height: 1, color: AppColors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
