import 'package:app/pages/mealPlan/db/db_Functions.dart';
import 'package:app/pages/mealPlan/widgets/editPage.dart';
import 'package:flutter/material.dart';

class EditAndImageAndDeleteParts extends StatelessWidget {
  final String catgryName;
  final String name;
  final String time;
  final String protein;
  final String calories;
  final String fat;
  final int cardId;

  const EditAndImageAndDeleteParts({
    super.key,
    required this.catgryName,
    required this.name,
    required this.time,
    required this.protein,
    required this.calories,
    required this.fat,
    required this.cardId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple),
          ),
          onPressed: () {
            editPage(context, catgryName, name, time, protein, calories, fat);
          },
          child: const Text("Edit", style: TextStyle(color: Colors.white)),
        ),

        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          onPressed: () {
            deleteMmeal(catgryName, cardId);
          },
          child: Text("Delete", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
