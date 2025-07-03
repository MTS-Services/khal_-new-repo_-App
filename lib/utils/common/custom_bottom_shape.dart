import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_button.dart';

class CustomBottomShape extends StatelessWidget {
  const CustomBottomShape({
    super.key,
    this.onTap,
    this.buttonText = 'Create Account',
    this.showTextButton = false,
  });
  final String buttonText;
  final VoidCallback? onTap;
  final bool showTextButton;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AssetPath.bottomShape),
            Positioned(
              bottom: 30.h,
              child:
                  showTextButton
                      ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 20),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back_outlined),
                                SizedBox(width: 10),
                                Text('Edit Email'),
                              ],
                            ),
                          ),
                        ],
                      )
                      : CustomButton(
                        onTap: onTap,
                        buttonText: buttonText,
                        backgroundColor: AppColors.chocolate.value,
                        shadowColor: AppColors.chocolateShadow,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
