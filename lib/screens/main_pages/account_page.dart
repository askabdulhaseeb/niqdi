import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../functions/bottom_sheet_function.dart';
import '../../utilities/app_colors.dart';
import '../../utilities/app_images.dart';
import '../../widgets/account/account_card_list_widget.dart';
import '../../widgets/account/account_tranfer_niqdi_card_widget.dart';
import '../../widgets/account/account_transation_buttons.dart';
import '../../widgets/account/profile_drawer.dart';
import '../../widgets/auth/sign_in_bottom_sheet.dart';
import '../../widgets/customs/custom_fraction_amount.dart';
import '../../widgets/customs/custom_gradient_icon.dart';
import '../../widgets/customs/custom_gradient_text.dart';
import '../../widgets/customs/custom_gradient_text_button.dart';
import '../../widgets/customs/custom_image_slider.dart';
import '../../widgets/customs/custom_slider_button.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double _amount = Random().nextInt(10) % 2 == 0 ? 0 : 143.42;
    return Scaffold(
      endDrawer: const ProfileDrawer(),
      endDrawerEnableOpenDragGesture: true,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Builder(
              builder: (BuildContext context) => IconButton(
                icon: AppBarIconWidget(
                  // TODO: menu icon need to update
                  icon: Icons.menu,
                  title: 'القائمة',
                  onRight: true,
                  onTap: () => Scaffold.of(context).openEndDrawer(),
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.logo),
            ),
            const SizedBox(width: 10),
          ],
        ),
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) => IconButton(
              icon: AppBarIconWidget(
                icon: CupertinoIcons.profile_circled,
                title: 'سجّل الدخول',
                onRight: false,
                onTap: () => _onSignIn(context),
              ),
              onPressed: () => _onSignIn(context),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const CustomImageSlider(),
            const CustomGradientText('الرصيد النقدي'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomFractionAmount(amount: _amount),
            ),
            AccountTransationButtons(amount: _amount),
            const SizedBox(height: 40),
            if (_amount > 0)
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.width / 1.15,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        AppImages.middelBackgroundImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 20,
                    right: 20,
                    top: -20,
                    child: AccountTranderNaqdiCardWidget(),
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  CustomGradientText(_amount > 0 ? 'بطاقاتي' : 'بطاقات نقدي'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                _amount > 0
                    ? 'اختر أي بطاقة هنا وحول رصيدها نقدي في حسابك'
                    : 'سجل بطاقاتك هنا وحول رصيدها نقدي في حسابك',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const AccountCardListWidget(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomGradientText(
                '!اشترك ببرامج ولاء أكثر',
                gradient: LinearGradient(
                  colors: <Color>[
                    AppColors.lightGreen,
                    AppColors.lightGreen,
                    AppColors.lightGreen,
                    AppColors.darkGreen,
                    AppColors.darkGreen,
                    AppColors.darkGreen,
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'بضغطة زر تقدر تسجل بكل هالبرامج وتبدأ تكسب نقاط وتحولها لرصيد',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 42),
              child: CustomSliderButton(
                text: '!سجلني بكل هالبرامج الحين',
                icon: Icons.arrow_back_ios_new_rounded,
                action: (p0) {},
                iconBoderSize: 4,
                borderRadius: 30,
                rolling: true,
                shape: BoxShape.circle,
              ),
            ),
            const AccountCardListWidget(),
            const SizedBox(height: 30),
            SizedBox(
              width: 200,
              child: CustomGradientTextButton(
                text: 'معرض البطاقات',
                onTap: () {},
              ),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  _onSignIn(BuildContext context) async {
    BottomSheetFunction().openDrageableSheet(
      context,
      child: const SignInBottomSheet(),
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
