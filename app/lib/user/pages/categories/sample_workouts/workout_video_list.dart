import 'dart:async';
import 'dart:ui';

import 'package:app/user/pages/categories/sample_workouts/layouts/workout_list_mobile_layout.dart';
import 'package:app/user/pages/categories/sample_workouts/layouts/workout_list_web_layout.dart';

import 'package:app/user/pages/categories/sample_workouts/workout_data.dart';
import 'package:flutter/material.dart';

class WorkoutVideoList extends StatefulWidget {
  const WorkoutVideoList({super.key});

  @override
  State<WorkoutVideoList> createState() => _WorkoutVideoListState();
}

class _WorkoutVideoListState extends State<WorkoutVideoList> {
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => isLoaded = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final workouts = getWorkoutData();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Workout Videos"),
        backgroundColor: Colors.black.withOpacity(0.6),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splash.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final isMobile = width <= 600;
              final isTablet = width > 600 && width <= 1024;
              final horizontalPadding = width > 1024 ? width * 0.1 : 16.0;

              return Padding(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  80,
                  horizontalPadding,
                  20,
                ),
                child:
                    isMobile
                        ? buildMobileLayout(workouts, isLoaded)
                        : buildWebGridLayout(workouts, isTablet, isLoaded),
              );
            },
          ),
        ),
      ),
    );
  }
}
