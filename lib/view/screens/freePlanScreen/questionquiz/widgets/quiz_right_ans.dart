import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/styles/app_text_styles.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_button.dart';

class QuizRightAns extends StatelessWidget {
  final TextEditingController answerController;
  final Function(String) onSubmit;
  const QuizRightAns({
    super.key,
    required this.answerController,
    required this.onSubmit,
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

          CustomButton(
            buttonText: 'Essential molecules.',
            backgroundColor: Colors.white,
            shadowColor: AppColors.buttonGreenShadow,
            textColor: AppColors.blackColor,
            border: Border.all(color: AppColors.primaryColor.value),
            width: double.infinity,
          ),
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
            },
          ),
        ],
      ),
    );
  }
}
