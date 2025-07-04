import 'package:flutter/material.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/styles/app_text_styles.dart';

class PracticeButton extends StatelessWidget {
  const PracticeButton({
    super.key,
    this.showText = false,
    this.hasRadius = true,
    this.showMoreShadow = false,
    this.buttonText = 'Start Practice',
    this.textColor,
    this.buttonColor = AppColors.whiteColor,
    this.shadowColor = const Color(0xffF0E4DE),
    this.iconColor = AppColors.blackColor,
    required this.onTap,
  });
  final bool showText;
  final bool hasRadius;
  final bool showMoreShadow;
  final String buttonText;
  final Color? textColor;
  final Color buttonColor;
  final Color shadowColor;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: showText ? EdgeInsets.all(9) : EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: hasRadius ? BorderRadius.circular(40) : BorderRadius.zero,
          color: buttonColor,
          boxShadow:
              showMoreShadow
                  ? [BoxShadow(offset: Offset(0, 5), color: shadowColor)]
                  : [BoxShadow(offset: Offset(0, 3), color: shadowColor)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showText)
              Text(
                buttonText,
                style: AppTextStyle.bold14.apply(color: textColor??Color(0xFF4D3D36)),
              ),
            Icon(Icons.double_arrow_sharp, color: iconColor),
          ],
        ),
      ),
    );
  }
}
