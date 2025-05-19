import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/transformation/const/const.dart';
import 'package:app/user/pages/transformation/transformation_page.dart';
import 'package:flutter/material.dart';

class NotificationListScreen extends StatefulWidget {
  const NotificationListScreen({super.key});

  @override
  State<NotificationListScreen> createState() => _NotificationListScreenState();
}

final reminderSwitchKey = 'reminder_switch_state';

class _NotificationListScreenState extends State<NotificationListScreen> {
  @override
  void initState() {
    // _loadReminderSwitchState();

    super.initState();
  }

  // Future<void> _loadReminderSwitchState() async {
  //   final isSevenDays = "isSevenDays";
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool savedState = prefs.getBool(isSevenDays) ?? false;

  //   notificationCound.value = savedState;
  // }

  @override
  Widget build(BuildContext context) {
    final List<String> notifications = [
      "It's been 7 days since your last transformation photo!",
      "Don’t forget to drink water!",
      "New workout plan available in the app!",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.green,
      ),
      body: ValueListenableBuilder(
        valueListenable: notificationCound,
        builder: (context, value, child) {
          print(value);

          if (value == false) {
            return Center(
              child: Text(
                "No Notification Found",
                style: commentStyle(20, Colors.black),
              ),
            );
          } else {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: 1,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WeeklyPhotoScreen(),
                        ),
                      ),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.notifications_active,
                        color: Colors.green,
                      ),
                      title: Text(
                        notifications[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
