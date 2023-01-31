import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/app_images.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = <String>[
      AppImages.card1,
      AppImages.card2,
      AppImages.card3,
      AppImages.card4,
      AppImages.card5,
      AppImages.card1,
      AppImages.card2,
      AppImages.card3,
      AppImages.card4,
      AppImages.card5,
      AppImages.card1,
      AppImages.card2,
      AppImages.card3,
      AppImages.card4,
      AppImages.card5,
    ];
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: imgList.length,
      itemBuilder: (BuildContext context, int index) => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(imgList[index], fit: BoxFit.cover),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                    AppColors.darkGreen,
                    AppColors.darkGreen,
                    AppColors.lightGreen,
                    AppColors.lightGreen,
                  ],
                ),
              ),
              child: SizedBox(
                height: 20,
                width: 20,
                child: Image.asset(AppImages.cartIcon),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
