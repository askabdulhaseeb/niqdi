// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';

class GradientIcon extends StatelessWidget {
  const GradientIcon({
    required this.icon,
    this.gradient,
    this.size = 26,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final double size;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Theme.of(context).cardColor,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient?.createShader(rect) ??
            const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                AppColors.darkPink,
                AppColors.darkBlue,
              ],
            ).createShader(rect);
      },
    );
  }
}
