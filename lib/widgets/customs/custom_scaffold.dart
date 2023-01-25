import 'package:flutter/material.dart';

import '../../utilities/app_images.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({required this.scaffold, Key? key}) : super(key: key);
  final Scaffold scaffold;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          SizedBox(
            height: width,
            width: width,
            child: Image.asset(AppImages.backgroundGrayLogo),
          ),
          scaffold,
        ],
      ),
    );
  }
}
