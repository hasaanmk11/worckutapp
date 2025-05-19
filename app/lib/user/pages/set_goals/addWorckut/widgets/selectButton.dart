


import 'package:app/admin/pages/workout_catogories/db/workout_db.dart';
import 'package:app/user/pages/set_goals/start_workout/start.dart';
import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({
    super.key,
    required this.selectedIndexes,
    required this.day,
  });

  final List<int> selectedIndexes;
  final int day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: selectedIndexes.isNotEmpty,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      final selectedWorkouts =
                          selectedIndexes
                              .map((i) => setGoalListener.value[i].workoutName)
                              .toList();
                      return Start(workout: selectedWorkouts, day: day);
                    },
                  ),
                );
              },
              child: Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Select",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
