import 'package:app/pages/categories/bignner/db/DbFunction.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/mealPlan/db/db_functions.dart';
import 'package:app/pages/mealPlan/widgets/FlotingActionBtn.dart';
import 'package:app/pages/mealPlan/widgets/actions.dart';
import 'package:app/styles/cmn.dart';

class WeightGainAdd extends StatefulWidget {
  const WeightGainAdd({super.key});

  @override
  State<WeightGainAdd> createState() => _WeightGainAddState();
}

class _WeightGainAddState extends State<WeightGainAdd> {
  final String catgryName = 'weightGain';

  @override
  void initState() {
    getMealWithId(catgryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FlotingActionBtn(catgryName: catgryName),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Weight Gain", style: commentStyle(20, Colors.black)),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: weightGainMeals,
                builder: (context, value, child) {
                  return ListView.separated(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return buildMealCard(value[index]);
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMealCard(meal) {
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
            Text("Food Name: ${meal.name}"),
            SizedBox(height: 6),
            Text("Protein: ${meal.protein}g"),
            SizedBox(height: 6),
            Text("Calories: ${meal.calories} kcal"),
            SizedBox(height: 6),
            Text("Fat: ${meal.fat}g"),
            SizedBox(height: 6),
            Text("Time: ${meal.time}"),
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
}
