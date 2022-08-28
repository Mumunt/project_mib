import 'package:intl/intl.dart';

class Helper {
  //Format currency
  static String formatCurrency(double number,
      {int decimalDigits = 2, String currency = 'IDR. '}) {
    return NumberFormat.simpleCurrency(
        locale: 'id_ID', decimalDigits: decimalDigits, name: currency)
        .format(number);
  }
}