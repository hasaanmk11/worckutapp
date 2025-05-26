import 'dart:ui';

import 'package:app/responsive/home_screen_layouts.dart';
import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/set_goals/add_workout/widgets/wd.dart';
import 'package:app/user/pages/set_goals/set_goal_timer/timer.dart';
import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  final List<String> workout;
  final int day;

  const Start({super.key, required this.workout, required this.day});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layout = ScreenLayouts(constraints: constraints);

        final isGrid = layout.isTablet || layout.isWeb;
        final crossAxisCount = layout.isWeb ? 3 : 2;

        return Scaffold(
          backgroundColor: Colors.black,
          floatingActionButton: Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TimerPage(day: day, workout: workout),
                  ),
                );
              },
              child: Container(
                height: layout.isWeb ? 70 : 50,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: commenColor(),
                ),
                child: Center(
                  child: Text(
                    "Start",
                    style: TextStyle(
                      fontSize: layout.isWeb ? 20 : 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                TopImage(),

                const SizedBox(height: 30),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: commenGradient().withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:
                        isGrid
                            ? GridView.builder(
                              padding: const EdgeInsets.all(10),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 15,
                                    childAspectRatio: 3.2,
                                  ),
                              itemCount: workout.length,
                              itemBuilder:
                                  (context, index) => _buildWorkoutTile(
                                    index,
                                    workout[index],
                                    layout,
                                  ),
                            )
                            : ListView.separated(
                              padding: const EdgeInsets.all(10),
                              separatorBuilder:
                                  (context, index) =>
                                      const SizedBox(height: 15),
                              itemCount: workout.length,
                              itemBuilder:
                                  (context, index) => _buildWorkoutTile(
                                    index,
                                    workout[index],
                                    layout,
                                  ),
                            ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildWorkoutTile(int index, String title, ScreenLayouts layout) {
  // Responsive sizes
  final double cardHeight =
      layout.isWeb
          ? 100
          : layout.isTablet
          ? 80
          : 60;

  final double fontSize =
      layout.isWeb
          ? 26
          : layout.isTablet
          ? 20
          : 16;

  final double circleSize =
      layout.isWeb
          ? 60
          : layout.isTablet
          ? 50
          : 40;

  final double spacing =
      layout.isWeb
          ? 20
          : layout.isTablet
          ? 15
          : 10;

  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.1),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        padding: EdgeInsets.symmetric(horizontal: spacing),
        child: Row(
          children: [
            Container(
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(circleSize),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  style: commentStyle(fontSize * 0.9, Colors.black),
                ),
              ),
            ),
            SizedBox(width: spacing),
            Expanded(
              child: Text(
                title,
                style: commentStyle(fontSize, Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
