
import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/set_goals/set_goal_timer/db/db.dart';
import 'package:flutter/material.dart';

class GoalCards extends StatelessWidget {
  const GoalCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: setGoalCardListener,
      builder: (context, value, child) {
        List<int> savedDays = value.map((e) => e.day).toList();

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 3 / 2,
            ),
            itemCount: 100,
            itemBuilder: (context, index) {
              int dayNumber = index + 1;
              bool isSaved = savedDays.contains(dayNumber);

              return Container(
                decoration: BoxDecoration(
                  gradient: commenGradient().withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: commenColor().withOpacity(0.2)),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Day $dayNumber",
                            style: const TextStyle(
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Icon(
                            Icons.arrow_upward_sharp,
                            size: 13,
                            color: isSaved ? commenColor() : Colors.grey,
                          ),
                        ],
                      ),
                      Text(
                        "$dayNumber",
                        style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: isSaved ? Colors.white : Colors.grey,
                        ),
                      ),
                      if (isSaved)
                        Text(
                          "Completed",
                          style: commentStyle(15, Colors.lightGreenAccent),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
