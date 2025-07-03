import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/common/custom_app_bar.dart';
import 'package:zidney/utils/common/custom_label.dart';
import 'package:zidney/utils/common/question_container.dart';
import 'package:zidney/utils/styles/app_text_styles.dart';
import 'package:zidney/view/screens/freePlanScreen/gettingStarted/premium_screen.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/topic_screen.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_premium_container.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/subject_container.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/topic_overview_card.dart';
import 'package:zidney/viewmodels/controller/bottom_nav_controller.dart';

import '../../screens/freePlanScreen/questionquiz/widgets/all_subject_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.find();
    return Scaffold(
      appBar: CustomAppBar(
        showTitle: true,
        title: 'Sophie',
        classTitle: 'Class 10',
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:
                AppStyles
                    .paddingSymmetricXL, // You can internally apply .w/.h in AppStyles too
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => Get.to(() => PremiumScreen()),
                  child: const CustomPremiumCotainer(),
                ),
                SizedBox(height: 20.h),
                const CustomLabel(
                  text: 'Last Practiced Chapter',
                  showImage: false,
                ),
                SizedBox(height: 10),
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 3,
                      child: TopicOverviewCard(
                        chapter: '1',
                        classNum: '10',
                        showButtonText: true,
                        subject: 'Advance Math',
                        totalQuestion: 10,
                        showImage: true,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          SubjectContainer(
                            subject: 'Life Science',
                            chapter: '1',
                            classNum: '10',
                          ),
                          SubjectContainer(
                            subject: 'Physical Science',
                            chapter: '1',
                            classNum: '10',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35.h),
                Text(
                  'Practicing Courses',
                  style: AppTextStyle.bold16.apply(fontSizeFactor: 1.2),
                ),
                SizedBox(height: 15.h),

                for (int i = 0; i < 4; i++)
                  QuestionContainer(
                    title: 'Life Science',
                    subTitle: 'Chapter : 10th',
                    showTrailIcon: false,
                    showIcon: true,
                    imageIcon: AssetPath.accessIcon,
                    percentage: 0.5,
                    onTap: () {
                      controller.openWithChild(TopicScreen());
                    },
                  ),
                SizedBox(height: 30.h),
                Text(
                  'All Subjects',
                  style: AppTextStyle.bold16.apply(fontSizeFactor: 1.2),
                ),
                SizedBox(height: 20.h),
                for (int i = 0; i < 4; i++)
                  AllSubjectScreen(subName: 'Math', image: AssetPath.labelIcon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
