import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/common/practice_button.dart';
import 'package:zidney/utils/styles/app_text_styles.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_progress_bar.dart';

class SubjectContainer extends StatelessWidget {
  const SubjectContainer({
    super.key,
    required this.subject,
    required this.chapter,
    required this.classNum,
  });

  final String subject;
  final String chapter;
  final String classNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: const Color(0xffFCC962),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AssetPath.labelIcon, height: 32.h, width: 32.w),
                PracticeButton(
                  showText: false,
                  iconColor: AppColors.chocolate,
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 11.h),
            Text(
              subject,
              style: AppTextStyle.regular14.apply(color: AppColors.chocolate),
            ),
            Text(
              'chapter $chapter',
              style: AppTextStyle.regular14.apply(color: AppColors.chocolate),
            ),
            SizedBox(height: 12.h),
            Text(
              'You are on: ${classNum}th',
              style: AppTextStyle.regular12.apply(color: AppColors.chocolate),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.only(bottom: 10.r),
              child: const CustomProgressBar(
                backgroundColor: AppColors.whiteColor,
                progressColor: AppColors.blackColor,
                percentage: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
