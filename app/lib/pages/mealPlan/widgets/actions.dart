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
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Confirm Delete"),
                  content: Text("Are you sure you want to delete this meal?"),
                  actions: [
                    TextButton(
                      child: Text("Cancel"),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    TextButton(
                      child: Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        deleteMmeal(catgryName, cardId);
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Text("Delete", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
