import 'package:flutter/material.dart';

import '../../widgets/customs/custom_scaffold.dart';
import 'main_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String routeName = '/main-screen';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffold: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(),
        bottomNavigationBar: MainBottomNavBar(),
      ),
    );
  }
}
