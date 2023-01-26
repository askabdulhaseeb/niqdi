import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/app_images.dart';
import '../../widgets/customs/custom_fraction_amount.dart';
import '../../widgets/customs/custom_gradient_text.dart';
import '../../widgets/customs/custom_image_slider.dart';
import '../../widgets/customs/custom_gradient_icon.dart';
import '../../widgets/account/account_tranfer_niqdi_card_widget.dart';
import '../../widgets/account/account_transation_buttons.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  static const double _amount = 173.432;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AppBarIconWidget(
              // TODO: menu icon need to update
              icon: Icons.menu,
              title: 'Side Menu',
              onRight: true,
              onTap: () {},
            ),
            SizedBox(
              height: 40,
              width: 40,
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const CustomImageSlider(),
            const CustomGradientText('cash Balance (in wallet)'),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: CustomFractionAmount(amount: _amount),
            ),
            const AccountTransationButtons(amount: _amount),
            const SizedBox(height: 40),
            if (_amount > 0)
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(AppImages.middelBackgroundImage),
                  ),
                  const Positioned(
                    left: 20,
                    right: 20,
                    top: -20,
                    child: AccountTranderNaqdiCardWidget(),
                  ),
                ],
              ),
            Container(
              height: 100,
            ),
          ],
        ),
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
          CustomGradientIcon(icon),
          if (onRight) Text(title),
        ],
      ),
    );
  }
}
