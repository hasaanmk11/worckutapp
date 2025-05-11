import 'dart:async';

import 'package:intl/intl.dart';

int seconds = 30;
int restTime = 30;
Timer? timer;
Timer? restTimer;
bool isRunning = false;

int currentWorkoutIndex = 0;
Set<int> completedWorkouts = {};

final Map<String, int> timeOptions = {
  "5 mnt": 300,
  "30 Sec": 30,
  "2 mnt": 120,
  "1 mnt": 60,
  "45 Sec": 45,
  "10 mnt": 600,
  "15 mnt": 900,
};
String displayTime =
    '${NumberFormat('00').format(seconds ~/ 60)}:${NumberFormat('00').format(seconds % 60)}';
