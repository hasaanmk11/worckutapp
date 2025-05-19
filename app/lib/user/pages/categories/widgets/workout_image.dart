import 'dart:io';

import 'package:app/admin/pages/workout_catogories/model/model.dart';
import 'package:flutter/material.dart';

class WorkoutImage extends StatelessWidget {
  const WorkoutImage({super.key, required this.workout});

  final Bignnermodel workout;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Image.file(
          File(workout.image),
          width: 200,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
