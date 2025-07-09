import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zidney/controller/course/course_controller.dart';
import 'package:zidney/controller/topics/topic_controller.dart';
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
import '../../../controller/subject/subject_controller.dart';
import '../../screens/freePlanScreen/questionquiz/widgets/all_subject_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

final _topicController=Get.put(TopicController());
final _subjectController=Get.put(SubjectController());
final _courseController=Get.put(CourseController());
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
        child: Padding(
          padding: AppStyles
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
                'Practicing Course',
                style: AppTextStyle.bold16.apply(fontSizeFactor: 1.2),
              ),
              SizedBox(height: 15.h),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _courseController.courses.length,
                itemBuilder: (context, index) {
                  final course=_courseController.courses[index];
                // return  ListView.builder(
                //   shrinkWrap: true,
                //     physics: NeverScrollableScrollPhysics(),
                //     itemCount: course.translations.length,
                //     itemBuilder: (context, index) {
                //       return QuestionContainer(
                //       title: course.translations[index].name,
                //       subTitle: "Chapter: ${course.statusLabel}",
                //       showTrailIcon: false,
                //       showIcon: true,
                //       imageIcon: AssetPath.accessIcon,
                //       percentage: 0.5,
                //       onTap: () {
                //         controller.openWithChild(TopicScreen());
                //       },
                //     );
                //     }
                // );
                  return QuestionContainer(title: course.translations.first.name, subTitle: "Chapter 1", onTap: (){}, percentage: .5);
              },),


              Text(
                'All Subjects',
                style: AppTextStyle.bold16.apply(fontSizeFactor: 1.2),
              ),
              SizedBox(height: 20.h),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemCount: _subjectController.subjects.length,
                  itemBuilder: (context, index) {
                  final subject=_subjectController.subjects[index];
                    return AllSubjectScreen(subName: subject.translations[0].name, image: subject.icon.toString(),);
                  },
              )

            ],
          ),
        ),
      ),
    );
  }
}
