import 'package:flutter/material.dart';
import 'package:zidney/utils/app_colors.dart';
import '../../../../../utils/app_style.dart';

class CustomConditionalButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final Widget? child;
  final Widget? prefix;
  final Widget? suffix;
  final Color backgroundColor;
  final Color shadowColor;
  final BorderRadius borderRadius;
  final Color textColor;
  final bool isSelected;

  const CustomConditionalButton({
    super.key,
    required this.onTap,
    this.child,
    this.backgroundColor = AppColors.primaryColor,
    this.shadowColor = AppColors.primaryShadow,
    this.borderRadius = AppStyles.radiusM,
    required this.buttonText,
    this.prefix,
    this.suffix,
    this.textColor = Colors.black,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration:
              isSelected
                  ? BoxDecoration(
                    color: backgroundColor,
                    borderRadius: borderRadius,
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  )
                  : BoxDecoration(
                    color: Colors.white,
                    borderRadius: borderRadius,
                    border: Border.all(color: Colors.grey.shade400),
                  ),
          child: Padding(
            padding: AppStyles.paddingM,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (prefix != null) ...[prefix!, const SizedBox(width: 10)],
                Text(
                  buttonText,
                  style: TextStyle(
                    fontWeight: AppStyles.weightBold,
                    fontSize: AppStyles.fontM,
                    color: isSelected ? Colors.white : textColor,
                  ),
                ),
                if (suffix != null) ...[const SizedBox(width: 10), suffix!],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
