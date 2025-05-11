
import 'package:app/pages/mealPlan/activities/activityModel/activity_model.dart';
import 'package:app/pages/mealPlan/activities/db/activity_db_functions.dart';

import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class EditActivity extends StatefulWidget {
  final String initialActivity;
  final int initialTime;
  final int id;

  const EditActivity({
    required this.initialActivity,
    required this.initialTime,
    required this.id,
  });

  @override
  State<EditActivity> createState() => _EditActivityState();
}

class _EditActivityState extends State<EditActivity> {
  List<String> activities = ["Meditation", "Yoga", "Cycling", "Swimming"];
  late String selectedActivity;
  late int selectedTime;
  late int ids;

  @override
  void initState() {
    super.initState();
    selectedActivity = widget.initialActivity;
    selectedTime = widget.initialTime;
    ids = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Edit Activity", style: commentStyle(18, Colors.black)),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedActivity,
              decoration: const InputDecoration(
                labelText: 'Choose Activity',
                border: OutlineInputBorder(),
              ),
              items:
                  activities.map((String activity) {
                    return DropdownMenuItem<String>(
                      value: activity,
                      child: Text(activity),
                    );
                  }).toList(),
              onChanged: (val) {
                setState(() {
                  selectedActivity = val!;
                });
              },
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<int>(
              value: selectedTime,
              decoration: const InputDecoration(
                labelText: 'Time (minutes)',
                border: OutlineInputBorder(),
              ),
              items: List.generate(10, (index) {
                int val = (index + 1) * 5;
                return DropdownMenuItem(
                  value: val,
                  child: Text('$val minutes'),
                );
              }),
              onChanged: (val) {
                setState(() {
                  selectedTime = val!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final data = ActivityModel(
                  image: "",
                  id: ids,
                  activity: selectedActivity,
                  time: selectedTime.toString(),
                );
                editeActivity(ids, data);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: const Text(
                "Update",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
