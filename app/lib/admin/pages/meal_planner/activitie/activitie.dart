import 'dart:io';

import 'package:app/admin/pages/meal_planner/activitie/functions/db_functions.dart';

import 'package:app/admin/pages/meal_planner/activitie/widgets/edit_alert.dart';
import 'package:app/styles/cmn.dart';
import 'dart:ui';
import 'package:app/admin/pages/meal_planner/activitie/Model/activity_model.dart';
import 'package:app/admin/pages/meal_planner/activitie/db/activity_db_functions.dart';
import 'package:app/user/pages/meal_plan/activities/edit_activity.dart';
import 'package:app/user/pages/meal_plan/activities/widgets/delete_alert.dart';
import 'package:app/user/pages/meal_plan/activities/widgets/edit_image_delete.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';

class AdminActivity extends StatefulWidget {
  const AdminActivity({super.key});

  @override
  State<AdminActivity> createState() => _AdminActivityState();
}

class _AdminActivityState extends State<AdminActivity> {
  @override
  void initState() {
    super.initState();
    getActivityData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0D0D0D),
        floatingActionButton: IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => AdminAddactivity()));
          },
          icon: Icon(Icons.add, color: Colors.white),
        ),

        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ValueListenableBuilder(
            valueListenable: getActivityDataByListeners,
            builder: (context, value, child) {
              return Column(
                children: [
                  Center(
                    child: Text(
                      "Activities",
                      style: commentStyle(20, Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child:
                        value.isEmpty
                            ? const Center(
                              child: Text(
                                "No activities added yet",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                            : ListView.separated(
                              itemCount: value.length,
                              separatorBuilder:
                                  (context, index) =>
                                      const SizedBox(height: 20),
                              itemBuilder: (context, index) {
                                final activity = value[index];
                                final box = Hive.box<ActivityModel>(boxName);
                                final key = box.keyAt(index);

                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10,
                                      sigmaY: 10,
                                    ),
                                    child: Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: commenGradient().withOpacity(
                                          0.4,
                                        ),
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.2),
                                          width: 1.5,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Activity Name: ${activity.activity}",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                "Time: ${activity.time} minutes",
                                                style: const TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withValues(alpha: 0.3),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: Colors.white
                                                        .withValues(alpha: 0.3),
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: ImageSection(
                                                    activity: activity,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: IconButton(
                                                  onPressed: () {
                                                    editSection(
                                                      context,
                                                      activity,
                                                      key,
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.edit,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),

                                              Expanded(
                                                child: IconButton(
                                                  onPressed: () {
                                                    // DeleteAlert
                                                    // deleteActivity(key);
                                                    DeleteAlert(context, key);
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
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
