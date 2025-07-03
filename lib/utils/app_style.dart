import 'package:flutter/material.dart';

class AppStyles {
  // 📏 Font Sizes
  static const double fontXS = 10.0;
  static const double fontS = 12.0;
  static const double fontM = 14.0;
  static const double fontL = 16.0;
  static const double fontXL = 18.0;
  static const double fontXXL = 22.0;
  static const double fontXXXL = 28.0;

  // 🟦 Border Radius
  static const BorderRadius radiusXS = BorderRadius.all(Radius.circular(4.0));
  static const BorderRadius radiusS = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius radiusM = BorderRadius.all(Radius.circular(12.0));
  static const BorderRadius radiusL = BorderRadius.all(Radius.circular(16.0));
  static const BorderRadius radiusXL = BorderRadius.all(Radius.circular(24.0));
  static const BorderRadius radiusXXL = BorderRadius.all(Radius.circular(32.0));

  // 🧱 Font Weights
  static const FontWeight weightLight = FontWeight.w300;
  static const FontWeight weightRegular = FontWeight.w400;
  static const FontWeight weightMedium = FontWeight.w500;
  static const FontWeight weightBold = FontWeight.w700;

  // 📦 Padding
  static const EdgeInsets paddingXS = EdgeInsets.all(4.0);
  static const EdgeInsets paddingS = EdgeInsets.all(8.0);
  static const EdgeInsets paddingM = EdgeInsets.all(12.0);
  static const EdgeInsets paddingL = EdgeInsets.all(16.0);
  static const EdgeInsets paddingXL = EdgeInsets.all(24.0);

  // 🔄 Symmetric Padding
  static const EdgeInsets paddingSymmetricXS = EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0);
  static const EdgeInsets paddingSymmetricS = EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0);
  static const EdgeInsets paddingSymmetricM = EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0);
  static const EdgeInsets paddingSymmetricL = EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0);
  static const EdgeInsets paddingSymmetricXL = EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0);
  static const EdgeInsets paddingSymmetricXXL = EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0);


  // ➡️ Horizontal Padding Only
  static const EdgeInsets paddingHorizontalXS = EdgeInsets.symmetric(horizontal: 4.0);
  static const EdgeInsets paddingHorizontalS = EdgeInsets.symmetric(horizontal: 8.0);
  static const EdgeInsets paddingHorizontalM = EdgeInsets.symmetric(horizontal: 12.0);
  static const EdgeInsets paddingHorizontalL = EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets paddingHorizontalXL = EdgeInsets.symmetric(horizontal: 20.0);
  static const EdgeInsets paddingHorizontalXXL = EdgeInsets.symmetric(horizontal: 24.0);

  // ⬇️ Vertical Padding Only
  static const EdgeInsets paddingVerticalXS = EdgeInsets.symmetric(vertical: 4.0);
  static const EdgeInsets paddingVerticalS = EdgeInsets.symmetric(vertical: 8.0);
  static const EdgeInsets paddingVerticalM = EdgeInsets.symmetric(vertical: 12.0);
  static const EdgeInsets paddingVerticalL = EdgeInsets.symmetric(vertical: 16.0);
  static const EdgeInsets paddingVerticaXL = EdgeInsets.symmetric(vertical: 20.0);
  static const EdgeInsets paddingVerticalXXL = EdgeInsets.symmetric(vertical: 24.0);

  // ↕️ Heights
  static const double heightXS = 20.0;
  static const double heightS = 45.0;
  static const double heightM = 60.0;
  static const double heightL = 60.0;
  static const double heightXL = 80.0;
  static const double heightXXL = 100.0;

  // ↔️ Widths
  static const double widthXS = 20.0;
  static const double widthS = 45.0;
  static const double widthM = 60.0;
  static const double widthL = 80.0;
  static const double widthXL = 100.0;



  // 📱 MediaQuery-based responsive font
  static double responsiveFontSize(BuildContext context, double baseFontSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 360) {
      return baseFontSize * 0.85;
    } else if (screenWidth > 600) {
      return baseFontSize * 1.2;
    } else {
      return baseFontSize;
    }
  }

  // 🧮 MediaQuery-based spacing
  static double screenHeightPercentage(BuildContext context, double percent) {
    return MediaQuery.of(context).size.height * percent;
  }

  static double screenWidthPercentage(BuildContext context, double percent) {
    return MediaQuery.of(context).size.width * percent;
  }
}
