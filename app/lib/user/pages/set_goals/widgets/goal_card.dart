import 'package:app/responsive/home_screen_layouts.dart';
import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/set_goals/set_goal_timer/db/db.dart';
import 'package:app/user/pages/set_goals/set_goals.dart';
import 'package:flutter/material.dart';

class GoalCards extends StatelessWidget {
  final ScreenLayouts deviceType;

  const GoalCards({super.key, required this.deviceType});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: setGoalCardListener,
      builder: (context, value, child) {
        List<int> savedDays = value.map((e) => e.day).toList();

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: deviceType.isWeb ? 4 : 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2 / 2,
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
                            style: commentStyle(
                              deviceType.isTablet
                                  ? 18
                                  : deviceType.isWeb
                                  ? 25
                                  : 16,
                              Colors.grey,
                            ),
                          ),
                          Icon(
                            Icons.arrow_upward_sharp,
                            size:
                                deviceType.isTablet
                                    ? 19
                                    : deviceType.isWeb
                                    ? 20
                                    : 13,
                            color: isSaved ? commenColor() : Colors.grey,
                          ),
                        ],
                      ),
                      Text(
                        "$dayNumber",
                        style: TextStyle(
                          fontSize:
                              deviceType.isTablet
                                  ? 30
                                  : deviceType.isWeb
                                  ? 50
                                  : 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: isSaved ? Colors.white : Colors.grey,
                        ),
                      ),
                      if (isSaved)
                        Text(
                          "Completed",
                          style: commentStyle(
                            deviceType.isTablet
                                ? 30
                                : deviceType.isWeb
                                ? 30
                                : 20,
                            Colors.lightGreenAccent,
                          ),
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
