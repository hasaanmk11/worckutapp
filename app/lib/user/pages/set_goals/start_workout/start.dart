import 'dart:ui';

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
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: commenColor(),
            ),
            child: const Center(
              child: Text(
                "Start",
                style: TextStyle(
                  fontSize: 20,
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
                child: ListView.separated(
                  padding: const EdgeInsets.all(10),
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 15),
                  itemCount: workout.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withValues(alpha: 0.1),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    (index + 1).toString(),
                                    style: commentStyle(16, Colors.black),
                                  ),
                                ),
                              ),
                              Text(
                                workout[index],
                                style: commentStyle(18, Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
