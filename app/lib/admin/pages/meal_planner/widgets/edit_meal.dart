
import 'package:app/user/pages/meal_plan/widgets/edit_page.dart';
import 'package:flutter/material.dart';

class adminMealEditButton extends StatelessWidget {
  final catgryName;
  final name;
  final time;
  final protein;
  final calories;
  final fat;

  const adminMealEditButton({super.key, required this.catgryName,required this.name,required this.time,required this.protein,required this.calories,required this.fat});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit, color: Colors.blue),
      onPressed: () {
        editPage(context, catgryName, name, time, protein, calories, fat);
      },
    );
  }
}




