import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_button.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/show_bottom_sheet_widget.dart';
import 'package:zidney/viewmodels/controller/payment_controller.dart';

class AnswerBottomSheet extends StatefulWidget {
  final TextEditingController answerController;
  final Function(String) onSubmit;

  const AnswerBottomSheet({
    super.key,
    required this.answerController,
    required this.onSubmit,
  });

  @override
  AnswerBottomSheetState createState() => AnswerBottomSheetState();
}

class AnswerBottomSheetState extends State<AnswerBottomSheet> {
  bool isCorrect = true;
  int isWrongAns = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: PaymentController.isPaymentSuccess.value
              ? Color(0xfff1ebf4)
              : AppColors.navigationColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(100),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 5,
                controller: widget.answerController,
                decoration: InputDecoration(
                  hintText: 'Your answer',
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(
              prefix: Image.asset(AssetPath.penPng, width: 24, height: 24),
              buttonText: "Submit",
              width: AppStyles.screenWidthPercentage(context, 0.90),
              onTap: () {
                if (isCorrect == true) {
                  isWrongAns++;
                  if (isWrongAns == 1) {
                    showAnswerBottomSheet(context, 1, true, true, true);
                  } else if (isWrongAns == 2) {
                    showAnswerBottomSheet(context, 2, true, true, true);
                  } else {
                    showAnswerBottomSheet(context, 3, true, true, true);
                  }
                } else {
                  showAnswerBottomSheet(context, 3, true, true, true);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
