import 'package:app/pages/setGoals/setGoalTimer/db/db.dart';

import 'package:app/pages/setGoals/widgets/FitnessWd.dart';
import 'package:app/pages/setGoals/widgets/activityWd.dart';
import 'package:app/pages/setGoals/widgets/goalcard.dart';

import 'package:flutter/material.dart';

class Setgoals extends StatefulWidget {
  Setgoals({super.key});

  @override
  State<Setgoals> createState() => _SetgoalsState();
}

class _SetgoalsState extends State<Setgoals> {
  String selectedMonth = "January";

  int daysInMonth = 31;
  @override
  void initState() {
    setGoalCardGetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              FitnessCardOfSetGoal(),
              const SizedBox(height: 50),
              ActivityText(),
              const SizedBox(height: 20),

              const SizedBox(height: 20),
              GoalCards(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
