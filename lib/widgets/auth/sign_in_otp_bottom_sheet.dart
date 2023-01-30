import 'package:action_slider/src/action_slider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../functions/bottom_sheet_function.dart';
import '../../utilities/app_colors.dart';
import '../customs/custom_gradient_icon.dart';
import '../customs/custom_iconic_bd_widget.dart';
import '../customs/custom_slider_button.dart';
import '../customs/custom_text_form_field.dart';
import 'sign_up_bottom_sheet.dart';

class SignInOTPBottomSheet extends StatefulWidget {
  const SignInOTPBottomSheet({required this.number, super.key});
  final String number;

  @override
  State<SignInOTPBottomSheet> createState() => _SignInOTPBottomSheetState();
}

class _SignInOTPBottomSheetState extends State<SignInOTPBottomSheet> {
  final TextEditingController _otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        AppColors.darkGreen,
                        AppColors.darkGreen.withGreen(210),
                        AppColors.lightGreen,
                      ],
                    ),
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
                      textGradient: LinearGradient(
                        colors: <Color>[
                          Theme.of(context).textTheme.bodySmall!.color!,
                          Theme.of(context).textTheme.bodySmall!.color!,
                        ],
                      ),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          AppColors.darkOrange,
                          AppColors.darkPink,
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      '''You'll Revieve an SMS to number ${widget.number} Please enter it below''',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  CustomIconicBgWidget(
                    icon: Icons.phone,
                    verticalMargin: 24,
                    child: Row(
                      children: <Widget>[
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Resend',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            controller: _otp,
                            hint: 'OTP here',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width / 1.5,
                    child: CustomSliderButton(
                      text: 'Slide to SignIn',
                      action: (ActionSliderController p0) {
                        Navigator.of(context).pop();
                      },
                      icon: Icons.arrow_back_ios_new_outlined,
                      borderRadius: 20,
                      iconBoderSize: 3,
                      rolling: true,
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
