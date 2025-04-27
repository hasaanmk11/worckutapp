import 'package:app/pages/setGoals/addWorckut/add.dart';
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
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 20),
                      child: Row(
                        children: [
                          Text(
                            "Fitness",
                            style: commentStyle(40, Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 40),
                      child: Row(
                        children: [
                          Text(
                            "Know what you want - muscle,\nStrength, or fat loss. Clear goals\nkeep you focused and fired up every\nrep!",
                            style: commentStyle(12, Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
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
                    ),
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
