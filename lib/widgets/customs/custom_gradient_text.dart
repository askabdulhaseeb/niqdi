import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';

class CustomGradientText extends StatelessWidget {
  const CustomGradientText(
    this.text, {
    this.gradient,
    this.textAlign,
    this.style,
    super.key,
  });

  final String text;
  final TextAlign? textAlign;
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
          AppColors().pinkToBLueGradient().createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: style ??
            const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
      ),
    );
  }
}
