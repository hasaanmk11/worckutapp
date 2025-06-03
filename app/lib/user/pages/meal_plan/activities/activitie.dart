import 'dart:ui';
import 'package:app/responsive/home_screen_layouts.dart';
import 'package:app/styles/cmn.dart';
import 'package:app/admin/pages/meal_planner/activitie/Model/activity_model.dart';
import 'package:app/admin/pages/meal_planner/activitie/db/activity_db_functions.dart';
import 'package:app/user/pages/meal_plan/activities/widgets/edit_image_delete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          final layout = ScreenLayouts(constraints: constraints);

          final crossAxisCount =
              layout.isMobile
                  ? 2
                  : layout.isTablet
                  ? 3
                  : 4;

          return Scaffold(
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
                          "Your Activities",
                          style: commentStyle(24, Colors.white),
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
                                : GridView.builder(
                                  itemCount: value.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: crossAxisCount,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 16,
                                        childAspectRatio: 3 / 2,
                                      ),
                                  itemBuilder: (context, index) {
                                    final activity = value[index];

                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 8,
                                          sigmaY: 8,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            gradient: commenGradient()
                                                .withOpacity(0.25),
                                            border: Border.all(
                                              color: Colors.white.withOpacity(
                                                0.2,
                                              ),
                                              width: 1.5,
                                            ),
                                          ),
                                          padding: const EdgeInsets.all(12),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: ActivityCardDtls(
                                                  activity: activity,
                                                  layout: layout,
                                                ),
                                              ),

                                              const SizedBox(width: 8),

                                              Flexible(
                                                flex: 2,
                                                child: AspectRatio(
                                                  aspectRatio: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ),
                                                      border: Border.all(
                                                        color: Colors.white
                                                            .withOpacity(0.2),
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ),
                                                      child: ImageSection(
                                                        activity: activity,
                                                      ),
                                                    ),
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
          );
        },
      ),
    );
  }
}

class ActivityCardDtls extends StatelessWidget {
  const ActivityCardDtls({
    super.key,
    required this.activity,
    required this.layout,
  });

  final ActivityModel activity;
  final ScreenLayouts layout;

  @override
  Widget build(BuildContext context) {
    final int fontSize =
        layout.isMobile
            ? 14
            : layout.isTablet
            ? 12
            : 22;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          activity.activity,
          style: commentStyle(fontSize.toDouble(), Colors.white),
        ),
        const SizedBox(height: 6),
        Text(
          "Time: ${activity.time} minutes",
          style: commentStyle(fontSize.toDouble(), Colors.white70),
        ),
      ],
    );
  }
}
