import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utilities/app_colors.dart';
import '../customs/custom_gradient_icon.dart';
import '../customs/custom_gradient_text_button.dart';
import '../customs/custom_iconic_bd_widget.dart';
import '../customs/custom_text_form_field.dart';

class EditUsernameBottomSheet extends StatefulWidget {
  const EditUsernameBottomSheet({super.key});

  @override
  State<EditUsernameBottomSheet> createState() =>
      _EditUsernameBottomSheetState();
}

class _EditUsernameBottomSheetState extends State<EditUsernameBottomSheet> {
  final TextEditingController _username = TextEditingController();
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
                    Icons.lock_person,
                    size: 80,
                    gradient: AppColors().darkToLightGreenThreeStepTBGradient(),
                  ),
                  const Text(
                    'Edit Username',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: CustomIconicBgWidget(
                      icon: Icons.fingerprint,
                      child: CustomTextFormField(
                        controller: _username,
                        hint: 'Username',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 240,
                    child: CustomGradientTextButton(
                      text: 'Save Changes',
                      onTap: () {},
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
