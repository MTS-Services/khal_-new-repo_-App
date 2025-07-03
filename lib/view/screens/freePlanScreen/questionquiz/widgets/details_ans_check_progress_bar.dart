import 'package:flutter/material.dart';

class DetailsAnsCheckProgressBar extends StatelessWidget {
  final int totalSteps;
  final int currentSteps;

  const DetailsAnsCheckProgressBar({
    super.key,
    required this.totalSteps,
    required this.currentSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps * 2 - 1, (index) {
        if (index.isEven) {
          // Circle
          int circleIndex = index ~/ 2;
          bool isFilled = circleIndex < currentSteps;
          return _buildCircle(isFilled);
        } else {
          // Line only if previous circle is filled
          int lineIndex = (index - 1) ~/ 2;
          bool showLine = lineIndex < currentSteps - 1;
          return _buildLine(showLine);
        }
      }),
    );
  }

  Widget _buildCircle(bool isFilled) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isFilled ? const Color(0xFF98C93C) : Colors.transparent,
        border: Border.all(color: const Color(0xFF98C93C), width: 8),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildLine(bool show) {
    return Container(width: 70, height: 12, color: show ? const Color(0xFF98C93C) : Colors.transparent,);
  }
}
