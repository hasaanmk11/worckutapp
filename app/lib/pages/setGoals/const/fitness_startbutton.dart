import 'dart:ui';


import 'package:app/pages/setGoals/addWorckut/add.dart';
import 'package:app/styles/cmn.dart';
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
              width: 70,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  "Start",
                  style: commentStyle(
                    12,
                    const Color.fromARGB(255, 108, 0, 148),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
