// lib/pages/transformation/widgets/reminder_toggle_widget.dart


import 'package:app/user/pages/home_screen/function/reminder_button_check.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../const/const.dart';

class ReminderToggleWidget extends StatefulWidget {
  final bool isReminderEnabled;
  final Function(bool) onToggle;

  const ReminderToggleWidget({
    super.key,
    required this.isReminderEnabled,
    required this.onToggle,
  });

  @override
  State<ReminderToggleWidget> createState() => _ReminderToggleWidgetState();
}

class _ReminderToggleWidgetState extends State<ReminderToggleWidget> {
  void _toggleSwitch(bool value) async {
    reminderSwitchKeyNotifire.value = value;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(reminderSwitchKey, value);

    widget.onToggle(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Remind me every week',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Remind me at the end of the week.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        ValueListenableBuilder(
          valueListenable: reminderSwitchKeyNotifire,
          builder: (context, values, child) {
            return Switch(
              value: values,
              onChanged: _toggleSwitch,
              activeColor: Colors.white,
              activeTrackColor: Colors.blue,
            );
          },
        ),
      ],
    );
  }
}
