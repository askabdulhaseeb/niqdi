import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:action_slider/action_slider.dart';

import '../../utilities/app_colors.dart';
import 'custom_gradient_text.dart';

class CustomSliderButton extends StatelessWidget {
  const CustomSliderButton({required this.text, this.textSize = 20, super.key});
  final String text;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: <Color>[
            AppColors.lightGreen,
            AppColors.darkGreen,
          ],
        ),
      ),
      child: ActionSlider.standard(
        foregroundBorderRadius: BorderRadius.circular(30),
        backgroundBorderRadius: BorderRadius.circular(30),
        backgroundColor: Colors.white,
        boxShadow: const <BoxShadow>[],
        icon: Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                AppColors.darkGreen,
                AppColors.lightGreen,
              ],
            ),
          ),
          child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        direction: TextDirection.rtl,
        child: CustomGradientText(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          gradient: const LinearGradient(
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
