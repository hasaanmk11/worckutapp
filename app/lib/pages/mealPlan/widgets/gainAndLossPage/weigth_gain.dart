import 'package:app/pages/categories/bignner/db/DbFunction.dart';
import 'package:app/pages/mealPlan/widgets/gainAndLossPage/gain_crad.dart';
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
                      return buildMealCard(value[index],context);
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

}