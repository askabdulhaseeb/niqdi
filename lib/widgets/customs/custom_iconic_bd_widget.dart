import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';
import 'custom_gradient_icon_button.dart';

class CustomIconicBgWidget extends StatelessWidget {
  const CustomIconicBgWidget({
    required this.child,
    required this.icon,
    this.verticalMargin = 16,
    this.borderRadius = 12,
    this.iconBoderSize = 4,
    this.shape,
    this.gradient,
    super.key,
  });
  final Widget child;
  final IconData icon;
  final double verticalMargin;
  final double borderRadius;
  final double iconBoderSize;
  final BoxShape? shape;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
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
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          children: <Widget>[
            Expanded(child: child),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                gradient: gradient ??
                    const LinearGradient(
                      colors: <Color>[
                        AppColors.lightGreen,
                        AppColors.lightGreen,
                        AppColors.darkGreen,
                        AppColors.darkGreen,
                        AppColors.darkGreen,
                      ],
                    ),
              ),
              child: CustomGradientIconButton(
                icon,
                onTap: () {},
                gradient: gradient ??
                    const LinearGradient(
                      colors: <Color>[
                        AppColors.lightGreen,
                        AppColors.darkGreen,
                      ],
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
