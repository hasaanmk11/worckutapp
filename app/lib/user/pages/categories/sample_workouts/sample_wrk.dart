import 'dart:async';
import 'dart:ui';


import 'package:app/user/pages/categories/sample_workouts/widgets/glass_header/card.dart';
import 'package:app/user/pages/categories/sample_workouts/widgets/glass_header/glass_header.dart';
import 'package:app/user/pages/categories/sample_workouts/widgets/pull_ups.dart';
import 'package:app/user/pages/categories/sample_workouts/widgets/push_ups.dart';
import 'package:app/user/pages/categories/sample_workouts/widgets/shoulder_wk.dart';
import 'package:app/user/pages/categories/sample_workouts/widgets/warm_up.dart';
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
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 80, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                glassHeader("Warm Up", Colors.red),
                glassCard(
                  child: isLoaded ? const WarmUp() : _loadingPlaceholder(),
                ),
                const SizedBox(height: 30),

                glassHeader("Push Ups", Colors.blueAccent),
                glassCard(
                  child: isLoaded ? const PushUps() : _loadingPlaceholder(),
                ),
                const SizedBox(height: 30),

                glassHeader("Pull Ups", Colors.green),
                glassCard(
                  child: isLoaded ? const pullUps() : _loadingPlaceholder(),
                ),
                const SizedBox(height: 30),

                glassHeader("Shoulder", Colors.orange),
                glassCard(
                  child: isLoaded ? const Shoulder() : _loadingPlaceholder(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loadingPlaceholder() {
    return const SizedBox(
      height: 200,
      child: Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }
}
