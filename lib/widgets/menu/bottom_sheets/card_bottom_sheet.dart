import 'package:action_slider/action_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naqdi/widgets/menu/bottom_sheets/swap_card_widget.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../../functions/bottom_sheet_function.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_images.dart';
import '../../customs/custom_gradient_icon.dart';
import '../../customs/custom_slider_button.dart';
import '../../transaction/transaction_succefully.dart';
import '../../transaction/transfer_to_bank_bottom_sheet.dart';

class CardBottomSheet extends StatefulWidget {
  const CardBottomSheet(
      {required this.width, required this.imageUrl, super.key});
  final double width;
  final String imageUrl;

  @override
  State<CardBottomSheet> createState() => _CardBottomSheetState();
}

class _CardBottomSheetState extends State<CardBottomSheet> {
  double _value = 40.0;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      maxChildSize: 0.95,
      minChildSize: 0.6,
      expand: false,
      builder: (
        BuildContext context,
        ScrollController scrollController,
      ) {
        // SizedBox(
        //   width: 240,
        //   child: Image.asset(AppImages.card1, fit: BoxFit.cover),
        // ),
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                cardDetails(scrollController),
                Positioned(
                  top: -60,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.white),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: widget.width,
                        child: Image.asset(widget.imageUrl, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  cardDetails(ScrollController scrollController) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: <Widget>[
          SizedBox(height: widget.width / 2),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Text(
              'الفرسان الذهبية',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'آخر تحديث: أمس، 8:42 م',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    AppImages.refreshIcon,
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ),
          Stack(
            children: [
              SizedBox(
                height: widget.width * 1.1,
                width: widget.width * 2,
              ),
              Positioned(
                top: 0,
                child: SwapCardWidget(
                  width: widget.width,
                  text1: '12345',
                  text2: 'نقاط الفرسان',
                  text3: 'نقطة',
                  text4: 'الموجودة في محفظتك',
                ),
              ),
              Positioned(
                bottom: 0,
                child: SwapCardWidget(
                  width: widget.width,
                  text1: '29.3',
                  text2: 'القيمة نقدًا',
                  text3: 'ريال',
                  text4: 'بعد التحويل',
                ),
              ),
              Positioned(
                top: 10,
                bottom: 10,
                right: 10,
                left: 10,
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(AppImages.conversionIcon),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('من نقاط الفرسان ≈ 0.17 ريال'),
              const Text('100'),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                AppImages.cinfoIcon,
                height: 15,
                fit: BoxFit.fill,
              )
            ],
          ),
          Row(
            children: [
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
                children: const <Widget>[
                  Text(
                    '933.75',
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
                    'نقطة',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'ريال  ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                '202.4 ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                ':رصيدك بعد التحويل',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 42),
            child: CustomSliderButton(
              text: 'Slide to process',
              icon: CupertinoIcons.arrow_left_circle,
              action: (ActionSliderController p0) async {
                Navigator.of(context).pop();
                await BottomSheetFunction().openDrageableSheet(
                  context,
                  // child: const TransactionSuccefully(),
                  child: TranferToBankBottomSheet(imageURL: widget.imageUrl),
                );
              },
              iconBoderSize: 4,
              borderRadius: 20,
              rolling: true,
              shape: BoxShape.rectangle,
            ),
          ),
        ],
      ),
    );
  }
}
