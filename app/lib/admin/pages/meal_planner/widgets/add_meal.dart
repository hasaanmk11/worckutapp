import 'package:app/admin/pages/meal_planner/db/db_function.dart';
import 'package:app/styles/cmn.dart';

import 'package:app/admin/pages/meal_planner/model/MealModel.dart';
import 'package:flutter/material.dart';

void addMEal(BuildContext context, catgryName) {
  final TextEditingController FoodController = TextEditingController();
  final TextEditingController ProteinController = TextEditingController();
  final TextEditingController caloreisController = TextEditingController();
  final TextEditingController FatController = TextEditingController();

  String selectedTime = "Morning";

  List<String> time = ["Morning", "AfterNoon", "Evening", "Night"];

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Container(
          padding: EdgeInsets.all(16),
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Add Food", style: commentStyle(20, Colors.black)),
                SizedBox(height: 12),

                TextField(
                  controller: FoodController,
                  decoration: InputDecoration(
                    labelText: 'Food Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 150,
                    height: 60,
                    child: DropdownButtonFormField<String>(
                      value: selectedTime,
                      decoration: InputDecoration(
                        labelText: 'Choose Time',
                        border: OutlineInputBorder(),
                      ),
                      items:
                          time.map((String timeOption) {
                            return DropdownMenuItem<String>(
                              value: timeOption,
                              child: Text(timeOption),
                            );
                          }).toList(),
                      onChanged: (val) {
                        selectedTime = val!;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  keyboardType: TextInputType.number,
                  controller: ProteinController,
                  decoration: InputDecoration(
                    labelText: 'Protein(g)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  keyboardType: TextInputType.number,
                  controller: caloreisController,
                  decoration: InputDecoration(
                    labelText: 'Calories(g)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: FatController,
                  decoration: InputDecoration(
                    labelText: 'Fat(g)',
                    border: OutlineInputBorder(),
                  ),
                ),

                ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () async {
                    final data = Mealmodel(
                      name: FoodController.text,
                      protein: ProteinController.text,
                      calories: caloreisController.text,
                      fat: FatController.text,
                      time: selectedTime,
                      categoryId: catgryName,
                      id: DateTime.now().microsecond,
                    );

                    await MealPlanDbFunctions.addMealToWeightGainAndLoos(data);

                    await getMealWithId(catgryName);

                    Navigator.of(context).pop();

                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
