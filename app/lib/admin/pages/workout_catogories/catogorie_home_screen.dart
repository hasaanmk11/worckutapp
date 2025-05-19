import 'dart:ui';
import 'package:app/admin/pages/workout_catogories/widgets/catagories_card_builder.dart';
import 'package:app/admin/pages/workout_level/levels.dart';

import 'package:flutter/material.dart';

class LevelsHomeScreen extends StatefulWidget {
  const LevelsHomeScreen({super.key});

  @override
  State<LevelsHomeScreen> createState() => _LevelsHomeScreenState();
}

class _LevelsHomeScreenState extends State<LevelsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:  Text("Workout Levels"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            buildLevelCard(context, "Beginner", Icons.directions_walk, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BeginnerInterMediateAdvanced(id: 1),
                ),
              );
            }),

            const SizedBox(height: 20),

            buildLevelCard(context, "Intermediate", Icons.directions_run, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BeginnerInterMediateAdvanced(id: 2),
                ),
              );
            }),

            const SizedBox(height: 20),

        
            buildLevelCard(context, "Advanced", Icons.fitness_center, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BeginnerInterMediateAdvanced(id: 3),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

}