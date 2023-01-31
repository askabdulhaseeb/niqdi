import 'package:action_slider/action_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utilities/app_colors.dart';
import '../../utilities/utilities.dart';
import '../customs/custom_gradient_icon.dart';
import '../customs/custom_gradient_icon_button.dart';
import '../customs/custom_iconic_bd_widget.dart';
import '../customs/custom_slider_button.dart';
import '../customs/custom_text_form_field.dart';

class HelpCenterBottomSheet extends StatefulWidget {
  const HelpCenterBottomSheet({super.key});

  @override
  State<HelpCenterBottomSheet> createState() => _HelpCenterBottomSheetState();
}

class _HelpCenterBottomSheetState extends State<HelpCenterBottomSheet> {
  final TextEditingController _hint = TextEditingController();
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
                    Icons.headphones_outlined,
                    size: 80,
                    gradient: AppColors().darkToLightGreenThreeStepTBGradient(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      'Help Center',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                  ),
                  const Text(
                    'Would you like to speak with a repersentitive?',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 42,
                    ),
                    child: CustomSliderButton(
                      text: 'Swipe to switch to WhatsApp',
                      icon: CupertinoIcons.arrow_left_circle,
                      action: (ActionSliderController p0) {},
                      iconBoderSize: 4,
                      borderRadius: 30,
                      rolling: true,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const Text(
                    'Would you like to speak with a repersentitive?',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: CustomIconicBgWidget(
                      icon: Icons.sticky_note_2_outlined,
                      child: CustomTextFormField(
                        controller: _hint,
                        hint: 'Lable of hint',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.1),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: <Widget>[
                        _Tile(title: 'Question', onTap: () {}),
                        const Divider(),
                        _Tile(title: 'Second Question', onTap: () {}),
                        const Divider(),
                        _Tile(title: 'Third Question', onTap: () {}),
                      ],
                    ),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: <Widget>[
            const Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Colors.grey,
            ),
            const Spacer(),
            Text(
              title,
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 16),
            CustomGradientIconButton(
              Icons.question_mark_outlined,
              iconColor: Colors.grey,
              gradient: AppColors().greyGradient(),
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
