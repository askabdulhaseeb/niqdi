import 'package:action_slider/action_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../../functions/bottom_sheet_function.dart';
import '../../../utilities/app_images.dart';
import '../customs/custom_fraction_amount.dart';
import '../customs/custom_gradient_text.dart';
import '../customs/custom_slider_button.dart';
import '../menu/bottom_sheets/swap_card_widget.dart';
import 'transaction_succefully.dart';

class TransationDetailBottomSheet extends StatefulWidget {
  const TransationDetailBottomSheet({required this.imageUrl, super.key});
  final String imageUrl;

  @override
  State<TransationDetailBottomSheet> createState() =>
      _TransationDetailBottomSheetState();
}

class _TransationDetailBottomSheetState
    extends State<TransationDetailBottomSheet> {
  double _value = 40.0;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width / 2;
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      maxChildSize: 0.9,
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
              children: <Widget>[
                cardDetails(scrollController, width),
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
                        width: width,
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

  cardDetails(ScrollController scrollController, double width) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: <Widget>[
          SizedBox(height: width / 2),
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
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(width: 0.2, color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text(
                  'Go Back',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 16),
                Icon(Icons.arrow_back_ios_new, color: Colors.grey),
              ],
            ),
          ),
          const CustomGradientText('Transation Detail'),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
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
                _Tile(title: 'Value of converted Points', amount: 933.38),
                Divider(),
                _Tile(title: 'Value in cash', amount: 21.03),
                Divider(),
                _Tile(title: 'Convertion Fees', amount: 1.07),
                Divider(),
                _Tile(title: 'VAT amount 15%', amount: 0.16),
                Divider(),
                _Tile(
                  title: 'Your Remaining Balance',
                  amount: 201.15,
                ),
                Divider(),
                _Tile(
                  title: 'Your Totoal remaining balance after convertion',
                  amount: 311.75,
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
                  child: const TransactionSuccefully(),
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
