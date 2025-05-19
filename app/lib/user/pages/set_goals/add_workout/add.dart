import 'dart:io';


import 'package:app/admin/pages/workout_catogories/db/workout_db.dart';
import 'package:app/styles/cmn.dart';

import 'package:app/user/pages/set_goals/addWorckut/widgets/selectButton.dart';
import 'package:app/user/pages/set_goals/add_workout/widgets/wd.dart';
import 'package:flutter/material.dart';

class AddWorkoutInSetGoal extends StatefulWidget {
  const AddWorkoutInSetGoal({super.key});

  @override
  State<AddWorkoutInSetGoal> createState() => _AddWorkoutInSetGoalState();
}

class _AddWorkoutInSetGoalState extends State<AddWorkoutInSetGoal> {
  List<int> selectedIndexes = [];
  String selectedTime = 'beginner';
  int dyachooser = 1;

  @override
  void initState() {
    getDataWithId(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          TopImage(),
          SelectButton(selectedIndexes: selectedIndexes, day: dyachooser),
          SizedBox(height: 10),
          SizedBox(
            width: 200,
            height: 80,
            child: DropdownButtonFormField<String>(
              value: selectedTime,
              decoration: InputDecoration(
                labelText: 'Choose Workout',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
              dropdownColor: Colors.grey[900],
              style: TextStyle(color: Colors.white),
              items:
                  ["beginner", "Advanced", "Intermediate"].map((difficulty) {
                    return DropdownMenuItem(
                      value: difficulty,
                      child: Text(difficulty),
                    );
                  }).toList(),
              onChanged: (val) {
                if (val == 'beginner') {
                  getDataWithId(1);
                } else if (val == "Intermediate") {
                  getDataWithId(2);
                } else if (val == "Advanced") {
                  getDataWithId(3);
                }

                setState(() {
                  selectedTime = val!;
                });
              },
            ),
          ),
          SizedBox(
            width: 100,
            height: 50,
            child: DropdownButtonFormField<int>(
              value: dyachooser,
              decoration: InputDecoration(
                labelText: 'Choose Day',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
              dropdownColor: Colors.grey[900],
              style: TextStyle(color: Colors.white),
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

          ValueListenableBuilder(
            valueListenable: setGoalListener,
            builder:
                (context, value, child) => Expanded(
                  child:
                      value.isEmpty
                          ? const Center(child: Text("Not Added"))
                          : ListView.separated(
                            separatorBuilder:
                                (context, index) => const SizedBox(height: 20),
                            itemCount: value.length,
                            itemBuilder:
                                (context, index) => GestureDetector(
                                  child: Container(
                                    height: 80,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white..withValues(),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: commenGradient().withOpacity(
                                        0.4,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 30),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),

                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              width: 50,
                                              height: 50,
                                              child: Image.file(
                                                File(value[index].image),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  value[index].workoutName,
                                                  style: commentStyle(
                                                    20,
                                                    Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  "Reps: ${value[index].rep}",
                                                  style: commentStyle(
                                                    10,
                                                    Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  "Set: ${value[index].set}",
                                                  style: commentStyle(
                                                    10,
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
                                              if (isChecked == true) {
                                                selectedIndexes.add(index);
                                              } else {
                                                selectedIndexes.remove(index);
                                              }
                                            });
                                          },
                                          checkColor: Colors.white,
                                          activeColor: Colors.green,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          ),
                ),
          ),
        ],
      ),
    );
  }
}
