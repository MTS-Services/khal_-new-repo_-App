import 'package:flutter/material.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/common/custom_app_bar.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/all_questions.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/all_quiz.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_button.dart';

import '../../../utils/app_style.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  bool isSelected = true; // Track the current selection (Questions or Quiz)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(showTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(AssetPath.bookmarkAddIcon, scale: 4),
                SizedBox(
                  width: AppStyles.screenWidthPercentage(context, 0.078),
                ),
                Text(
                  'Bookmarks',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontWeight: AppStyles.weightBold,
                    fontSize: AppStyles.fontL,
                  ),
                ),
                Spacer(),
                Image.asset(AssetPath.filterImage, scale: 4),
              ],
            ),
            SizedBox(height: AppStyles.screenHeightPercentage(context, 0.01)),

            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      setState(() {
                        isSelected = true;
                      });
                    },
                    backgroundColor:
                        isSelected
                            ? AppColors.primaryColor.value
                            : AppColors.primaryLightColor,
                    shadowColor:
                        isSelected
                            ? AppColors.primaryShadow.value
                            : AppColors.primaryLightColor,
                    buttonText: 'Questions',
                    textColor:
                        isSelected
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                    prefix: Image.asset(AssetPath.question, scale: 9),
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      setState(() {
                        isSelected = false; // Show Quiz screen
                      });
                    },
                    buttonText: 'Quiz',
                    backgroundColor:
                        !isSelected
                            ? AppColors.primaryColor.value
                            : AppColors.primaryLightColor,
                    shadowColor:
                        !isSelected
                            ? AppColors.primaryShadow.value
                            : AppColors.primaryLightColor,
                    textColor:
                        !isSelected
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                    prefix: Image.asset(AssetPath.quizImage, scale: 3),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppStyles.screenHeightPercentage(context, 0.015)),

            Expanded(child: isSelected ? AllQuestions() : AllQuiz()),
          ],
        ),
      ),
    );
  }
}
