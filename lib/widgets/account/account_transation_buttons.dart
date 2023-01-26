import 'package:flutter/material.dart';

import '../customs/custom_gradient_icon.dart';

class AccountTransationButtons extends StatelessWidget {
  const AccountTransationButtons({required double amount, Key? key})
      : _amount = amount,
        super(key: key);
  final double _amount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomGradientIcon(
              Icons.history,
              isDisable: _amount <= 0 ? true : false,
            ),
            Text(
              'تاريخ العمليات',
              style: TextStyle(
                color: _amount <= 0
                    ? Colors.grey
                    : Theme.of(context).textTheme.bodyLarge!.color,
                fontSize: 24,
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomGradientIcon(
              // TODO: update amount icon here
              Icons.handshake_outlined,
              isDisable: _amount <= 0 ? true : false,
            ),
            Text(
              'تحويل لحسابي',
              style: TextStyle(
                color: _amount <= 0
                    ? Colors.grey
                    : Theme.of(context).textTheme.bodyLarge!.color,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
