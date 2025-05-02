import 'package:app/pages/categories/sample_workouts/widgets/workout_Card.dart';
import 'package:flutter/material.dart';

class pullUps extends StatelessWidget {
  const pullUps({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildVideoPlayerCard(
            "https://youtu.be/xewBaDLnfBQ?si=lQCSbIGdpRzQhYyl",
          ),
          buildVideoPlayerCard(
            "https://youtu.be/Y3ntNsIS2Q8?si=dZka54Nx8LKdT29c",
          ), // Example other video
        ],
      ),
    );
  }
}
