import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'database/local_data_base.dart';
import 'providers/app_provider.dart';
import 'screens/main_screen/main_screen.dart';
import 'utilities/app_colors.dart';
import 'widgets/transaction/transaction_succefully.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase.init();
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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Effra',
          dividerTheme: const DividerThemeData(thickness: 0.2),
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.black),
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          primaryColor: AppColors.darkGreen,
        ),
        home: const TransactionSuccefully(),
      ),
    );
  }
}
