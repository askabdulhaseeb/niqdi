import 'package:flutter/material.dart';
import '../../utilities/utilities.dart';

class CustomFractionAmount extends StatelessWidget {
  const CustomFractionAmount({
    required this.amount,
    this.textDirection,
    this.fontSize = 20,
    super.key,
  });
  final double amount;
  final TextDirection? textDirection;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textDirection: TextDirection.rtl,
      text: TextSpan(
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge!.color,
          fontWeight: FontWeight.bold,
          fontSize: fontSize + 6,
        ),
        children: <TextSpan>[
          TextSpan(
              text: Utilities().beforeFrctional(amount),
              style: TextStyle(fontSize: (fontSize * 2) + (fontSize / 1.5))),
          TextSpan(
            text: amount
                .toStringAsFixed(2)
                .substring(amount.toString().indexOf('.')),
          ),
          TextSpan(
            text: ' ريال',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
