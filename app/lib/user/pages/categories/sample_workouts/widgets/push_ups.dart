
import 'package:app/user/pages/categories/sample_workouts/widgets/workout_card.dart';
import 'package:flutter/material.dart';

class PushUps extends StatelessWidget {
  const PushUps({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildVideoPlayerCard(
            "https://youtu.be/i9sTjhN4Z3M?si=oIMTYlHOhuAk3DaQ",
          ),
          buildVideoPlayerCard(
            "https://youtu.be/-0eYiItN2D8?si=O5jyzHJ5LATvt1O1",
          ), // Example other video
        ],
      ),
    );
  }
}
