
import 'package:app/pages/mealPlan/activities/activityModel/activity_model.dart';
import 'package:app/pages/mealPlan/activities/add.dart';
import 'package:app/pages/mealPlan/activities/db/activity_db_functions.dart';
import 'package:app/pages/mealPlan/activities/widgets/delete_alert.dart';
import 'package:app/pages/mealPlan/activities/widgets/edit_image_delete.dart';
import 'package:app/pages/mealPlan/activities/widgets/edit_section.dart';




import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Activitie extends StatefulWidget {
  const Activitie({super.key});

  @override
  State<Activitie> createState() => _ActivitieState();
}

class _ActivitieState extends State<Activitie> {
  late String images;
  @override
  void initState() {
    getActivityData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => Addactivity()));
          },
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ValueListenableBuilder(
            valueListenable: getActivityDataByListeners,
            builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      "Activities",
                      style: commentStyle(20, Colors.black),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        final activity = value[index];

                        final box = Hive.box<ActivityModel>(boxName);
                        final key = box.keyAt(index);
                        return Container(
                          width: double.infinity,
                          height: 230,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 197, 197, 197),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Activity Name:",
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                        Text(
                                          activity.activity,
                                          style: commentStyle(15, Colors.black),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Text(
                                          "Time:",
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                        Text(
                                          activity.time,
                                          style: commentStyle(15, Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.purple,
                                      ),
                                      onPressed: () {
                                        editSection(context, activity, key);
                                      },
                                      child: const Text(
                                        "Edit",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[700],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SingleChildScrollView(
                                        child: ImageSection(activity: activity),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                      onPressed: () {
                                        DeleteAlert(context, key);
                                      },
                                      child: const Text(
                                        "Delete",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 20),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
