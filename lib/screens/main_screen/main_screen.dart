import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_provider.dart';
import '../../widgets/customs/custom_scaffold.dart';
import '../main_pages/account_page.dart';
import '../main_pages/cards_page.dart';
import '../main_pages/menu_page.dart';
import '../main_pages/store_page.dart';
import 'main_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String routeName = '/main-screen';

  static const List<Widget> _page = <Widget>[
    AccountPage(),
    StorePage(),
    CardsPage(),
    MenuPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffold: Scaffold(
        body: Consumer<AppProvider>(
          builder: (BuildContext context, AppProvider appPro, _) =>
              _page[appPro.currentIndex],
        ),
        // bottomNavigationBar: const MainBottomNavBar(),
        floatingActionButton: const MainBottomNavBar(),
      ),
    );
  }
}
