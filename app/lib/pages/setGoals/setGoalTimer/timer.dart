import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int seconds = 30;
  int restTime = 30;
  Timer? timer;
  Timer? restTimer;
  bool isRunning = false;

  final Map<String, int> timeOptions = {
    "5 mnt": 300,
    "30 Sec": 30,
    "2 mnt": 120,
    "1 mnt": 60,
    "45 Sec": 45,
    "10 mnt": 600,
    "15 mnt": 900,
  };

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
            IconButton(
              onPressed: isRunning ? stopTimer : startTimer,
              icon: Icon(
                isRunning ? Icons.pause_circle : Icons.play_circle,
                size: 60,
                color: Colors.green,
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
              child: const Text("Finish"),
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
