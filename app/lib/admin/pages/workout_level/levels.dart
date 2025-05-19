import 'package:app/admin/pages/workout_catogories/db/workout_db.dart';
import 'package:app/admin/pages/workout_level/delete_alert/delete_alert.dart';
import 'package:app/admin/pages/workout_level/edit/edit.dart';
import 'package:app/admin/pages/workout_level/widgets/add_workout.dart';
import 'package:app/admin/pages/workout_level/widgets/play_icon.dart';
import 'package:app/admin/pages/workout_level/widgets/workout_dtls.dart';
import 'package:app/admin/pages/workout_level/widgets/yt_card.dart';

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:app/styles/cmn.dart';

class BeginnerInterMediateAdvanced extends StatefulWidget {
  final int id;

  const BeginnerInterMediateAdvanced({super.key, required this.id});

  @override
  State<BeginnerInterMediateAdvanced> createState() =>
      _BeginnerInterMediateAdvancedState();
}

class _BeginnerInterMediateAdvancedState
    extends State<BeginnerInterMediateAdvanced> {
  @override
  void initState() {
    getDataWithId(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          showCustomDialog(context, widget.id);
        },
        child: Icon(Icons.add, color: Colors.black, size: 25),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Levels"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: ValueListenableBuilder(
        valueListenable: getDataByLisner,
        builder: (context, value, child) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemCount: value.length,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              final workout = value[index];
              return Container(
                height: 160,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: commenGradient(),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      youtubeVideoCard(workout: workout),

                      const SizedBox(width: 16),
                      WorkoutDtls(workout: workout),
                      playIcon(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              editeCard(context, workout);
                            },
                            icon: Icon(Icons.edit, color: Colors.green),
                          ),

                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              deleteAlrtCard(workout, context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
