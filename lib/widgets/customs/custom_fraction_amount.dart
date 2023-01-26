import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomFractionAmount extends StatelessWidget {
  const CustomFractionAmount({required this.amount, super.key});
  final double amount;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge!.color,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        children: <TextSpan>[
          const TextSpan(
            text: 'ريال ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
              text: NumberFormat().format(double.parse(amount
                  .toString()
                  .substring(0, amount.toString().indexOf('.')))),
              style: const TextStyle(fontSize: 48)),
          TextSpan(
            text: amount
                .toStringAsFixed(2)
                .substring(amount.toString().indexOf('.')),
          ),
        ],
      ),
    );
  }
}
