import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zidney/controller/quiz/quiz_controller.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/common/practice_button.dart';

import '../../view/screens/freePlanScreen/questionquiz/widgets/custom_progress_bar.dart';
import '../app_colors.dart';
import '../styles/app_text_styles.dart';

class QuestionContainer extends StatelessWidget {
   QuestionContainer({
    super.key,
    required this.title,
    required this.subTitle,
    this.imageIcon = '',
    this.showIcon = false,
    this.trailIcon = AssetPath.labelIcon,
    this.showTrailIcon = true,
    required this.onTap, required this.percentage,
  });

  final String title;
  final String subTitle;
  final String imageIcon;
  final bool showIcon;
  final String trailIcon;
  final bool showTrailIcon;
  final double percentage;
  final VoidCallback onTap;



  @override
  Widget build(BuildContext context) {
    return Obx(()=>Stack(
      children: [
        Positioned(
          left: -7,
          right: -6.9,
          bottom: 11.1,
          child: CustomProgressBar(
            progressColor: AppColors.primaryColor.value,
            backgroundColor: Colors.grey.shade300,
            percentage: percentage,
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.all(15),

          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 15,
                children: [
                  if (showIcon) Image.asset(imageIcon, scale: 4),
                  SizedBox(
                    width: 190,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: AppTextStyle.bold14,overflow: TextOverflow.ellipsis,),
                        Text(subTitle, style: AppTextStyle.regular12),
                      ],
                    ),
                  ),
                ],
              ),
              showTrailIcon
                  ? InkWell(
                onTap: onTap,
                child: Image.asset(trailIcon, scale: 4),
              )
                  : PracticeButton(
                                  showText: true,
                                  buttonText: 'Practice',
                                  showMoreShadow: true,
                                  buttonColor: AppColors.primaryColor.value,
                                  shadowColor: AppColors.primaryShadow.value,
                                  textColor: AppColors.whiteColor,
                                  iconColor: AppColors.whiteColor,
                                  onTap: onTap,
                                ),
            ],
          ),
        ),
      ],
    ));
  }
}
