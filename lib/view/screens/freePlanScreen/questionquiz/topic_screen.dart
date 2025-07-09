import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/common/custom_app_bar.dart';
import 'package:zidney/utils/common/custom_label.dart';
import 'package:zidney/utils/common/question_container.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/prol_question.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/question_description.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showTitle: true,
        title: 'Jabed',
        classTitle: 'Class',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomLabel(image: AssetPath.labelIcon, text: 'Life Sciences'),
            SizedBox(height: 20),
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                thickness: 10,
                radius: Radius.circular(10),
                trackVisibility: true,
                child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () => Get.to(() => ProlQuestion()),
                        child: QuestionContainer(
                          title: 'Biological Exploration',
                          subTitle: 'You are on : 10th',
                          trailIcon: AssetPath.finishIcon,
                          percentage: 0.7,
                          onTap: () {

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
      ),
    );
  }
}
