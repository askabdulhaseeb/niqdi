import 'package:action_slider/action_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utilities/app_images.dart';
import '../customs/custom_gradient_text.dart';
import '../customs/custom_gradient_text_button.dart';
import '../customs/custom_slider_button.dart';
import '../menu/bottom_sheets/swap_card_widget.dart';

class TransactionSuccefully extends StatelessWidget {
  const TransactionSuccefully({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.backgroundIcon),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  Image.asset(
                    AppImages.logo,
                    color: Colors.white,
                    height: 50,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            AppImages.progressIcon,
                            height: 60,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            '!تمت العملية بنجاح',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SwapCardWidget(
                            text1: '933',
                            text2: 'نقاط كيتزال',
                            text3: 'نقطة',
                            text4: 'الي تم تحويلها',
                            width: width,
                            height: 100,
                            isTransaction: true,
                          ),
                          const SizedBox(height: 20),
                          SwapCardWidget(
                            text1: '29.3',
                            text2: 'القيمة نقدًا',
                            text3: 'ريال',
                            text4: 'بعد التحويل',
                            width: width,
                            height: 100,
                            isTransaction: true,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'الخطوة التالية؟',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'تقدر الحين تحول رصيدك النقدي لحسابك البنكي',
                            style: TextStyle(color: Colors.black),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 42,
                            ),
                            child: CustomSliderButton(
                              text: 'Widraw to Bank Account',
                              icon: CupertinoIcons.arrow_left_circle,
                              action: (ActionSliderController p0) {
                                Navigator.of(context).pop();
                              },
                              iconBoderSize: 4,
                              borderRadius: 30,
                              rolling: true,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  CustomGradientTextButton(
                    text: 'Back To Main Menu',
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
