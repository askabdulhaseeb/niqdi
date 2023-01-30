import 'package:flutter/material.dart';

import '../../providers/app_bar_function.dart';
import '../../widgets/customs/custom_gradient_text.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              CustomGradientText('Store'),
            ],
          ),
        ),
      ),
    );
  }
}
