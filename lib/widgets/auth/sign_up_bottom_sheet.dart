import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../functions/bottom_sheet_function.dart';
import '../../utilities/app_colors.dart';
import '../customs/custom_gradient_icon.dart';
import '../customs/custom_gradient_text_button.dart';
import '../customs/custom_iconic_bd_widget.dart';
import '../customs/custom_slider_button.dart';
import '../customs/custom_text_form_field.dart';
import 'sign_in_otp_bottom_sheet.dart';
import 'phone_number_field.dart';
import 'sign_in_bottom_sheet.dart';
import 'sign_up_otp_bottom_sheet.dart';

class SignUpBottomSheet extends StatefulWidget {
  const SignUpBottomSheet({super.key});

  @override
  State<SignUpBottomSheet> createState() => _SignUpBottomSheetState();
}

class _SignUpBottomSheetState extends State<SignUpBottomSheet> {
  final TextEditingController _name = TextEditingController();
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
                    Icons.person_add_alt,
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
                        'Sign Up',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: width / 1.5,
                    child: CustomSliderButton(
                      text: 'Or Sign In',
                      action: (p0) async {
                        Navigator.of(context).pop();
                        await BottomSheetFunction().openDrageableSheet(
                          context,
                          child: const SignInBottomSheet(),
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
                  const SizedBox(height: 20),
                  CustomIconicBgWidget(
                    icon: Icons.phone,
                    child: CustomTextFormField(
                      controller: _name,
                      hint: 'Name',
                    ),
                  ),
                  StatefulBuilder(builder: (
                    BuildContext context,
                    Function setState,
                  ) {
                    return CustomIconicBgWidget(
                      icon: Icons.phone,
                      verticalMargin: 8,
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
                  const SizedBox(height: 30),
                  SizedBox(
                    width: width / 1.5,
                    child: CustomGradientTextButton(
                      text: 'Regest OTP',
                      onTap: () async {
                        Navigator.of(context).pop();
                        BottomSheetFunction().openDrageableSheet(
                          context,
                          child: SignUpOTPBottomSheet(
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
