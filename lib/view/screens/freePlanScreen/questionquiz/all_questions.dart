import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/common/question_container.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/many_part_qustion.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/question.dart';
import '../../../../utils/app_style.dart';

class AllQuestions extends StatefulWidget {
  const AllQuestions({super.key});

  @override
  State<AllQuestions> createState() => _AllQuestionsState();
}

class _AllQuestionsState extends State<AllQuestions> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppStyles.heightXS),
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              thickness: 10,
              radius: Radius.circular(10),
              trackVisibility: true,
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.to(() => Question()),
                      child: QuestionContainer(
                        title: 'Question ${index + 1}',
                        subTitle: 'attempts taken 3',
                        trailIcon: AssetPath.circleCorrectImage,
                        percentage: 0.4,
                        onTap: () {
                          Get.to(() => ManyPartQuestion());
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
