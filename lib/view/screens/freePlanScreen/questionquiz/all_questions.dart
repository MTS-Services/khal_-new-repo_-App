import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/common/question_container.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/many_part_qustion.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/question_description.dart';
import '../../../../controller/question/question_controller.dart';
import '../../../../utils/app_style.dart';

class AllQuestions extends StatefulWidget {
   const AllQuestions({super.key});

  @override
  State<AllQuestions> createState() => _AllQuestionsState();
}

class _AllQuestionsState extends State<AllQuestions> {
  bool isSelected = true;
  final _questionController=Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppStyles.heightXS),
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
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) {
                    final question=_questionController.questions[index];
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: question.translations.length,
                      itemBuilder: (context, index) {
                        final questionData=question.translations[index];
                        return GestureDetector(
                          onTap: (){
                            Get.to(()=>QuestionDescription(questionData: questionData));
                          },
                          child: QuestionContainer(
                            title: questionData.title,
                            subTitle: 'attempts taken 3',
                            trailIcon: AssetPath.circleCorrectImage,
                            percentage: 0.4,
                            onTap: () {
                              Get.to(() => ManyPartQuestion());
                            },
                          ),
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
    );
  }
}
