import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/common/practice_button.dart';
import 'package:zidney/utils/styles/app_text_styles.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_progress_bar.dart';

class TopicOverviewCard extends StatelessWidget {
  const TopicOverviewCard({
    super.key,
    required this.subject,
    required this.chapter,
    required this.classNum,
    this.showButtonText = false,
    required this.totalQuestion,
    this.showImage = false,
  });

  final String subject;//added subject
  final String chapter;
  final String classNum;
  final bool showButtonText;
  final int totalQuestion;
  final bool showImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: const Color(0xffFCC962),
        boxShadow: [
          BoxShadow(offset: Offset(0, 10.h), color: const Color(0xffE49F13)),
        ],
      ),
      child: Stack(
        children: [
          if (showImage)
            Positioned.fill(
              child: Image.asset(AssetPath.containerBack, fit: BoxFit.cover),
            ),
          Padding(
            padding: EdgeInsets.all(17.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      AssetPath.arithMaticLogo,
                      height: 48.h,
                      width: 48.w,
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Text(
                  subject,
                  style: AppTextStyle.regular20.apply(
                    color: AppColors.chocolate,
                  ),
                ),
                Text(
                  'chapter $chapter',
                  style: AppTextStyle.regular20.apply(
                    color: AppColors.chocolate,
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  'Total question: $totalQuestion',
                  style: AppTextStyle.regular14.apply(
                    color: AppColors.chocolate,
                  ),
                ),
                Text(
                  'You are on: ${classNum}th',
                  style: AppTextStyle.regular14.apply(
                    color: AppColors.chocolate,
                  ),
                ),
                SizedBox(height: 15.h),
                const CustomProgressBar(
                  backgroundColor: AppColors.whiteColor,
                  progressColor: AppColors.blackColor,
                  percentage: 0.5,
                ),
                SizedBox(height: 35.h),
                PracticeButton(
                  showText: showButtonText,
                  showMoreShadow: true,
                  iconColor: AppColors.chocolate,
                  onTap: () {
                    
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
