import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zidney/controller/subject/subject_controller.dart';
import 'package:zidney/models/subject/subject_model.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/view/screens/freePlanScreen/gettingStarted/premium_screen.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/app_background.dart';
import '../../../../controller/course/course_controller.dart';
import '../../../../models/course/course_model.dart';
import '../questionquiz/widgets/all_subject_screen.dart';
import '../questionquiz/widgets/custom_conditional_buton.dart';
import '../questionquiz/widgets/custom_button.dart';
import '../questionquiz/widgets/custom_logo.dart';

class SubjectSelection extends StatefulWidget {
  const SubjectSelection({super.key});

  @override
  State<SubjectSelection> createState() => _SubjectSelectionState();
}

class _SubjectSelectionState extends State<SubjectSelection> {
  List<SubjectData> selectedSubjects = [];

  final List<String> subjects = [
    'Advance Math',
    'Life Sciences',
    'Physical Sciences',
    'Chemical Sciences',
    'Literature Studies',
    'Organic Chemistry',
    'Inorganic Chemistry',
  ];

  void toggleSubject(SubjectData subject) {
    setState(() {
      if (selectedSubjects.contains(subject)) {
        selectedSubjects.remove(subject);
      } else {
        if (selectedSubjects.length <= _subjectController.subjects.length) {
          selectedSubjects.add(subject);
        }
      }
    });
  }

  final CourseController _courseController = Get.put(CourseController());
  final SubjectController _subjectController = Get.put(SubjectController());

  @override
  Widget build(BuildContext context) {
    bool isReadyToStart = selectedSubjects.length >= _subjectController.subjects.length;

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
               Obx((){
                 return  SizedBox(
                   height: AppStyles.screenHeightPercentage(context, 0.58),
                   width: double.infinity,
                   child: ListView.builder(
                     shrinkWrap: true,
                     itemCount: _subjectController.subjects.length,
                     itemBuilder: (context, index) {
                       final subjectData = _subjectController.subjects[index];
                       bool isSelected = selectedSubjects.contains(subjectData);
                       return CustomConditionalButton(
                         buttonText: subjectData.translations[0].name,
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
                             ? AppColors.primaryColor.value
                             : AppColors.chocolateShadow,
                         textColor:
                         isSelected
                             ? Colors.white
                             : AppColors.chocolateShadow,
                         shadowColor:
                         isSelected
                             ? AppColors.primaryShadow.value
                             : AppColors.chocolateShadow,
                         onTap: () => toggleSubject(subjectData),
                       );
                     },
                   ),
                 );
               }),

                // Obx(()=>SizedBox(
                //   height: 300,
                //   child: ListView.builder(
                //     itemCount: _courseController.courses.length,
                //     itemBuilder: (context, index) {
                //       Course course = _courseController.courses[index];
                //       return AllSubjectScreen(
                //         subName: course.name,
                //         image: AssetPath.labelIcon,
                //       );
                //     },
                //   ),
                // ),),




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
                  isReadyToStart ? AppColors.primaryColor.value : AppColors.grey,
                  textColor: Colors.white,
                  shadowColor:
                  isReadyToStart
                      ? AppColors.primaryShadow.value
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
