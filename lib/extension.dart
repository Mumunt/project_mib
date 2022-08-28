import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get format {
    return DateFormat('dd-MM-yyyy HH:mm:ss', "id").format(this);
  }
}