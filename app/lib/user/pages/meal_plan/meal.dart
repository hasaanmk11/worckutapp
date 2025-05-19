import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/meal_plan/activities/activitycard.dart';
import 'package:app/user/pages/meal_plan/widgets/set_meal_text.dart';
import 'package:app/user/pages/meal_plan/widgets/set_meal_tittle_icon.dart';
import 'package:app/user/pages/meal_plan/widgets/weighgt_gain_card.dart';
import 'package:app/user/pages/meal_plan/widgets/weight_loass.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

class MealPlan extends StatelessWidget {
  const MealPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: commenColor().withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          mealIcon(),
                          SizedBox(width: 10),
                          setMealtext(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              const WeightGainCrad(),
              const SizedBox(height: 20),
              const WeightlossCrad(),
              const SizedBox(height: 20),
              const ActivityCard(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

