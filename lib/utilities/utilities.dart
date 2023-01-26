import 'package:intl/intl.dart';

class Utilities {
  formatNumber(double number) {
    return NumberFormat.compact().format(number);
  }

  final NumberFormat format = NumberFormat.decimalPattern();
}
