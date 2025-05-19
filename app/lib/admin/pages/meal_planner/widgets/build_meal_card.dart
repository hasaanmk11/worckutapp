import 'dart:ui';

import 'package:app/admin/pages/meal_planner/widgets/delete_meal_button.dart';
import 'package:app/admin/pages/meal_planner/widgets/edit_meal.dart';

import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/meal_plan/widgets/gain_and_loss_page/build_crad.dart';
import 'package:app/user/pages/meal_plan/widgets/gain_and_loss_page/gain_crad.dart';
import 'package:app/user/pages/meal_plan/widgets/set_meal_tittle_icon.dart';
import 'package:flutter/material.dart';

Widget adminBuildMealCard(meal, BuildContext context) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: commenGradient().withOpacity(0.4),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1.5,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.name,
                    style: commentStyle(
                      15,
                      commenColor(),
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  buildInfoRow("Calories", meal.calories),
                  buildInfoRow("Protein", meal.protein),
                  buildInfoRow("Fat", meal.fat),
                  buildInfoRow("Time", meal.time),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            Column(
              children: [
                adminMealEditButton(
                  catgryName: meal.categoryId,
                  calories: meal.calories,
                  fat: meal.fat,
                  name: meal.name,
                  protein: meal.protein,
                  time: meal.time,
                ),
                adminMealDeleteButton(
                  catagorieId: meal.categoryId,
                  cradId: meal.id,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
