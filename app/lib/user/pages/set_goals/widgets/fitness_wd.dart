

import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/set_goals/const/fitness_discription.dart';
import 'package:app/user/pages/set_goals/const/fitness_start_button.dart';
import 'package:app/user/pages/set_goals/const/fitness_text.dart';
import 'package:app/user/pages/set_goals/const/set_goal_color_gradiant.dart';
import 'package:flutter/material.dart';

class FitnessCardOfSetGoal extends StatelessWidget {
  const FitnessCardOfSetGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.4)),
                gradient: setGoalColorGradian(),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  FitnessText(),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 4    ),
                    child: Row(children: [FitnessDiscription()]),
                  ),
                  fitnessStartButton(),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 160),
          child: SizedBox(
            width: 500,
            height: 500,
            child: Image.asset("assets/setGoal.png"),
          ),
        ),
      ],
    );
  }
}
