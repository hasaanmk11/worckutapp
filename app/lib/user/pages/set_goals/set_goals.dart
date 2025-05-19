
import 'package:app/user/pages/set_goals/set_goal_timer/db/db.dart';
import 'package:app/user/pages/set_goals/widgets/activity_wd.dart';
import 'package:app/user/pages/set_goals/widgets/fitness_wd.dart';
import 'package:app/user/pages/set_goals/widgets/goal_card.dart';

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
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              FitnessCardOfSetGoal(),
              const SizedBox(height: 20),
              activityText(),

              GoalCards(),
            ],
          ),
        ),
      ),
    );
  }
}
