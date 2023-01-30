import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/app_images.dart';
import '../customs/custom_gradient_text_button.dart';

class MenuTranderNaqdiCardWidget extends StatelessWidget {
  const MenuTranderNaqdiCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              width: 4,
              color: Theme.of(context).cardColor,
            ),
          ),
          child: SizedBox(
            height: width / 2.6,
            width: width / 2.2,
            child: Image.asset(
              AppImages.card2,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: width / 3.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: width / 3.5,
                      child: const FittedBox(
                        child: Text(
                          '1245',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          'ريال 29 =',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'نقطة',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: const <Widget>[
                        Expanded(
                          child: FittedBox(
                            child: Text(
                              'الفرسان الذهبية',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        const Expanded(
                          child: Text(
                            'آخر تحديث: أمس، 8:42 م',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: AppColors().darkToLightGreenTBGradient(),
                          ),
                          // TODO: ICON NEED TO UPDATE
                          child: const Icon(
                            Icons.update_outlined,
                            color: AppColors.extreamDarkGreen,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              CustomGradientTextButton(
                text: 'حولها نقدي',
                onTap: () {},
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: FittedBox(
                    child: Text(
                      'رصيدك بعد التحويل: 202.4 ريال',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
