import 'package:flutter/material.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/app_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.paddingVerticalM,
      child: Container(
        height: AppStyles.heightL,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: AppStyles.radiusS,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            contentPadding: contentPadding ?? AppStyles.paddingS,
            labelStyle: TextStyle(
              fontWeight: AppStyles.weightBold,
              color: Colors.black,
              fontSize: AppStyles.fontM,
            ),
            border: OutlineInputBorder(
              borderRadius: AppStyles.radiusS,
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: AppStyles.radiusS,
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: AppStyles.radiusS,
              borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
