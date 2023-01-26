// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_provider.dart';
import '../../utilities/app_colors.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Container(
        height: 80,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: <Color>[
              AppColors.darkGreen,
              AppColors.darkGreen,
              AppColors.lightGreen,
            ],
          ),
        ),
        child: Consumer<AppProvider>(
            builder: (BuildContext context, AppProvider appPro, _) {
          final int currentIndex = appPro.currentIndex;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BottomNavItem(
                icon: CupertinoIcons.profile_circled,
                title: 'حساب',
                isSelected: currentIndex == 0,
                onTap: () => appPro.onIndexUpdate(0),
              ),
              BottomNavItem(
                icon: CupertinoIcons.tag,
                title: 'متجر',
                isSelected: currentIndex == 1,
                onTap: () => appPro.onIndexUpdate(1),
              ),
              BottomNavItem(
                icon: Icons.account_balance_wallet_outlined,
                title: 'البطاقات',
                isSelected: currentIndex == 2,
                onTap: () => appPro.onIndexUpdate(2),
              ),
              BottomNavItem(
                icon: CupertinoIcons.home,
                isSelected: currentIndex == 3,
                title: 'قائمة',
                onTap: () => appPro.onIndexUpdate(3),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            color: isSelected
                ? Theme.of(context).cardColor
                : Theme.of(context).textTheme.bodyText1!.color,
          ),
          Text(
            title,
            style: TextStyle(
              color: isSelected
                  ? Theme.of(context).cardColor
                  : Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
        ],
      ),
    );
  }
}
