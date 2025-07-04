import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData themData() {
  return ThemeData(
    fontFamily: 'Futura',
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.chocolate.value,
        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
    scrollbarTheme: ScrollbarThemeData(
      trackColor: WidgetStateProperty.all(Color(0xff713694).withValues(alpha: 0.2)),
      trackBorderColor: WidgetStateProperty.all(Colors.transparent),
      thickness: WidgetStateProperty.all(6),
      trackVisibility: WidgetStateProperty.all(true), // show track
      radius: Radius.circular(10),
      thumbVisibility: WidgetStateProperty.all(true),
    ),

    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primaryColor.value,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primaryColor.value),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primaryColor.value),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primaryColor.value, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primaryColor.value),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primaryColor.value, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primaryColor.value),
      ),
    ),
  );
}
