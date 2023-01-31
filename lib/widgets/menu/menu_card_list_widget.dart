import 'package:flutter/material.dart';

import '../../functions/bottom_sheet_function.dart';
import '../../utilities/app_images.dart';
import 'bottom_sheets/card_bottom_sheet.dart';

class MenuCardListWidget extends StatelessWidget {
  const MenuCardListWidget({super.key});

  static const List<String> cards = <String>[
    AppImages.card1,
    AppImages.card2,
    AppImages.card3,
  ];
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width / 2;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: width,
        child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                BottomSheetFunction().openDrageableSheet(
                  context,
                  child: const CardBottomSheet(),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: width,
                  child: Image.asset(cards[index], fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
