import 'dart:async';

import 'package:app/pages/setGoals/model/setgoal.dart';
import 'package:app/pages/setGoals/setGoalTimer/const/timeritems.dart';
import 'package:app/pages/setGoals/setGoalTimer/db/db.dart';

import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerPage extends StatefulWidget {
  TimerPage({super.key, required this.day, required this.workout});

  final int day;
  List<String> workout;

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  void startTimer() {
    stopTimer();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timer.cancel();
        setState(() {
          isRunning = false;
          completedWorkouts.add(currentWorkoutIndex);

          if (currentWorkoutIndex < widget.workout.length - 1) {
            currentWorkoutIndex++;
            seconds = 30;
          }
        });
      }
    });
    setState(() {
      isRunning = true;
    });
  }

  void stopTimer() {
    if (timer != null) {
      timer!.cancel();
    }
    setState(() {
      isRunning = false;
    });
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
    setState(() {
      seconds = selectedSeconds;
    });
  }

  void startRestTimer() {
    restTimer?.cancel();
    restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (restTime > 0) {
        setState(() {
          restTime--;
        });
      } else {
        timer.cancel();
        setState(() {
          restTime = 30;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String displayTime =
        '${NumberFormat('00').format(seconds ~/ 60)}:${NumberFormat('00').format(seconds % 60)}';

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
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 20),
                  ...timeOptions.entries.map((entry) {
                    return GestureDetector(
                      onTap: () {
                        selectTime(entry.value);
                      },
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
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: isRunning ? stopTimer : startTimer,
                    icon: Icon(
                      isRunning ? Icons.pause_circle : Icons.play_circle,
                      size: 60,
                      color: Colors.green,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 120,
                      maxWidth: 100,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: ListView.separated(
                        separatorBuilder:
                            (context, index) => const SizedBox(height: 2),
                        itemCount: widget.workout.length,
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
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: tileColor,
                            ),
                            child: ListTile(
                              title: Text(
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
              onPressed: resetTimer,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: InkWell(
                onTap: () async {
                  final data = Setgoal(
                    day:
                        setGoalCardListener.value.isNotEmpty
                            ? setGoalCardListener.value.last.day + 1
                            : 1,
                  );

                  await setGoalCardUpdate(data);
                },
                child: const Text("Finish"),
              ),
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
