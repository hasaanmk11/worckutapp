import 'package:app/pages/categories/sample_workouts/widgets/pullUps.dart';
import 'package:app/pages/categories/sample_workouts/widgets/pushUps.dart';
import 'package:app/pages/categories/sample_workouts/widgets/shoulder_wk.dart';
import 'package:app/pages/categories/sample_workouts/widgets/warmUp.dart';
import 'package:app/pages/categories/sample_workouts/widgets/workout_Card.dart';
import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WorkoutVideoList extends StatefulWidget {
  const WorkoutVideoList({super.key});

  @override
  State<WorkoutVideoList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WorkoutVideoList> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Workout Video")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Warm Up", style: commentStyle(20, Colors.red)),
                ),
              ],
            ),
            WarmUp(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Push Ups",
                    style: commentStyle(20, Colors.blueAccent),
                  ),
                ),
              ],
            ),
            PushUps(),

            SizedBox(height: 50),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Pull Ups",
                    style: commentStyle(20, Colors.blueAccent),
                  ),
                ),
              ],
            ),
            pullUps(),
            SizedBox(height: 50),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "shoulder",
                    style: commentStyle(20, Colors.blueAccent),
                  ),
                ),
              ],
            ),
            Shoulder(),
          ],
        ),
      ),
    );
  }
}
