import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/app_images.dart';
import '../../widgets/account/account_card_list_widget.dart';
import '../../widgets/customs/custom_fraction_amount.dart';
import '../../widgets/customs/custom_gradient_text.dart';
import '../../widgets/customs/custom_gradient_text_button.dart';
import '../../widgets/customs/custom_image_slider.dart';
import '../../widgets/customs/custom_gradient_icon.dart';
import '../../widgets/account/account_tranfer_niqdi_card_widget.dart';
import '../../widgets/account/account_transation_buttons.dart';
import '../../widgets/customs/custom_slider_button.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  static const double _amount = 0;
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
              title: 'القائمة',
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
              title: 'سجّل الدخول',
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
            const CustomGradientText('الرصيد النقدي'),
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child:
                  CustomGradientText(_amount > 0 ? 'My Card' : 'بطاقات نقدي'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                _amount > 0
                    ? 'This is just a hint text which can be in multiphle lines'
                    : 'سجل بطاقاتك هنا وحول رصيدها نقدي في حسابك',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 42),
              child: CustomSliderButton(text: '!سجلني بكل هالبرامج الحين'),
            ),
            const AccountCardListWidget(),
            const SizedBox(height: 30),
            SizedBox(
              width: 200,
              child: CustomGradientTextButton(
                text: 'Cards Galary',
                onTap: () {},
              ),
            ),
            const SizedBox(height: 120),
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
