import 'package:flutter/material.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/styles/app_text_styles.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_button.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/show_bottom_sheet_widget.dart';
import '../../../../utils/common/custom_app_bar.dart';

class Question extends StatelessWidget {
  const Question({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showAction: true, showActionIcon: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Image.asset(AssetPath.question, height: 100)),
            SizedBox(height: AppStyles.screenHeightPercentage(context, 0.025)),
            Text(
              """How do molecules influence human \nhealth?""",
              style: AppTextStyle.bold16,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppStyles.screenHeightPercentage(context, 0.025)),
            Text(
              """Molecules are vital for health, influencing \nprocesses. They build cells, affect metabolism, and immune responses. Proteins repair tissues, lipids support membranes, and carbohydrates provide energy. Vitamins regulate functions, \nensuring smooth body operation. \nUnderstanding these interactions shows their impact on health.""",
              style: AppTextStyle.regular16,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            CustomButton(
              onTap: () {
                showAnswerBottomSheet(context, 0, true, true, true);
              },
              prefix: Image.asset(AssetPath.penPng, width: 24, height: 24),
              buttonText: "answer",
              width: AppStyles.screenWidthPercentage(context, 0.98),
            ),
          ],
        ),
      ),
    );
  }

  Widget optionRow(
    BuildContext context,
    String optionLabel,
    String optionText,
  ) {
    return Row(
      children: [
        Text(
          optionLabel,
          style: AppTextStyle.bold16,
          textAlign: TextAlign.center,
        ),
        SizedBox(width: AppStyles.screenWidthPercentage(context, 0.015)),
        Expanded(
          child: Text(
            optionText,
            style: AppTextStyle.regular16,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
