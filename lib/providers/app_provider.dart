import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  int _currentIndex = 1;
  int get currentIndex => _currentIndex;

  onIndexUpdate(int value) {
    _currentIndex = value;
    notifyListeners();
  }
}
