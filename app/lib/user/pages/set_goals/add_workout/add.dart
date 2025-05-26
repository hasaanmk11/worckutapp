import 'dart:io';

import 'package:app/admin/pages/workout_catogories/db/workout_db.dart';
import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/set_goals/addWorckut/widgets/selectButton.dart';
import 'package:app/user/pages/set_goals/add_workout/widgets/wd.dart';
import 'package:flutter/material.dart';
import 'package:app/responsive/home_screen_layouts.dart';

class AddWorkoutInSetGoal extends StatefulWidget {
  const AddWorkoutInSetGoal({super.key});

  @override
  State<AddWorkoutInSetGoal> createState() => _AddWorkoutInSetGoalState();
}

class _AddWorkoutInSetGoalState extends State<AddWorkoutInSetGoal> {
  List<int> selectedIndexes = [];
  String selectedTime = 'beginner';
  int dyachooser = 1;

  late ScreenLayouts layouts;

  @override
  void initState() {
    super.initState();
    getDataWithId(1);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        layouts = ScreenLayouts(constraints: constraints);
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: layouts.isWeb ? 60 : 20,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height:
                        layouts.isWeb
                            ? 220
                            : layouts.isTablet
                            ? 180
                            : 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/addSetGoal.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SelectButton(
                    selectedIndexes: selectedIndexes,
                    day: dyachooser,
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: layouts.isWeb ? 250 : 160,
                        height: 70,
                        child: DropdownButtonFormField<String>(
                          value: selectedTime,
                          decoration: _inputDecoration("Choose Workout"),
                          dropdownColor: Colors.grey[900],
                          style: const TextStyle(color: Colors.white),
                          items:
                              ["beginner", "Advanced", "Intermediate"]
                                  .map(
                                    (difficulty) => DropdownMenuItem(
                                      value: difficulty,
                                      child: Text(difficulty),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (val) {
                            setState(() {
                              selectedTime = val!;
                              getDataWithId(
                                val == 'beginner'
                                    ? 1
                                    : val == 'Intermediate'
                                    ? 2
                                    : 3,
                              );
                            });
                          },
                        ),
                      ),

                      SizedBox(
                        width: layouts.isWeb ? 180 : 100,
                        height: 70,
                        child: DropdownButtonFormField<int>(
                          value: dyachooser,
                          decoration: _inputDecoration("Choose Day"),
                          dropdownColor: Colors.grey[900],
                          style: const TextStyle(color: Colors.white),
                          items: List.generate(
                            100,
                            (index) => DropdownMenuItem(
                              value: index + 1,
                              child: Text('${index + 1}'),
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              dyachooser = val!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: setGoalListener,
                      builder:
                          (context, value, child) =>
                              value.isEmpty
                                  ? const Center(
                                    child: Text(
                                      "No Workouts Added",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                  : ListView.separated(
                                    separatorBuilder:
                                        (context, index) =>
                                            const SizedBox(height: 15),
                                    itemCount: value.length,
                                    itemBuilder: (context, index) {
                                      final item = value[index];
                                      return Container(
                                        height: layouts.isWeb ? 150 : 100,
                                        width:
                                            layouts.isWeb
                                                ? 500
                                                : double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          gradient: commenGradient()
                                              .withOpacity(0.4),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                // child: Image.file(
                                                //   File(item.image),
                                                //   width: 70,
                                                //   height: 70,
                                                //   fit: BoxFit.cover,
                                                // ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                    ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      item.workoutName,
                                                      style: commentStyle(
                                                        layouts.isWeb ? 20 : 16,
                                                        Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Reps: ${item.rep}",
                                                      style: commentStyle(
                                                        layouts.isWeb ? 20 : 16,
                                                        Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Set: ${item.set}",
                                                      style: commentStyle(
                                                        layouts.isWeb ? 20 : 16,
                                                        Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Checkbox(
                                              value: selectedIndexes.contains(
                                                index,
                                              ),
                                              onChanged: (bool? isChecked) {
                                                setState(() {
                                                  isChecked == true
                                                      ? selectedIndexes.add(
                                                        index,
                                                      )
                                                      : selectedIndexes.remove(
                                                        index,
                                                      );
                                                });
                                              },
                                              checkColor: Colors.white,
                                              activeColor: Colors.green,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// 🔹 Input decoration helper
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent),
      ),
    );
  }
}
