import 'package:flutter/material.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/common/custom_app_bar.dart';
import 'package:zidney/utils/common/custom_label.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/all_questions.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/all_quiz.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_button.dart';

class ProlQuestion extends StatefulWidget {
  const ProlQuestion({super.key});

  @override
  State<ProlQuestion> createState() => _ProlQuestionState();
}

class _ProlQuestionState extends State<ProlQuestion> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(showTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            CustomLabel(image: AssetPath.labelIcon, text: 'Life Sciences'),
            SizedBox(height: 20),
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
                        isSelected = false;
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
