// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/app_images.dart';
import '../customs/custom_gradient_icon_button.dart';
import '../customs/custom_gradient_text.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(AppImages.logo),
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
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.grey.withOpacity(0.1),
                      Colors.grey.withOpacity(0.1)
                    ],
                  ),
                  iconColor: Colors.grey,
                  padding: 0,
                  onTap: () {},
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 24),
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
                      title: 'What is Naqdi?',
                      icon: Icons.lightbulb_outline,
                      gradient: const LinearGradient(colors: <Color>[
                        AppColors.lightGreen,
                        AppColors.darkGreen,
                      ]),
                      onTap: () {},
                    ),
                    const Divider(),
                    _Tile(
                      title: 'Rate Our App',
                      icon: Icons.star_border_outlined,
                      gradient: const LinearGradient(colors: <Color>[
                        AppColors.darkOrange,
                        AppColors.darkPink,
                      ]),
                      onTap: () {},
                    ),
                    const Divider(),
                    _Tile(
                      title: 'Share our App',
                      icon: Icons.share,
                      gradient: LinearGradient(colors: <Color>[
                        AppColors.darkPink.withOpacity(0.8),
                        AppColors.darkBlue,
                      ]),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const CustomGradientText('Follow Us'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(AppImages.logo),
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(AppImages.logo),
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(AppImages.logo),
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(AppImages.logo),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'Complany Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Complany CR',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 80),
              const Text(
                'Something here',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 40,
                width: 40,
                child: Image.asset(AppImages.logo),
              ),
              const Text(
                '@mintharinfo',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 120),
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
    // ignore: unused_element
    this.padding = 10,
    Key? key,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final Gradient gradient;
  final VoidCallback onTap;
  final Color? iconColor;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                textDirection: TextDirection.rtl,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(width: 16),
            CustomGradientIconButton(
              icon,
              iconColor: iconColor ?? Colors.white,
              gradient: gradient,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
