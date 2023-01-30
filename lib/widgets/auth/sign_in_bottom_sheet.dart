import 'package:action_slider/src/action_slider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../functions/bottom_sheet_function.dart';
import '../../utilities/app_colors.dart';
import '../customs/custom_gradient_icon.dart';
import '../customs/custom_gradient_text_button.dart';
import '../customs/custom_iconic_bd_widget.dart';
import '../customs/custom_slider_button.dart';
import 'sign_in_otp_bottom_sheet.dart';
import 'phone_number_field.dart';
import 'sign_up_bottom_sheet.dart';

class SignInBottomSheet extends StatelessWidget {
  const SignInBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    PhoneNumber? number;
    final double width = MediaQuery.of(context).size.width;
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
                    CupertinoIcons.profile_circled,
                    size: 80,
                    gradient: AppColors().darkToLightGreenThreeStepTBGradient(),
                  ),
                  SizedBox(
                    width: width / 2.5,
                    child: const FittedBox(
                      child: Text(
                        'Sign In',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: width / 1.5,
                    child: CustomSliderButton(
                      text: 'Or Sign Up',
                      action: (ActionSliderController p0) async {
                        Navigator.of(context).pop();
                        await BottomSheetFunction().openDrageableSheet(
                          context,
                          child: const SignUpBottomSheet(),
                        );
                      },
                      icon: CupertinoIcons.person_crop_circle_badge_xmark,
                      textGradient: AppColors().noGradient(context),
                      gradient: AppColors().orangeToPinkGradient(),
                    ),
                  ),
                  StatefulBuilder(builder: (
                    BuildContext context,
                    Function setState,
                  ) {
                    return CustomIconicBgWidget(
                      icon: Icons.phone,
                      verticalMargin: 24,
                      child: PhoneNumberField(
                        initialCountryCode: 'SA',
                        onChange: (PhoneNumber? value) {
                          setState(() {
                            number = value;
                          });
                        },
                      ),
                    );
                  }),
                  SizedBox(
                    width: width / 1.5,
                    child: CustomGradientTextButton(
                      text: 'Regest OTP',
                      onTap: () async {
                        Navigator.of(context).pop();
                        BottomSheetFunction().openDrageableSheet(
                          context,
                          child: SignInOTPBottomSheet(
                            number: number?.completeNumber ?? '+966',
                          ),
                        );
                      },
                    ),
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
