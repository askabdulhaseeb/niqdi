import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../functions/bottom_sheet_function.dart';
import '../screens/main_pages/account_page.dart';
import '../utilities/app_images.dart';
import '../widgets/auth/sign_in_bottom_sheet.dart';

mainAppBar() => AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Builder(
            builder: (BuildContext context) => IconButton(
              icon: AppBarIconWidget(
                // TODO: menu icon need to update
                icon: Icons.menu,
                title: 'القائمة',
                onRight: true,
                onTap: () => Scaffold.of(context).openEndDrawer(),
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 40,
            width: 40,
            child: Image.asset(AppImages.logo),
          ),
          const SizedBox(width: 10),
        ],
      ),
      actions: <Widget>[
        Builder(
          builder: (BuildContext context) => IconButton(
            icon: AppBarIconWidget(
              icon: CupertinoIcons.profile_circled,
              title: 'سجّل الدخول',
              onRight: false,
              onTap: () => _onSignIn(context),
            ),
            onPressed: () => _onSignIn(context),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );

_onSignIn(BuildContext context) async {
  BottomSheetFunction().openDrageableSheet(
    context,
    child: const SignInBottomSheet(),
  );
}
