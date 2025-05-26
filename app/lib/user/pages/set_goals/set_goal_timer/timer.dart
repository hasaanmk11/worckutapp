import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app/responsive/home_screen_layouts.dart';
import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/set_goals/model/setgoal.dart';
import 'package:app/user/pages/set_goals/set_goal_timer/const/timer_items.dart';
import 'package:app/user/pages/set_goals/set_goal_timer/db/db.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key, required this.day, required this.workout});

  final int day;
  final List<String> workout;

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Timer? _workoutTimer;
  Timer? _restTimer;

  int _seconds = 30;
  int _restTime = 30;
  bool _isRunning = false;
  int _currentWorkoutIndex = 0;
  List<int> _completedWorkouts = [];

  String get _formattedTime {
    final minutes = (_seconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _startWorkoutTimer() {
    _stopWorkoutTimer();
    _workoutTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() => _seconds--);
      } else {
        _handleWorkoutComplete();
      }
    });
    setState(() => _isRunning = true);
  }

  void _stopWorkoutTimer() {
    _workoutTimer?.cancel();
    setState(() => _isRunning = false);
  }

  void _resetWorkoutTimer() {
    _stopWorkoutTimer();
    setState(() {
      _seconds = 30;
      _currentWorkoutIndex = 0;
      _completedWorkouts.clear();
    });
  }

  void _selectWorkoutTime(int time) {
    _stopWorkoutTimer();
    setState(() => _seconds = time);
  }

  void _startRestTimer() {
    _restTimer?.cancel();
    setState(() => _restTime = 30);

    _restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_restTime > 0) {
        setState(() => _restTime--);
      } else {
        timer.cancel();
        setState(() => _restTime = 30);
      }
    });
  }

  void _handleWorkoutComplete() {
    _workoutTimer?.cancel();
    setState(() {
      _completedWorkouts.add(_currentWorkoutIndex);
      if (_currentWorkoutIndex < widget.workout.length - 1) {
        _currentWorkoutIndex++;
        _seconds = 30;
        _startWorkoutTimer();
      } else {
        _isRunning = false;
      }
    });
  }

  Color _getTileColor(int index) {
    if (_completedWorkouts.contains(index)) {
      return Colors.green;
    } else if (index == _currentWorkoutIndex) {
      return Colors.orange;
    } else {
      return Colors.grey;
    }
  }

  @override
  void dispose() {
    _workoutTimer?.cancel();
    _restTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layout = ScreenLayouts(constraints: constraints);

        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Text(
                    "Countdown now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: layout.fontSize + 4,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children:
                            timeOptions.entries.map((entry) {
                              final isSelected = _seconds == entry.value;
                              return GestureDetector(
                                onTap: () => _selectWorkoutTime(entry.value),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        isSelected
                                            ? Colors.white12
                                            : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    entry.key,
                                    style: TextStyle(
                                      color:
                                          isSelected
                                              ? Colors.white
                                              : Colors.grey,
                                      fontSize: layout.fontSize,
                                      fontWeight:
                                          isSelected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: layout.isWeb ? 300 : 140,
                    height: layout.isWeb ? 300 : 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _isRunning ? Colors.white : Colors.blue,
                        width: 5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        _formattedTime,
                        style: TextStyle(
                          color: _isRunning ? Colors.white : Colors.grey,
                          fontSize: layout.isWeb ? 100 : 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed:
                              _isRunning
                                  ? _stopWorkoutTimer
                                  : _startWorkoutTimer,
                          icon: Icon(
                            _isRunning ? Icons.pause_circle : Icons.play_circle,
                            size: layout.isWeb ? 70 : 50,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: SizedBox(
                            height: layout.isWeb ? 300 : 200,
                            child:
                                layout.isWeb
                                    ? GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: widget.workout.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount:
                                                layout.isWeb ? 4 : 2,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            childAspectRatio: 3,
                                          ),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: layout.isWeb ? 40 : 50,
                                          height: layout.isWeb ? 80 : 40,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            color: _getTileColor(index),
                                          ),
                                          child: Center(
                                            child: FittedBox(
                                              child: Text(
                                                widget.workout[index],
                                                style: commentStyle(
                                                  layout.isWeb ? 50 : 12,
                                                  Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                    : ListView.separated(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: widget.workout.length,
                                      separatorBuilder:
                                          (_, __) => const SizedBox(height: 6),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: layout.isWeb ? 80 : 50,
                                          height: layout.isWeb ? 80 : 40,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            color: _getTileColor(index),
                                          ),
                                          child: Center(
                                            child: Text(
                                              widget.workout[index],
                                              style: commentStyle(
                                                layout.fontSize + 1,
                                                Colors.white,
                                              ),
                                              textAlign: TextAlign.center,
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
                  SizedBox(
                    width: layout.isWeb ? 150 : 100,
                    height: layout.isWeb ? 70 : 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        final newDay =
                            setGoalCardListener.value.isNotEmpty
                                ? setGoalCardListener.value.last.day + 1
                                : 1;
                        await setGoalCardUpdate(Setgoal(day: newDay));
                        _resetWorkoutTimer();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(
                          horizontal: layout.isWeb ? 50 : 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Finish",
                          style: commentStyle(
                            layout.isWeb ? 29 : 12,
                            Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: layout.isWeb ? 100 : 90,
                        height: layout.isWeb ? 90 : 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 3),
                        ),
                        child: Center(
                          child: Text(
                            "00:${_restTime.toString().padLeft(2, '0')}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: layout.fontSize,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: InkWell(
                          onTap: _startRestTimer,
                          child: Text(
                            "Rest",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: layout.fontSize + 6,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
