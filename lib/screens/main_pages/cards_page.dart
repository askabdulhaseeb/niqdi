import 'package:action_slider/src/action_slider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../providers/app_bar_function.dart';
import '../../utilities/app_colors.dart';
import '../../utilities/app_images.dart';
import '../../widgets/menu/profile_drawer.dart';
import '../../widgets/customs/custom_gradient_text.dart';
import '../../widgets/customs/custom_image_slider.dart';
import '../../widgets/customs/custom_slider_button.dart';
import '../../widgets/store/product_gridview.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const ProfileDrawer(),
      endDrawerEnableOpenDragGesture: true,
      appBar: mainAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              CustomGradientText(
                'Card Gallery',
                gradient: AppColors().lightToDarkGreenLRGradient(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Your Nidqi Card to your e-wallet and pay with your Nidqi balance for awsome discount',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 42),
                child: CustomSliderButton(
                  text: 'Sign me Up for all program',
                  icon: CupertinoIcons.arrow_left_circle,
                  action: (ActionSliderController p0) {},
                  iconBoderSize: 4,
                  borderRadius: 30,
                  rolling: true,
                  shape: BoxShape.circle,
                ),
              ),
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
              const SizedBox(height: 20),
              const ProductGridView(),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
