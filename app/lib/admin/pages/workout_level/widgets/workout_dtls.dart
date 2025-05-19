import 'dart:io';

import 'package:app/admin/pages/workout_catogories/model/model.dart';
import 'package:app/styles/cmn.dart';

import 'package:flutter/material.dart';

class WorkoutDtls extends StatelessWidget {
  const WorkoutDtls({super.key, required this.workout});

  final Bignnermodel workout;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(workout.workoutName, style: commentStyle(20, Colors.white)),
          const SizedBox(height: 4),
          Row(
            children: [
              Text("Duration:", style: commentStyle(16, Colors.white70)),
              SizedBox(width: 5),
              Text(workout.time, style: commentStyle(16, Colors.white)),
              SizedBox(width: 2),
              Text(
                "minutes",
                style: commentStyle(10, Colors.white70),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Row(
            children: [
              Text("Sets:", style: commentStyle(16, Colors.white70)),
              SizedBox(width: 5),
              Text(workout.set, style: commentStyle(16, Colors.white)),
            ],
          ),

          Row(
            children: [
              Text("Rep:", style: commentStyle(16, Colors.white70)),
              SizedBox(width: 5),
              Text(workout.rep, style: commentStyle(16, Colors.white)),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
