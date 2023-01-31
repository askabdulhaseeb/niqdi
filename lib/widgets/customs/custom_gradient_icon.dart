// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';

class CustomGradientIcon extends StatelessWidget {
  const CustomGradientIcon(
    this.icon, {
    this.imagePath,
    this.gradient,
    this.size = 28,
    this.isDisable = false,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String? imagePath;
  final double size;
  final Gradient? gradient;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return imagePath != null
        ? SizedBox(height: size, width: size, child: Image.asset(imagePath!))
        : ShaderMask(
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
              return isDisable
                  ? const LinearGradient(
                          colors: <Color>[Colors.grey, Colors.grey])
                      .createShader(rect)
                  : gradient?.createShader(rect) ??
                      AppColors().pinkToBlueTBGradient().createShader(rect);
            },
          );
  }
}
