import 'package:app/pages/mealPlan/model/MealModel.dart';
import 'package:app/pages/mealPlan/widgets/actions.dart';
import 'package:app/styles/cmn.dart';
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
            Text(meal.name, style: commentStyle(20, Colors.black)),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Text("Protein:"),
            SizedBox(width: 5),
            Text(meal.protein, style: commentStyle(20, Colors.black)),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Text("Protein:"),
            SizedBox(width: 5),
            Text(meal.calories, style: commentStyle(20, Colors.black)),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Text("Protein:"),
            SizedBox(width: 5),
            Text(meal.fat, style: commentStyle(20, Colors.black)),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Text("Protein:"),
            SizedBox(width: 5),
            Text(meal.time, style: commentStyle(20, Colors.black)),
          ],
        ),
        SizedBox(height: 16),
        Align(
          alignment: Alignment.bottomRight,
          child: EditAndImageAndDeleteParts(
            catgryName: meal.categoryId,
            name: meal.name,
            calories: meal.calories,
            fat: meal.fat,
            protein: meal.protein,
            time: meal.time,
            cardId: meal.id,
          ),
        ),
      ],
    );
  }
}
