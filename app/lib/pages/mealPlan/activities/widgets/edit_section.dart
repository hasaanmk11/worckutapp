
import 'package:app/pages/mealPlan/activities/activityModel/activity_model.dart';
import 'package:app/pages/mealPlan/activities/edit_activity.dart';
import 'package:flutter/material.dart';

void editSection(BuildContext context, ActivityModel activity, key) {
    showDialog(
      context: context,
      builder: (context) {
        return EditActivity(
          initialActivity:
              activity.activity,
          initialTime: int.parse(
            activity.time,
          ),
          id: key,
        );
      },
    );
  }
