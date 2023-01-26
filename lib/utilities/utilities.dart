import 'package:intl/intl.dart';

class Utilities {
  formatNumber(double number) {
    return NumberFormat.compact().format(number);
  }

  final NumberFormat format = NumberFormat.decimalPattern();

  String beforeFrctional(double value) {
    return NumberFormat().format(double.parse(
        value.toString().substring(0, value.toString().indexOf('.'))));
  }
}
