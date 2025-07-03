import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/view/screens/freePlanScreen/menusubpages/plans.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/ad_for_free_user.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_button.dart';

class WrongAnsLimit extends StatelessWidget {
  final TextEditingController answerController;
  final Function(String) onSubmit;
  final bool iswrong;
  const WrongAnsLimit({
     required this.iswrong,
    super.key,
    required this.answerController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.navigationColor,
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
          SizedBox(height: AppStyles.screenHeightPercentage(context, 0.015)),
          SvgPicture.asset(AssetPath.cross1),
          SizedBox(height: AppStyles.screenHeightPercentage(context, 0.02)),
          Text(
            'You have reached your  attempts limit',
            style: TextStyle(
              color: AppColors.red,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppStyles.screenHeightPercentage(context, 0.03)),

         iswrong? TextField(
            maxLines: 5,
            controller: answerController,
            decoration: InputDecoration(
              fillColor: AppColors.navigationColorRed,
              hintText: 'Your answer',
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.red, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.red, width: 2),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.red),
              ),
            ),
          ):CustomButton(
                buttonText: 'Essential molecules.',
                backgroundColor: Colors.white,
                shadowColor: AppColors.red,
                textColor: AppColors.blackColor,
                border: Border.all(color: AppColors.red),
                width: double.infinity,
              ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CustomButton(
                  prefix: Image.asset(AssetPath.penPng, width: 24, height: 24),
                  buttonText: "Show Answer",
                  textColor: AppColors.whiteColor,
                  onTap: () {
                    Get.to(() => AdForFreeUser());
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CustomButton(
                  backgroundColor: AppColors.secondaryColor,
                  shadowColor: AppColors.secondaryShadow,
                  prefix: Image.asset(
                    AssetPath.logInIcon,
                    width: 24,
                    height: 24,
                  ),
                  buttonText: "Try Premium",
                  textColor: AppColors.whiteColor,
                  onTap: () {
                    onSubmit(answerController.text);
                    Get.to(() => Plans());
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
