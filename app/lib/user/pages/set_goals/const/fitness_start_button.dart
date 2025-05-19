import 'dart:ui';


import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/set_goals/add_workout/add.dart';
import 'package:flutter/material.dart';

class fitnessStartButton extends StatelessWidget {
  const fitnessStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 40),
      child: Row(
        children: [
          InkWell(
            onTap:
                () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddWorkoutInSetGoal(),
                  ),
                ),
            child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

                gradient: commenGradient(),
              ),
              child: Center(
                child: Text("Start", style: commentStyle(20, Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
