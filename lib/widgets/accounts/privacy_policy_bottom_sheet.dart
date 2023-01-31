import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utilities/app_colors.dart';
import '../../utilities/utilities.dart';
import '../customs/custom_gradient_icon.dart';

class PrivacyPolicyBottomSheet extends StatelessWidget {
  const PrivacyPolicyBottomSheet({super.key});

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
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
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
                      'سياسة الخصوصية',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                  ),
                  Text(
                    Utilities.paragraph,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
