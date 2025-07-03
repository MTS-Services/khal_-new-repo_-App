import 'package:flutter/material.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/styles/app_text_styles.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({
    super.key,
    this.image = AssetPath.labelIcon,
    required this.text,
    this.showfilter = false,
    this.filterImage = AssetPath.filterIcon,
    this.showImage = true,
  });

  final String image;
  final String text;
  final bool showfilter;
  final String filterImage;
  final bool showImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 20,
          children: [
            if (showImage) Image.asset(image, scale: 4),
            Text(text, style: AppTextStyle.bold16.apply(fontSizeFactor: 1.2)),
          ],
        ),
        if (showfilter) Image.asset(AssetPath.filterIcon, scale: 4),
      ],
    );
  }
}
