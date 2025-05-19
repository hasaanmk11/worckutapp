import 'package:app/admin/pages/meal_planner/activitie/Model/activity_model.dart';
import 'package:app/user/pages/meal_plan/activities/edit_activity.dart';
import 'package:flutter/material.dart';

void editSection(BuildContext context, ActivityModel activity, id) {
  showDialog(
    context: context,
    builder: (context) {
      return EditActivity(
        initialActivity: activity.activity,
        initialTime: int.parse(activity.time),
        id: id,
      );
    },
  );
}
