import 'package:app/responsive/home_screen_layouts.dart';
import 'package:app/user/pages/set_goals/set_goal_timer/db/db.dart';
import 'package:app/user/pages/set_goals/widgets/activity_wd.dart';
import 'package:app/user/pages/set_goals/widgets/fitness_wd.dart';
import 'package:app/user/pages/set_goals/widgets/goal_card.dart';
import 'package:flutter/material.dart';

// Helper to detect device type or screen size category
enum DeviceScreenType { mobile, tablet, desktop }



// Main SetGoals widget
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          final layout=ScreenLayouts(constraints: constraints);
          return  Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              children: [
                FitnessCardOfSetGoal(deviceType: layout),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: activityText(),
                ),
                GoalCards(deviceType: layout),
              ],
            ),
          ),
        );
        },
       
      ),
    );
  }
}
