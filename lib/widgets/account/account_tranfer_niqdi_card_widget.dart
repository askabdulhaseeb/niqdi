import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/app_images.dart';
import '../customs/custom_gradient_text_button.dart';

class AccountTranderNaqdiCardWidget extends StatelessWidget {
  const AccountTranderNaqdiCardWidget({Key? key}) : super(key: key);

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
            height: width / 2.4,
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
                          'SAR 29 =',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Naqdi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
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
                              'Card Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Expanded(
                          child: Text(
                            'Latesr update: Yesrerday 8:42 PM',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                AppColors.darkGreen,
                                AppColors.lightGreen,
                                AppColors.lightGreen,
                              ],
                            ),
                          ),
                          child: const Icon(Icons.update_outlined),
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
              SizedBox(
                width: width / 3.5,
                child: CustomGradientTextButton(
                  text: 'Tranfer',
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 20),
              const Expanded(
                  child: Text(
                'Your balance After this transation is 202.4 SAR',
                style: TextStyle(color: Colors.white),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
