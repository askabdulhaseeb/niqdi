import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/app_provider.dart';
import 'screens/main_screen/main_screen.dart';
import 'utilities/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // ignore: always_specify_types
      providers: [
        ChangeNotifierProvider<AppProvider>.value(value: AppProvider()),
      ],
      child: MaterialApp(
        title: 'Naqdi',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          primaryColor: AppColors.darkGreen,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
