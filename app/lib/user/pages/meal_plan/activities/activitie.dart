import 'dart:ui';

import 'package:app/styles/cmn.dart';
import 'package:app/admin/pages/meal_planner/activitie/Model/activity_model.dart';
import 'package:app/admin/pages/meal_planner/activitie/db/activity_db_functions.dart';
import 'package:app/user/pages/meal_plan/activities/widgets/edit_image_delete.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Activitie extends StatefulWidget {
  const Activitie({super.key});

  @override
  State<Activitie> createState() => _ActivitieState();
}

class _ActivitieState extends State<Activitie> {
  @override
  void initState() {
    getActivityData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0D0D0D),

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
                                          color: Colors.white.withValues(
                                            alpha: 0.2,
                                          ),
                                          width: 1.5,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ActivityCardDtls(activity: activity),
                                          Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.black.withValues(
                                                alpha: 0.3,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: Colors.white.withValues(
                                                  alpha: 0.2,
                                                ),
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
//ActivityCardDtls
class ActivityCardDtls extends StatelessWidget {
  const ActivityCardDtls({
    super.key,
    required this.activity,
  });

  final ActivityModel activity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              "Activity Name:",
              style: commentStyle(
                16,
                Colors.white70,
              ),
            ),
            SizedBox(width: 3),
            Text(
              activity.activity,
              style: commentStyle(
                16,
                Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              "Time:",
              style: commentStyle(
                16,
                Colors.white70,
              ),
            ),
            SizedBox(width: 3),
            Text(
              activity.time,
              style: commentStyle(
                16,
                Colors.white,
              ),
            ),
            SizedBox(width: 3),
            Text(
              "minutes",
              style: commentStyle(
                16,
                Colors.white70,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
