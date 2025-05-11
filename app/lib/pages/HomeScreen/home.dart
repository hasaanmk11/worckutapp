import 'package:app/pages/HomeScreen/function/reminderbuttoncheck.dart';
import 'package:app/pages/HomeScreen/widgets/appBarIcons.dart';
import 'package:app/pages/HomeScreen/widgets/bootomnavigation.dart';
import 'package:app/pages/HomeScreen/widgets/worckutCard.dart';
import 'package:app/pages/calculator/cal.dart';

import 'package:app/pages/categories/categories.dart';
import 'package:app/pages/mealPlan/meal.dart';
import 'package:app/pages/setGoals/setgoals.dart';

import 'package:app/pages/transformation/functions/weekendnotifi.dart';
import 'package:app/pages/transformation/transformation_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  void initState() {
    super.initState();
    initReminderCheck();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.all(8.0), child: AppBarIcons()),

              const SizedBox(height: 30),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Train Hard, Strength Meets Discipline",
                      style: GoogleFonts.zenOldMincho(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      "Level Up",
                      style: GoogleFonts.acme(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              InkWell(
                onTap:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Categories()),
                    ),
                child: buildWorkoutCard(
                  context,
                  "assets/Home1.jpeg",
                  "Start your Workout",
                ),
              ),
              InkWell(
                onTap:
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => MealPlan())),
                child: buildWorkoutCard(
                  context,
                  "assets/home2.webp",
                  "Meal plan",
                ),
              ),
              InkWell(
                onTap:
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Setgoals())),
                child: buildWorkoutCard(
                  context,
                  "assets/home3.jpg",
                  "Set Goals",
                ),
              ),
              InkWell(
                onTap:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Calculator()),
                    ),
                child: buildWorkoutCard(
                  context,
                  "assets/home4.jpeg",
                  "Calculator",
                ),
              ),

              InkWell(
                onTap:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WeeklyPhotoScreen(),
                      ),
                    ),
                child: buildWorkoutCard(
                  context,
                  "assets/home5.jpg",
                  "Transformation",
                ),
              ),
            ],
          ),
        ),

        bottomNavigationBar: BootomNavigation(),
      ),
    );
  }
}
