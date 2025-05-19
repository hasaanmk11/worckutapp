
import 'package:app/user/pages/home_screen/widgets/app_bar_icons.dart';
import 'package:app/user/pages/transformation/functions/weekendnotifi.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<bool> reminderSwitchKeyNotifire = ValueNotifier(false);
void initReminderCheck() async {
  final result = await checkReminderIsenabled();

  if (result == true) {
    isWeekendApproaching();
  }
}

Future<bool> checkReminderIsenabled() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool savedState = prefs.getBool(reminderSwitchKey) ?? false;
  reminderSwitchKeyNotifire.value = savedState;
  return savedState;
}
