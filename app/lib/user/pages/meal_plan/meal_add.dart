import 'dart:ui';

import 'package:app/admin/pages/meal_planner/db/db_function.dart';

import 'package:app/user/pages/meal_plan/widgets/gain_and_loss_page/gain_crad.dart';
import 'package:flutter/material.dart';

import 'package:app/styles/cmn.dart';

class Mealadd extends StatefulWidget {
  const Mealadd({super.key});

  @override
  State<Mealadd> createState() => _MealaddState();
}

final String catgryName = 'weightloss';

class _MealaddState extends State<Mealadd> {
  @override
  void initState() {
    getMealWithId(catgryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(catgryName, style: commentStyle(20, Colors.white)),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable:
                    catgryName.toLowerCase() == 'weightgain'
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
                      final meal = value[index];

                      return buildMealCard(meal, context);
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
