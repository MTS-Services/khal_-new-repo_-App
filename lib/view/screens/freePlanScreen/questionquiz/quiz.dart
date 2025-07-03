import 'package:flutter/material.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/styles/app_text_styles.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_button.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/show_bottom_sheet_widget.dart';
import '../../../../utils/common/custom_app_bar.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int? selectedOption;
  bool isOptions = false;

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

              // Button Row 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        setState(() {
                          selectedOption = 0;
                          isOptions = true;
                        });
                      },
                      buttonText: 'Essential molecules.',
                      border: Border.all(
                        color:
                            selectedOption == 0
                                ? AppColors.primaryColor.value
                                : AppColors.primaryColor.value,
                      ),
                      backgroundColor:
                          selectedOption == 0
                              ? AppColors.primaryColor.value
                              : AppColors.whiteColor,
                      textColor:
                          selectedOption == 0
                              ? Colors.white
                              : AppColors.blackColor,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        setState(() {
                          selectedOption = 1;
                          isOptions = true;
                        });
                      },
                      buttonText: 'Health impact.',
                      border: Border.all(
                        color:
                            selectedOption == 1
                                ? AppColors.primaryColor.value
                                : AppColors.primaryColor.value,
                      ),
                      backgroundColor:
                          selectedOption == 1
                              ? AppColors.primaryColor.value
                              : AppColors.whiteColor,
                      textColor:
                          selectedOption == 1
                              ? Colors.white
                              : AppColors.blackColor,
                    ),
                  ),
                ],
              ),

              // Button Row 2
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        setState(() {
                          selectedOption = 2;
                          isOptions = true;
                        });
                      },
                      buttonText: 'Misleading claim.',
                      border: Border.all(
                        color:
                            selectedOption == 2
                                ? AppColors.primaryColor.value
                                : AppColors.primaryColor.value,
                      ),
                      backgroundColor:
                          selectedOption == 2
                              ? AppColors.primaryColor.value
                              : AppColors.whiteColor,
                      textColor:
                          selectedOption == 2
                              ? Colors.white
                              : AppColors.blackColor,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        setState(() {
                          selectedOption = 3;
                          isOptions = true;
                        });
                      },
                      buttonText: 'False statement.',
                      border: Border.all(
                        color:
                            selectedOption == 3
                                ? AppColors.primaryColor.value
                                : AppColors.primaryColor.value,
                      ),
                      backgroundColor:
                          selectedOption == 3
                              ? AppColors.primaryColor.value
                              : AppColors.whiteColor,
                      textColor:
                          selectedOption == 3
                              ? Colors.white
                              : AppColors.blackColor,
                    ),
                  ),
                ],
              ),

              CustomButton(
                onTap: () {
                  if (selectedOption != null) {
                    if (isOptions) {
                      showAnswerBottomSheet(context, 1, false, false, false);
                    } else {
                      showAnswerBottomSheet(context, 3, true, true, false);
                    }
                  }
                },
                backgroundColor:
                    selectedOption != null
                        ? AppColors.buttonGreen
                        : AppColors.grey,
                shadowColor:
                    selectedOption != null
                        ? AppColors.buttonGreenShadow
                        : AppColors.greyShadow,
                textColor: AppColors.blackColor,
                suffix: Icon(Icons.double_arrow_outlined),
                buttonText: "Submit",
                width: AppStyles.screenWidthPercentage(context, 0.98),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
