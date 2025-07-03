import 'package:flutter/material.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/utils/styles/app_text_styles.dart';

import '../../../../../utils/asset_path.dart';

class CustomLogo extends StatelessWidget {
  final String? titleText;
  final String? subTitleText;
  const CustomLogo({super.key, this.titleText, this.subTitleText});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        SizedBox(
          height: AppStyles.heightL,
          width: AppStyles.widthL,
          child: Image.asset(AssetPath.appLogo),
        ),
        SizedBox(height: 10),
        Text(titleText!, style: AppTextStyle.bold20),
        Text(
          subTitleText!,
          style: AppTextStyle.regular12.apply(fontSizeFactor: 1.2),
        ),
      ],
    );
  }
}
