import 'package:action_slider/action_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../database/local_data_base.dart';
import '../../providers/app_bar_function.dart';
import '../../utilities/app_colors.dart';
import '../../widgets/customs/custom_gradient_icon.dart';
import '../../widgets/customs/custom_gradient_icon_button.dart';
import '../../widgets/customs/custom_gradient_text.dart';
import '../../widgets/customs/custom_slider_button.dart';
import '../../widgets/menu/profile_drawer.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const ProfileDrawer(),
      endDrawerEnableOpenDragGesture: true,
      appBar: mainAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40),
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const CustomGradientText(
                'Ali Aliqahtani',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.1),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _Tile(
                  title: 'Need Help?',
                  icon: Icons.headset_mic_outlined,
                  gradient: AppColors().greyGradient(),
                  iconColor: Colors.grey,
                  showNextButton: false,
                  padding: 0,
                  onTap: () {},
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                margin:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.1),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: <Widget>[
                    _Tile(
                      title: 'Username',
                      icon: Icons.mode_edit_outline_outlined,
                      gradient: AppColors().greyGradient(),
                      onTap: () {},
                    ),
                    const Divider(),
                    _Tile(
                      title: 'Tearm and Condision',
                      icon: CupertinoIcons.book,
                      gradient: AppColors().greyGradient(),
                      onTap: () {},
                    ),
                    const Divider(),
                    _Tile(
                      title: 'Privacy Policy',
                      icon: CupertinoIcons.book,
                      gradient: AppColors().greyGradient(),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: CustomSliderButton(
                  text: 'Logout',
                  action: (ActionSliderController p0) async {
                    LocalDatabase.setIsLogin(false);
                  },
                  icon: CupertinoIcons.arrow_left_circle,
                  textGradient: AppColors().noGradient(context),
                  gradient: AppColors().orangeToPinkGradient(),
                ),
              ),
              const SizedBox(height: 140),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.title,
    required this.icon,
    required this.onTap,
    required this.gradient,
    this.iconColor,
    this.padding = 10,
    // ignore: unused_element
    this.showNextButton = true,
    Key? key,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final Gradient gradient;
  final VoidCallback onTap;
  final Color? iconColor;
  final double padding;
  final bool showNextButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: Row(
          mainAxisSize: showNextButton ? MainAxisSize.max : MainAxisSize.min,
          children: <Widget>[
            if (showNextButton)
              const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.grey,
              ),
            if (showNextButton) const Spacer(),
            Text(
              title,
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 16),
            CustomGradientIconButton(
              icon,
              iconColor: iconColor ?? Colors.grey,
              gradient: gradient,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
