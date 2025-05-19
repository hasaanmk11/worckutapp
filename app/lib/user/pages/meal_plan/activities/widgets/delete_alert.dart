import 'package:app/admin/pages/meal_planner/activitie/db/activity_db_functions.dart';
import 'package:flutter/material.dart';

void DeleteAlert(BuildContext context, key) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirm Delete"),
        content: Text("Are you sure you want to delete this activity?"),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text("Delete", style: TextStyle(color: Colors.red)),
            onPressed: () async {
              await deleteActivity(key);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
