import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/view/screens/freePlanScreen/gettingStarted/premium_screen.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/app_background.dart';
import '../questionquiz/widgets/custom_conditional_buton.dart';
import '../questionquiz/widgets/custom_button.dart';
import '../questionquiz/widgets/custom_logo.dart';

class SubjectSelection extends StatefulWidget {
  const SubjectSelection({super.key});

  @override
  State<SubjectSelection> createState() => _SubjectSelectionState();
}

class _SubjectSelectionState extends State<SubjectSelection> {
  List<String> selectedSubjects = [];

  final List<String> subjects = [
    'Advance Math',
    'Life Sciences',
    'Physical Sciences',
    'Chemical Sciences',
    'Literature Studies',
    'Organic Chemistry',
    'Inorganic Chemistry',
  ];

  void toggleSubject(String subject) {
    setState(() {
      if (selectedSubjects.contains(subject)) {
        selectedSubjects.remove(subject);
      } else {
        if (selectedSubjects.length <= 5) {
          selectedSubjects.add(subject);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isReadyToStart = selectedSubjects.length >= 5;

    return Scaffold(
      body: AppBackground(
        showBgImage: 1,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: AppStyles.screenHeightPercentage(context, 0.03),
                ),
                CustomLogo(
                  titleText: 'Welcome to Zidney',
                  subTitleText: 'Pick 5 courses to get started!',
                ),
                SizedBox(
                  height: AppStyles.screenHeightPercentage(context, 0.58),
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: subjects.length,
                    itemBuilder: (context, index) {
                      final subject = subjects[index];
                      bool isSelected = selectedSubjects.contains(subject);
                      return CustomConditionalButton(
                        buttonText: subject,
                        prefix: Icon(
                          Icons.language,
                          color:
                              isSelected
                                  ? AppColors.lightPink
                                  : AppColors.chocolateShadow,
                        ),
                        isSelected: isSelected,
                        backgroundColor:
                            isSelected
                                ? AppColors.primaryColor
                                : AppColors.chocolateShadow,
                        textColor:
                            isSelected
                                ? Colors.white
                                : AppColors.chocolateShadow,
                        shadowColor:
                            isSelected
                                ? AppColors.primaryShadow
                                : AppColors.chocolateShadow,
                        onTap: () => toggleSubject(subject),
                      );
                    },
                  ),
                ),
                CustomButton(
                  width: AppStyles.screenHeightPercentage(context, 0.25),
                  prefix: Image.asset(AssetPath.logInIcon, scale: 4),
                  onTap:
                      isReadyToStart
                          ? () {
                            Get.to(() => PremiumScreen());
                          }
                          : null,
                  buttonText:
                      isReadyToStart ? 'Get Started' : '4 More to Start',
                  backgroundColor:
                      isReadyToStart ? AppColors.primaryColor : AppColors.grey,
                  textColor: Colors.white,
                  shadowColor:
                      isReadyToStart
                          ? AppColors.primaryShadow
                          : AppColors.greyShadow,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
