import 'dart:math';

import 'package:action_slider/src/action_slider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../database/local_data_base.dart';
import '../../providers/app_bar_function.dart';
import '../../utilities/app_colors.dart';
import '../../utilities/app_images.dart';
import '../../widgets/menu/menu_card_list_widget.dart';
import '../../widgets/menu/menu_tranfer_niqdi_card_widget.dart';
import '../../widgets/menu/menu_transation_buttons.dart';
import '../../widgets/menu/profile_drawer.dart';
import '../../widgets/customs/custom_fraction_amount.dart';
import '../../widgets/customs/custom_gradient_text.dart';
import '../../widgets/customs/custom_gradient_text_button.dart';
import '../../widgets/customs/custom_image_slider.dart';
import '../../widgets/customs/custom_slider_button.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double _amount = LocalDatabase.getIsLogin ? 143.42 : 0;
    return Scaffold(
      endDrawer: const ProfileDrawer(),
      endDrawerEnableOpenDragGesture: true,
      appBar: mainAppBar(),
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
            MenuTransationButtons(amount: _amount),
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
                    child: MenuTranderNaqdiCardWidget(),
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
            const MenuCardListWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomGradientText(
                '!اشترك ببرامج ولاء أكثر',
                gradient: AppColors().lightToDarkGreenLRGradient(),
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
                icon: CupertinoIcons.arrow_left_circle,
                action: (ActionSliderController p0) {},
                iconBoderSize: 4,
                borderRadius: 30,
                rolling: true,
                shape: BoxShape.circle,
              ),
            ),
            const MenuCardListWidget(),
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
}
