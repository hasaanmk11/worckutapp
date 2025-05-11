import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

ValueNotifier<bool> notificationCound = ValueNotifier(false);

final ImagePicker _picker = ImagePicker();
int currentWeekIndex = 0;
DateTime? lastPhotoTakenDate;
bool isReminderEnabled = false;

const String lastPhotoKey = 'last_photo_date';
 const String reminderSwitchKey = 'reminder_switch_state';
