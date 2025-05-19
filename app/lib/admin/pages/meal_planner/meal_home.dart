import 'dart:ui';

import 'package:app/admin/pages/meal_planner/activitie/activitie.dart';
import 'package:app/admin/pages/meal_planner/db/db_function.dart';
import 'package:app/admin/pages/meal_planner/widgets/build_meal_card.dart';
import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/meal_plan/add_page.dart';

import 'package:app/admin/pages/meal_planner/model/MealModel.dart';
import 'package:app/user/pages/meal_plan/widgets/gain_and_loss_page/gain_crad.dart';
import 'package:app/user/pages/meal_plan/widgets/set_meal_tittle_icon.dart';
import 'package:flutter/material.dart';

class MealHome extends StatelessWidget {
  const MealHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            buildLevelCard(
              context,
              "Weigth gain",
              Icons.line_weight_rounded,
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Mealadd(catgryName: 'weightGain'),
                ),
              ),
            ),
            SizedBox(height: 20),
            buildLevelCard(
              context,
              "Weigth Loss",
              Icons.monitor_weight,
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Mealadd(catgryName: 'weightloss'),
                ),
              ),
            ),
            SizedBox(height: 20),
            buildLevelCard(
              context,
              "Activities",
              Icons.list,
              () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => AdminActivity())),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildLevelCard(
  BuildContext context,
  String title,
  IconData icon,
  VoidCallback onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.15)),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.04),
                blurRadius: 15,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 30),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class Mealadd extends StatefulWidget {
  const Mealadd({super.key, required this.catgryName});

  final String catgryName;
  @override
  State<Mealadd> createState() => _MealaddState();
}

class _MealaddState extends State<Mealadd> {
  @override
  void initState() {
    getMealWithId(widget.catgryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addMEal(context, widget.catgryName);
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.black),
      ),

      backgroundColor: const Color(0xFF0D0D0D),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.catgryName,
                style: commentStyle(20, Colors.white),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable:
                    widget.catgryName.toLowerCase() == 'weightgain'
                        ? weightGainMeals
                        : weightLossMeals,
                builder: (context, value, child) {
                  if (value.isEmpty) {
                    return const Center(
                      child: Text(
                        "No meals added yet",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: value.length,
                    separatorBuilder:
                        (context, index) => const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      Mealmodel meal = value[index];

                      return adminBuildMealCard(meal, context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
