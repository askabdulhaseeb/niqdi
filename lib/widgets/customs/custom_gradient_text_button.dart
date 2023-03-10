import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';

class CustomGradientTextButton extends StatelessWidget {
  const CustomGradientTextButton({
    required this.text,
    required this.onTap,
    this.textStyle,
    this.bgGradient,
    super.key,
  });
  final String text;
  final VoidCallback onTap;
  final TextStyle? textStyle;
  final Gradient? bgGradient;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: bgGradient ?? AppColors().lightToDarkGreenTBGradient(),
        ),
        child: Text(
          text,
          style: textStyle ??
              const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.extreamDarkGreen,
              ),
        ),
      ),
    );
  }
}
