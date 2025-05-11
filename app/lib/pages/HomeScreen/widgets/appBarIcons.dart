import 'package:app/pages/transformation/const/const.dart';
import 'package:app/pages/transformation/transformation_page.dart';
import 'package:app/pages/userDtlsPage/userInfo/Info.dart';

import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';


class AppBarIcons extends StatefulWidget {
  const AppBarIcons({super.key});

  @override
  State<AppBarIcons> createState() => _AppBarIconsState();
}

class _AppBarIconsState extends State<AppBarIcons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // User Info Icon
        Center(
          child: InkWell(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => const Info()));
            },
            child: const Icon(Icons.person, color: Colors.white, size: 30),
          ),
        ),

        // Notification Icon
        SizedBox(
          height: 30,
          width: 30,
          child: InkWell(
            onTap: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotificationListScreen(),
                ),
              );
            },
            child: ValueListenableBuilder<bool>(
              valueListenable: notificationCound,
              builder: (context, value, child) {
                return Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset("assets/notofication.png"),
                      if (value)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 18,
                            height: 18,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 6,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Text(
                              "New",
                              style: commentStyle(8, Colors.white),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

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
