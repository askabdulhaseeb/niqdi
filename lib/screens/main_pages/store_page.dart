import 'package:flutter/material.dart';

import '../../providers/app_bar_function.dart';
import '../../utilities/app_colors.dart';
import '../../utilities/app_images.dart';
import '../../widgets/menu/profile_drawer.dart';
import '../../widgets/customs/custom_gradient_text.dart';
import '../../widgets/customs/custom_image_slider.dart';
import '../../widgets/store/product_gridview.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const ProfileDrawer(),
      endDrawerEnableOpenDragGesture: true,
      appBar: mainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomGradientText(
              'المتجر',
              gradient: AppColors().lightToDarkGreenLRGradient(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(AppImages.atmCard),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'أضف بطاقة نقدي لمحفظتك الإلكترونية وادفع برصيدك مع خصومات عند ش',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              width: 240,
              height: 70,
              child: Image.asset(AppImages.walletIcon),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      gradient: AppColors().greyGradient(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'عرض المزيد',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const CustomGradientText(
                    'جميع المتاجر',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const CustomImageSlider(),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ProductGridView(),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
