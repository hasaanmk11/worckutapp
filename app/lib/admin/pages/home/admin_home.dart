import 'dart:ui';
import 'package:app/admin/pages/home/widgets/home_cards.dart';
import 'package:app/admin/pages/meal_planner/meal_home.dart';
import 'package:app/admin/pages/workout_catogories/catogorie_home_screen.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Admin Panel"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            buildGlassCard(
              context,
              title: "Add Workout",
              icon: Icons.fitness_center,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LevelsHomeScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            buildGlassCard(
              context,
              title: "Meal Planner",
              icon: Icons.restaurant_menu,
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => MealHome()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
