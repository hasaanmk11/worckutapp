import 'package:app/pages/categories/bignner/beginners.dart';
import 'package:app/pages/categories/db/db.dart';
import 'package:app/pages/setGoals/addWorckut/widgets/selectButton.dart';
import 'package:app/pages/setGoals/addWorckut/widgets/wd.dart';
import 'package:app/pages/setGoals/startWorckut/start.dart';
import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class AddWorkoutInSetGoal extends StatefulWidget {
  const AddWorkoutInSetGoal({super.key});

  @override
  State<AddWorkoutInSetGoal> createState() => _AddWorkoutInSetGoalState();
}

class _AddWorkoutInSetGoalState extends State<AddWorkoutInSetGoal> {
  List<int> selectedIndexes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 207, 207, 207),

      body: Column(
        children: [
          TopImage(),
          SelectButton(selectedIndexes: selectedIndexes),
          ValueListenableBuilder(
            valueListenable: beginners,
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
                                      color:
                                          selectedIndexes.contains(index)
                                              ? Colors.blueGrey
                                              : const Color.fromARGB(
                                                255,
                                                60,
                                                135,
                                                255,
                                              ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 30),
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
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
                                                  value[index].name,
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
