import 'package:flutter/material.dart';
import 'package:zidney/utils/app_colors.dart';

import '../../../../../utils/app_style.dart';
import '../../../../../utils/asset_path.dart';

class AllSubjectScreen extends StatelessWidget {
  const AllSubjectScreen({
    super.key,
    required this.subName,
    required this.image,
  });
  final String subName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      height: AppStyles.screenHeightPercentage(context, 0.055),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.grey,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 16),
          Image.network(
            image,
            width: 25,
            height: 25,
            errorBuilder: (context, error, stackTrace) => Image.asset(AssetPath.labelIcon,width: 25,height: 25,),
          ),
          SizedBox(width: 16),
          Text(
            subName,
            style: TextStyle(
              fontWeight: AppStyles.weightMedium,
              fontSize: AppStyles.fontM,
            ),
          ),
        ],
      ),
    );
  }
}
