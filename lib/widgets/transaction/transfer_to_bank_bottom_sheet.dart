import 'package:action_slider/action_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../functions/bottom_sheet_function.dart';
import '../../utilities/app_colors.dart';
import '../customs/custom_fraction_amount.dart';
import '../customs/custom_gradient_icon.dart';
import '../customs/custom_slider_button.dart';
import 'transation_detail_bottom_sheet.dart';

class TranferToBankBottomSheet extends StatefulWidget {
  const TranferToBankBottomSheet({required this.imageURL, super.key});
  final String imageURL;

  @override
  State<TranferToBankBottomSheet> createState() =>
      _TranferToBankBottomSheetState();
}

class _TranferToBankBottomSheetState extends State<TranferToBankBottomSheet> {
  double _value = 40;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      maxChildSize: 1,
      minChildSize: 0.6,
      expand: false,
      builder: (
        BuildContext context,
        ScrollController scrollController,
      ) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 16),
                  CustomGradientIcon(
                    Icons.handshake_outlined,
                    size: 80,
                    gradient: AppColors().darkToLightGreenThreeStepTBGradient(),
                  ),
                  SizedBox(
                    width: width / 1.5,
                    child: const FittedBox(
                      child: Text(
                        'Tranfer To Bank',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'How much balance you want to convert?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: SfSlider(
                            min: 0,
                            max: 100,
                            value: _value,
                            interval: 25,
                            showTicks: false,
                            showLabels: true,
                            activeColor: const Color(0xff30eb89),
                            inactiveColor: const Color(0xffe0deda),
                            //enableTooltip: true,
                            minorTicksPerInterval: 1,
                            onChanged: (dynamic value) {
                              setState(() {
                                _value = value;
                              });
                            },
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const <Widget>[
                            Text(
                              '151.38',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'ريال',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Your Remaining balance after convertion is: 51.52 SAR',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.1),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: const <Widget>[
                        _Tile(
                            title: 'Value of converted Points', amount: 151.38),
                        Divider(),
                        _Tile(title: 'Convertion Fees', amount: 3.77),
                        Divider(),
                        _Tile(title: 'VAT amount 15%', amount: 0.49),
                        Divider(),
                        _Tile(
                          title:
                              'Your Totoal remaining balance after convertion',
                          amount: 47.45,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'By proceding, you agree to term and condition',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 42,
                    ),
                    child: CustomSliderButton(
                      text: 'Slide to process',
                      icon: CupertinoIcons.arrow_left_circle,
                      action: (ActionSliderController p0) async {
                        Navigator.of(context).pop();
                        await BottomSheetFunction().openDrageableSheet(
                          context,
                          child: TransationDetailBottomSheet(
                              imageUrl: widget.imageURL),
                        );
                      },
                      iconBoderSize: 4,
                      borderRadius: 20,
                      rolling: true,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.title,
    required this.amount,
    Key? key,
  }) : super(key: key);
  final String title;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: <Widget>[
          CustomFractionAmount(amount: amount, fontSize: 8),
          Expanded(
            child: Text(
              title,
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
