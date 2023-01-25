import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';

class CustomGradientText extends StatelessWidget {
  const CustomGradientText(
    this.text, {
    this.gradient,
    this.style,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) =>
          gradient?.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ) ??
          const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              AppColors.darkPink,
              AppColors.darkBlue,
            ],
          ).createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
      child: Text(
        text,
        style: style ??
            const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
      ),
    );
  }
}
