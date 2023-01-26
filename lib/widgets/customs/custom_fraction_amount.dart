import 'package:flutter/material.dart';
import '../../utilities/utilities.dart';

class CustomFractionAmount extends StatelessWidget {
  const CustomFractionAmount({
    required this.amount,
    this.textDirection,
    super.key,
  });
  final double amount;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textDirection: TextDirection.rtl,
      text: TextSpan(
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge!.color,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        children: <TextSpan>[
          TextSpan(
              text: Utilities().beforeFrctional(amount),
              style: const TextStyle(fontSize: 48)),
          TextSpan(
            text: amount
                .toStringAsFixed(2)
                .substring(amount.toString().indexOf('.')),
          ),
          const TextSpan(
            text: ' ريال',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
