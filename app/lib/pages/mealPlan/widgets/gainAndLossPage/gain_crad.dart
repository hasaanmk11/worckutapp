
import 'package:app/pages/mealPlan/widgets/actions.dart';
import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

Widget buildMealCard(meal, context) {
  return Container(
    width: MediaQuery.of(context).size.width - 30,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 197, 197, 197),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
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
      ),
    ),
  );
}
