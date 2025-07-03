import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zidney/utils/app_colors.dart';

import '../../../../../utils/app_style.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final String buttonText;
  final Widget? child;
  final Widget? prefix;
  final Widget? suffix;
  final Color? backgroundColor;
  final Color? shadowColor;
  final BorderRadius borderRadius;
  final Color textColor;
  final BoxBorder? border;

  const CustomButton({
    super.key,
    this.child,
    this.backgroundColor,
    this.shadowColor,
    this.borderRadius = AppStyles.radiusS,
    required this.buttonText,
    this.prefix,
    this.suffix,
    this.textColor = Colors.white,
    this.onTap,
    this.height,
    this.width,
    this.border,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.paddingVerticalM,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: border,
            color: backgroundColor ?? AppColors.primaryColor.value,
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(color: shadowColor ?? AppColors.primaryShadow.value, offset: const Offset(0, 12)),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefix != null) ...[prefix!],
              Padding(
                padding: AppStyles.paddingM,
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontWeight: AppStyles.weightBold,
                    fontSize: AppStyles.fontM,
                    color: textColor,
                  ),
                ),
              ),
              if (suffix != null) ...[suffix!],
            ],
          ),
        ),
      ),
    );
  }
}
