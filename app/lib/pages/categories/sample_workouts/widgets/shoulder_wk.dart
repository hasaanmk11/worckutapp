import 'package:app/pages/categories/sample_workouts/widgets/workout_Card.dart';
import 'package:flutter/material.dart';

class Shoulder extends StatelessWidget {
  const Shoulder({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildVideoPlayerCard(
            "https://youtu.be/EC4qL8WYRZU?si=YHPL6Pf-DgRjMDVf",
          ),
          buildVideoPlayerCard(
            "https://youtu.be/xbN2lx-qxuE?si=hpR-EDnkx5GyEkXn",
          ), // Example other video
        ],
      ),
    );
  }
}
