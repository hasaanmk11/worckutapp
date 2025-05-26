import 'package:app/user/pages/categories/sample_workouts/widgets/pull_ups.dart';
import 'package:app/user/pages/categories/sample_workouts/widgets/push_ups.dart';
import 'package:app/user/pages/categories/sample_workouts/widgets/shoulder_wk.dart';
import 'package:app/user/pages/categories/sample_workouts/widgets/warm_up.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> getWorkoutData() {
  return [
    {'title': 'Warm Up', 'color': Colors.red, 'widget': const WarmUp()},
    {
      'title': 'Push Ups',
      'color': Colors.blueAccent,
      'widget': const PushUps(),
    },
    {'title': 'Pull Ups', 'color': Colors.green, 'widget': const pullUps()},
    {'title': 'Shoulder', 'color': Colors.orange, 'widget': const Shoulder()},
  ];
}
