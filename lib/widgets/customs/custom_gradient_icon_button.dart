import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';

class CustomGradientIconButton extends StatelessWidget {
  const CustomGradientIconButton(
    this.icon, {
    required this.onTap,
    this.iconColor,
    this.gradient,
    super.key,
  });
  final IconData icon;
  final Color? iconColor;
  final Gradient? gradient;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: gradient ?? AppColors().greyGradient(),
      ),
      child: Icon(
        icon,
        color: iconColor ?? Colors.white,
      ),
    );
  }
}
