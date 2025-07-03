import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({
    super.key,
    required this.backgroundColor,
    required this.progressColor,
    required this.percentage,
  });
  final Color backgroundColor;//background color
  final Color progressColor;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.7,
      child: LinearPercentIndicator(
        lineHeight: 6,
        backgroundColor: backgroundColor,
        progressColor: progressColor,
        percent: percentage,
        barRadius: Radius.circular(5),
      ),
    );
  }
}
