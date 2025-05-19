import 'dart:async';

import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/set_goals/model/setgoal.dart';
import 'package:app/user/pages/set_goals/set_goal_timer/const/timer_items.dart';
import 'package:app/user/pages/set_goals/set_goal_timer/db/db.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  TimerPage({super.key, required this.day, required this.workout});

  final int day;
  final List<String> workout;

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Timer? timer;
  Timer? restTimer;

  int seconds = 30;
  int restTime = 30;

  bool isRunning = false;
  int currentWorkoutIndex = 0;
  List<int> completedWorkouts = [];

  String get displayTime {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  void startTimer() {
    stopTimer();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        setState(() {
          completedWorkouts.add(currentWorkoutIndex);
          if (currentWorkoutIndex < widget.workout.length - 1) {
            currentWorkoutIndex++;
            seconds = 30;
            startTimer(); 
          } else {
            stopTimer();
          }
        });
      }
    });
    setState(() => isRunning = true);
  }

  void stopTimer() {
    timer?.cancel();
    setState(() => isRunning = false);
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      seconds = 30;
      currentWorkoutIndex = 0;
      completedWorkouts.clear();
    });
  }

  void selectTime(int selectedSeconds) {
    stopTimer();
    setState(() => seconds = selectedSeconds);
  }

  void startRestTimer() {
    restTimer?.cancel();
    restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (restTime > 0) {
        setState(() => restTime--);
      } else {
        timer.cancel();
        setState(() => restTime = 30);
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    restTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Center(
              child: Text(
                "Countdown now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 20),

          
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  ...timeOptions.entries.map((entry) {
                    return GestureDetector(
                      onTap: () => selectTime(entry.value),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          entry.key,
                          style: TextStyle(
                            color:
                                (seconds == entry.value)
                                    ? Colors.white
                                    : Colors.grey,
                            fontSize: 18,
                            fontWeight:
                                (seconds == entry.value)
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  const SizedBox(width: 20),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isRunning ? Colors.white : Colors.blue,
                  width: 5,
                ),
              ),
              child: Center(
                child: Text(
                  displayTime,
                  style: TextStyle(
                    color: isRunning ? Colors.white : Colors.grey,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Controls + Workout List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: isRunning ? stopTimer : startTimer,
                    icon: Icon(
                      isRunning ? Icons.pause_circle : Icons.play_circle,
                      size: 60,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      height: 80,
                   
                      child: ListView.separated(
                        itemCount: widget.workout.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 6),
                        itemBuilder: (context, index) {
                          Color tileColor;
                          if (completedWorkouts.contains(index)) {
                            tileColor = Colors.green;
                          } else if (index == currentWorkoutIndex) {
                            tileColor = Colors.orange;
                          } else {
                            tileColor = Colors.grey;
                          }

                          return Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: tileColor,
                            ),
                            child: Center(
                              child: Text(
                                widget.workout[index],
                                style: commentStyle(15, Colors.white),
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

            const SizedBox(height: 20),

           
            ElevatedButton(
              onPressed: () async {
                final data = Setgoal(
                  day:
                      setGoalCardListener.value.isNotEmpty
                          ? setGoalCardListener.value.last.day + 1
                          : 1,
                );
                await setGoalCardUpdate(data);
                resetTimer();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Finish", style: commentStyle(15, Colors.white)),
            ),

            const Spacer(),

         
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green, width: 3),
                    ),
                    child: Center(
                      child: Text(
                        "00:${restTime.toString().padLeft(2, '0')}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: startRestTimer,
                    child: const Text(
                      "Rest",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
