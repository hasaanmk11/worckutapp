import 'package:app/pages/setGoals/const/fitness_startbutton.dart';
import 'package:app/pages/setGoals/const/fitnessdiscription.dart';
import 'package:app/pages/setGoals/const/fitnesstext.dart';



import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class FitnessCardOfSetGoal extends StatelessWidget {
  const FitnessCardOfSetGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 82, 0, 123),
                      Color.fromARGB(128, 175, 10, 251),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    FitnessText(),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 40),
                      child: Row(children: [FitnessDiscription()]),
                    ),
                    fitnessStartButton(),
                  ],
                ),
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
        Positioned(
          top: 50,
          left: 30,
          child: Text(
            "Set Goal",
            style: commentStyle(30, const Color.fromARGB(255, 85, 0, 124)),
          ),
        ),
      ],
    );
  }
}
