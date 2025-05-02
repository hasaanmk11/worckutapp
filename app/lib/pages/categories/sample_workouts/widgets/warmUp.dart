import 'package:app/pages/categories/sample_workouts/widgets/workout_Card.dart';
import 'package:flutter/material.dart';

class WarmUp extends StatelessWidget {
  const WarmUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildVideoPlayerCard(
            "https://youtu.be/OcPs3x1vX1A?si=nYvSm7JDmXTylr2Z",
          ),
        ],
      ),
    );
  }
}
