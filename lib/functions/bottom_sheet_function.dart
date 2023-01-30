import 'package:flutter/material.dart';

class BottomSheetFunction {
  openDrageableSheet(BuildContext context, {required Widget child}) async {
    await showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (BuildContext context) => child,
    );
  }
}
