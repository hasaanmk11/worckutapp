
import 'package:app/styles/cmn.dart';
import 'package:app/admin/pages/meal_planner/model/MealModel.dart';
import 'package:flutter/material.dart';

class buildCrad extends StatelessWidget {
  const buildCrad({super.key, required this.meal});

  final Mealmodel meal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Food Name:"),
            SizedBox(width: 5),
            Text(meal.name, style: commentStyle(20, Colors.white)),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Text("Protein:"),
            SizedBox(width: 5),
            Text(meal.protein, style: commentStyle(20, Colors.white)),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Text("Protein:"),
            SizedBox(width: 5),
            Text(meal.calories, style: commentStyle(20, Colors.white)),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Text("Protein:"),
            SizedBox(width: 5),
            Text(meal.fat, style: commentStyle(20, Colors.white)),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Text("Protein:"),
            SizedBox(width: 5),
            Text(meal.time, style: commentStyle(20, Colors.white)),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
