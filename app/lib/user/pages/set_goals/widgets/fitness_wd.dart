import 'package:app/responsive/home_screen_layouts.dart';
import 'package:app/user/pages/set_goals/const/fitness_discription.dart';
import 'package:app/user/pages/set_goals/const/fitness_start_button.dart';
import 'package:app/user/pages/set_goals/const/fitness_text.dart';
import 'package:app/user/pages/set_goals/const/set_goal_color_gradiant.dart';
import 'package:app/user/pages/set_goals/set_goal_timer/const/timer_items.dart';
import 'package:app/user/pages/set_goals/set_goals.dart';
import 'package:flutter/material.dart';

class FitnessCardOfSetGoal extends StatelessWidget {
  final ScreenLayouts deviceType;

  const FitnessCardOfSetGoal({super.key, required this.deviceType});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width:
              deviceType.isWeb
                  ? MediaQuery.of(context).size.width - 20
                  : double.infinity,
          height: deviceType.isWeb ? 400 : 350,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.4)),
            gradient: setGoalColorGradian(),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FitnessText(),
              const SizedBox(height: 30),
              Row(children: [FitnessDiscription(layouts: deviceType,)]),
              const Spacer(),
              fitnessStartButton(),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: SizedBox(
            width: deviceType.isWeb ? 200 : 200,
            height: 100,
            child: Image.asset("assets/setGoal.png", fit: BoxFit.contain),
          ),
        ),
      ],
    );
  }
}
