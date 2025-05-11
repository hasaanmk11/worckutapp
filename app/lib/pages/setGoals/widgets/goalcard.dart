import 'package:app/pages/setGoals/setGoalTimer/db/db.dart';

import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class GoalCards extends StatelessWidget {
  const GoalCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: setGoalCardListener,
      builder: (context, value, child) {
        List<int> savedDays = value.map((e) => e.day).toList();

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(100, (index) {
              int dayNumber = index + 1;

              bool isSaved = savedDays.contains(dayNumber);

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  color: isSaved ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "$dayNumber",
                        style: const TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      isSaved
                          ? Text(
                            "Completed",
                            style: commentStyle(15, Colors.lightGreenAccent),
                          )
                          : SizedBox(),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
