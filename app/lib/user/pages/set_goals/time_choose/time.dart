import 'package:intl/intl.dart';

int getDaysInMonth(String month) {
  int monthIndex = DateFormat.MMMM().parse(month).month;
  final now = DateTime.now();
  final firstDayOfMonth = DateTime(now.year, monthIndex, 1);
  final firstDayOfNextMonth = DateTime(now.year, monthIndex + 1, 1);
  return firstDayOfNextMonth.difference(firstDayOfMonth).inDays;
}
