import 'package:flutter/material.dart';

import '../../providers/app_bar_function.dart';
import '../../widgets/customs/custom_gradient_icon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: true,
      appBar: mainAppBar(),
      body: const Center(child: Text('Menu')),
    );
  }
}
