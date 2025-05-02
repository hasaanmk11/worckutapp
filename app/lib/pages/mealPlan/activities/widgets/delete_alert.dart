import 'package:app/pages/mealPlan/activities/db/activity_db_functions.dart';
import 'package:flutter/material.dart';

void DeleteAlert(BuildContext context, key) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              "Are you sure you want to delete the card?",
            ),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  await deleteActivity(key);
                  Navigator.of(
                    context,
                  ).pop();
                },
                child: Text("Yes"),
              ),
            ],
          ),
    );
  }
