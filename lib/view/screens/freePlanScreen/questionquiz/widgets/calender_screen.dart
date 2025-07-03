import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/styles/app_text_styles.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_style.dart';

class CalenderScreen extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? shadowColor;
  final BorderRadius borderRadius;
  final BoxBorder? border;

  const CalenderScreen({
    this.backgroundColor,
    this.shadowColor,
    this.borderRadius = AppStyles.radiusS,
    this.height,
    this.width,
    this.border,
    super.key,
    required DateTime? selectedDate,
    required DateFormat formatter,
  })

      : _selectedDate = selectedDate,
        _formatter = formatter;

  final DateTime? _selectedDate;
  final DateFormat _formatter;

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Padding(
      padding: AppStyles.paddingVerticalM,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor??AppColors.primaryColor.value,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(color: shadowColor ?? AppColors.primaryColor.value, offset: const Offset(0, 13)),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            // Space between icon and date
            Text(
                _selectedDate == null
                    ? 'dd/mm/yyyy'
                    : _formatter.format(_selectedDate),
                style: AppTextStyle.regular14
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(AssetPath.calenderIcon,height: 25,),
            ),
          ],
        ),
      ),
    ));
  }
}
