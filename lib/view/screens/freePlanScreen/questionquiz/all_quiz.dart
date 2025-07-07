import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/common/question_container.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/quiz.dart';
import '../../../../controller/quiz/quiz_controller.dart';
import '../../../../utils/app_style.dart';

class AllQuiz extends StatefulWidget {
  const AllQuiz({super.key});

  @override
  State<AllQuiz> createState() => _AllQuizState();
}

class _AllQuizState extends State<AllQuiz> {
  bool isSelected = false;

  final _quizController=Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppStyles.heightXS),

          SizedBox(height: AppStyles.screenHeightPercentage(context, 0.015)),
          Expanded(
            child: Obx(
              () => RawScrollbar(
                thumbVisibility: true,
                thickness: 10,
                thumbColor: AppColors.primaryColor.value,
                radius: Radius.circular(10),
                trackVisibility: true,
                child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _quizController.quizzes.length,//10
                    itemBuilder: (context, index) {
                      final quiz=_quizController.quizzes[index];
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: quiz.translations.length,
                          itemBuilder: (context, index) {

                            return QuestionContainer(

                              title: quiz.translations[index].title,
                              subTitle: 'attempts taken 3',
                              trailIcon: AssetPath.circleCorrectImage,
                              percentage: 0.8,
                              onTap: () {
                                Get.to(() => Quiz());
                              },
                            );
                          },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
