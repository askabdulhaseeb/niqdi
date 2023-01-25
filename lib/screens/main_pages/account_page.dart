import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/app_images.dart';
import '../../widgets/customs/custom_image_slider.dart';
import '../../widgets/customs/gradient_icon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AppBarIconWidget(
              icon: Icons.menu,
              title: 'Side Menu',
              onRight: true,
              onTap: () {},
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset(AppImages.logo),
            ),
            AppBarIconWidget(
              icon: CupertinoIcons.profile_circled,
              title: 'Sign In',
              onRight: false,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          const CustomImageSlider(),
        ],
      ),
    );
  }
}

class AppBarIconWidget extends StatelessWidget {
  const AppBarIconWidget({
    required this.icon,
    required this.title,
    required this.onTap,
    required this.onRight,
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool onRight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (!onRight) Text(title),
          GradientIcon(icon: icon),
          if (onRight) Text(title),
        ],
      ),
    );
  }
}
