import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_images.dart';
import '../../customs/custom_gradient_icon.dart';

class CardBottomSheet extends StatelessWidget {
  const CardBottomSheet({super.key});

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
            child: Column(
              children: <Widget>[
                const SizedBox(height: 16),
                CustomGradientIcon(
                  CupertinoIcons.book,
                  size: 80,
                  gradient: AppColors().darkToLightGreenThreeStepTBGradient(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    'Card Name',
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
                          color: Colors.white,
                          fontSize: 16,
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
                ),
                
              ],
            ),
          ),
        );
      },
    );
  }
}
