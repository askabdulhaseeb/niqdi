import 'package:flutter/material.dart';
import 'package:action_slider/action_slider.dart';

import '../../utilities/app_colors.dart';
import 'custom_gradient_text.dart';

class CustomSliderButton extends StatelessWidget {
  const CustomSliderButton({
    required this.text,
    required this.icon,
    required this.action,
    this.rolling = false,
    this.borderRadius = 12,
    this.iconBoderSize = 0,
    this.textSize = 20,
    this.gradient,
    this.textGradient,
    this.shape,
    super.key,
  });
  final String text;
  final IconData icon;
  final dynamic Function(ActionSliderController)? action;
  final double borderRadius;
  final double textSize;
  final double iconBoderSize;
  final bool rolling;
  final BoxShape? shape;
  final Gradient? gradient;
  final Gradient? textGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: gradient ??
            const LinearGradient(
              colors: <Color>[
                AppColors.lightGreen,
                AppColors.darkGreen,
              ],
            ),
      ),
      child: ActionSlider.standard(
        foregroundBorderRadius: BorderRadius.circular(borderRadius),
        backgroundBorderRadius: BorderRadius.circular(borderRadius),
        backgroundColor: Colors.white,
        boxShadow: const <BoxShadow>[],
        stateChangeCallback: (oldState, state, controller) {
          if (state.position == 1) {
            action == null ? () {} : action!(controller);
          }
        },
        rolling: rolling,
        icon: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.all(iconBoderSize),
          decoration: BoxDecoration(
            shape: shape ?? BoxShape.rectangle,
            borderRadius: shape == null
                ? BorderRadius.circular(borderRadius)
                : shape == BoxShape.circle
                    ? null
                    : BorderRadius.circular(borderRadius),
            gradient: gradient ??
                const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                    AppColors.darkGreen,
                    AppColors.lightGreen,
                  ],
                ),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        direction: TextDirection.rtl,
        child: CustomGradientText(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          gradient: textGradient ??
              const LinearGradient(
                colors: <Color>[
                  AppColors.lightGreen,
                  AppColors.darkGreen,
                ],
              ),
        ),
      ),
    );
  }
}
