import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zidney/utils/app_colors.dart';

import 'package:zidney/utils/app_style.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final Color? shadowColor;
  final Color? backgroundColor;
  final Widget? child;

  const CustomContainer({
    super.key,
    this.height,
    this.borderRadius,
    this.width,
    this.shadowColor,
    this.backgroundColor = Colors.white,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Container(
      height: height,

      width: width,

      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? AppStyles.radiusS,
        border: Border.all(
          color: shadowColor ?? AppColors.primaryColor.value,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? AppColors.primaryColor.value,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: child,
    ));
  }
}
