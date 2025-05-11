import 'package:app/pages/transformation/const/const.dart';
import 'package:app/pages/transformation/functions/weekendnotifi.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
ValueNotifier<bool> reminderSwitchKeyNotifire = ValueNotifier(false);
void initReminderCheck() async {
  final result = await checkReminderIsenabled();
  print("swich is $result");

  if (result == true) {
    isWeekendApproaching();
  }
}

Future<bool> checkReminderIsenabled() async {



  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool savedState = prefs.getBool(reminderSwitchKey) ?? false;
  reminderSwitchKeyNotifire.value=savedState;
  return savedState;
}
