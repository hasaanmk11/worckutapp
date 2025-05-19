
import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/home_screen/function/reminder_button_check.dart';
import 'package:app/user/pages/transformation/const/const.dart';
import 'package:app/user/pages/transformation/db/db.dart';
import 'package:app/user/pages/transformation/functions/takephoto.dart';
import 'package:app/user/pages/transformation/widgets/remindmetogglebutton.dart';
import 'package:app/user/pages/transformation/widgets/takephotobutton.dart';
import 'package:app/user/pages/transformation/widgets/transformationcard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeeklyPhotoScreen extends StatefulWidget {
  const WeeklyPhotoScreen({super.key});

  @override
  State<WeeklyPhotoScreen> createState() => _WeeklyPhotoScreenState();
}

class _WeeklyPhotoScreenState extends State<WeeklyPhotoScreen> {
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadLastPhotoDate();
    _loadReminderSwitchState();
    getImage();
  }

  Future<void> _loadLastPhotoDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dateString = prefs.getString(lastPhotoKey);
    if (dateString != null) {
      setState(() {
        lastPhotoTakenDate = DateTime.tryParse(dateString);
      });
    }
  }

  Future<void> _loadReminderSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool savedState = prefs.getBool(reminderSwitchKey) ?? false;

    setState(() {
      isReminderEnabled = savedState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Track Your\nTransformation',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: commenColor(),
                ),
              ),
              const SizedBox(height: 20),
              TransformationCard(),
              const SizedBox(height: 20),
              TakePhotoButton(
                onPressed: () {
                  takeWeeklyPhoto(
                    context: context,
                    lastPhotoTakenDate: lastPhotoTakenDate,
                    onPhotoTaken: (date) {
                      setState(() {
                        lastPhotoTakenDate = date;
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              ReminderToggleWidget(
                isReminderEnabled: isReminderEnabled,
                onToggle: (val) async {
                  reminderSwitchKeyNotifire.value = val;
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool(reminderSwitchKey, val);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
