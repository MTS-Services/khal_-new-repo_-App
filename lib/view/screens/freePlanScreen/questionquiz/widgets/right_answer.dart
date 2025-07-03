import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/styles/app_text_styles.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/question.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_button.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/details_ans_check_progress_bar.dart';

class RightAnswer extends StatelessWidget {
  final TextEditingController answerController;
  final Function(String) onSubmit;
  final bool isAnswer;
  final bool isPrograsBar;

  const RightAnswer({
    super.key,
    required this.answerController,
    required this.onSubmit,
    required this.isAnswer,
    required this.isPrograsBar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.navigationColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AssetPath.vectorRightAnswer),
          SizedBox(height: AppStyles.screenHeightPercentage(context, 0.02)),
          Text(
            'Great work!',
            style: TextStyle(
              color: AppColors.green,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: AppStyles.screenHeightPercentage(context, 0.02)),
          Text('Detailed Answer', style: AppTextStyle.bold16),
          SizedBox(height: AppStyles.screenHeightPercentage(context, 0.01)),
          Text(
            'Molecules are vital for health, influencing processes. They build cells, regulate metabolism, and modulate immunity. Proteins repair tissues, lipids form membranes, and carbohydrates provide energy. Vitamins ensure smooth bodily functions.',
            style: AppTextStyle.regular16,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppStyles.screenHeightPercentage(context, 0.03)),

          isAnswer
              ? TextField(
                maxLines: 5,
                controller: answerController,
                decoration: InputDecoration(
                  hintText: 'Your answer',
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.buttonGreen),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.buttonGreen),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.buttonGreen,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.buttonGreen),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.buttonGreen,
                      width: 2,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.buttonGreen),
                  ),
                ),
              )
              : CustomButton(
                buttonText: 'Essential molecules.',
                backgroundColor: Colors.white,
                shadowColor: AppColors.buttonGreenShadow,
                textColor: AppColors.blackColor,
                border: Border.all(color: AppColors.buttonGreenShadow),
                width: double.infinity,
              ),
          const SizedBox(height: 16),
          isPrograsBar
              ? Text(
                'How close was your answer?',
                style: AppTextStyle.regular16,
                textAlign: TextAlign.left,
              )
              : SizedBox(),
          const SizedBox(height: 16),
          isPrograsBar
              ? DetailsAnsCheckProgressBar(totalSteps: 4, currentSteps: 3)
              : SizedBox(),
          const SizedBox(height: 16),
          CustomButton(
            backgroundColor: AppColors.buttonGreen,
            shadowColor: AppColors.buttonGreenShadow,
            suffix: Icon(Icons.double_arrow_outlined),
            buttonText: "Next Question",
            textColor: AppColors.blackColor,
            width: AppStyles.screenWidthPercentage(context, 0.90),
            onTap: () {
              onSubmit(answerController.text);
              Get.to(() => Question());
            },
          ),
        ],
      ),
    );
  }
}
