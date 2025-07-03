import 'package:flutter/material.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/styles/app_text_styles.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_button.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/show_bottom_sheet_widget.dart';
import '../../../../utils/common/custom_app_bar.dart';

class ThreeTimeAnswerScreen extends StatefulWidget {
  const ThreeTimeAnswerScreen({super.key, required this.isTrue});
  final bool isTrue;

  @override
  State<ThreeTimeAnswerScreen> createState() => _ThreeTimeAnswerScreenState();
}

class _ThreeTimeAnswerScreenState extends State<ThreeTimeAnswerScreen> {
  int? selectedOption;
  bool isOptions = false;
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showAnswerBottomSheet(context, 1, false, false, true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showAction: true, showActionIcon: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Center(child: Image.asset(AssetPath.question, height: 100)),
              SizedBox(
                height: AppStyles.screenHeightPercentage(context, 0.025),
              ),
              Text(
                """How do molecules influence human \nhealth?""",
                style: AppTextStyle.bold16,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: AppStyles.screenHeightPercentage(context, 0.025),
              ),
              Text(
                """Molecules are vital for health, influencing \nprocesses. They build cells, affect metabolism, and immune responses. Proteins repair tissues, lipids support membranes, and carbohydrates provide energy. Vitamins regulate functions, \nensuring smooth body operation. \nUnderstanding these interactions shows their impact on health.""",
                style: AppTextStyle.regular16,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppStyles.screenHeightPercentage(context, 0.20)),

              // Button to trigger the bottom sheet
              CustomButton(
                buttonText: "Show Answer",
                onTap: () {
                  widget.isTrue;
                  showAnswerBottomSheet(context, 1, false, false, true);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
