import 'package:flutter/material.dart';

class AppColors {
  static const Color extreamDarkGreen = Color(0xFF008055);
  static const Color darkGreen = Color(0xFF00D18F);
  static const Color lightGreen = Color(0xFF3EF984);
  static const Color darkPink = Color(0xFFFE647B);
  static const Color darkOrange = Color(0xFFFFAE5C);
  static const Color darkBlue = Color(0xFF3924F2);

  lightToDarkGreenLRGradient() => const LinearGradient(
        colors: <Color>[
          AppColors.lightGreen,
          AppColors.lightGreen,
          AppColors.lightGreen,
          AppColors.darkGreen,
          AppColors.darkGreen,
          AppColors.darkGreen,
        ],
      );
  lightToDarkGreenLessColorsLRGradient() => const LinearGradient(
        colors: <Color>[
          AppColors.lightGreen,
          AppColors.darkGreen,
        ],
      );

  darkToLightGreenLRGradient() => const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: <Color>[
          AppColors.darkGreen,
          AppColors.darkGreen,
          AppColors.lightGreen,
        ],
      );

  darkToLightGreenTBGradient() => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          AppColors.darkGreen,
          AppColors.lightGreen,
          AppColors.lightGreen,
        ],
      );
  darkToLightGreenThreeStepTBGradient() => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          AppColors.darkGreen,
          AppColors.darkGreen.withGreen(210),
          AppColors.lightGreen,
        ],
      );
  lightToDarkGreenTBGradient() => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          AppColors.lightGreen,
          AppColors.lightGreen,
          AppColors.lightGreen,
          AppColors.darkGreen,
        ],
      );
  orangeToPinkGradient() => const LinearGradient(
        colors: <Color>[
          AppColors.darkOrange,
          AppColors.darkPink,
        ],
      );
  noGradient(BuildContext context) => LinearGradient(
        colors: <Color>[
          Theme.of(context).textTheme.bodySmall!.color!,
          Theme.of(context).textTheme.bodySmall!.color!,
        ],
      );

  greyGradient() => LinearGradient(
        colors: <Color>[
          Colors.grey.withOpacity(0.2),
          Colors.grey.withOpacity(0.1)
        ],
      );
  pinkToBLueGradient() => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          AppColors.darkPink,
          AppColors.darkBlue,
        ],
      );
}
