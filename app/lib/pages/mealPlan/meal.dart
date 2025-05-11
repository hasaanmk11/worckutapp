
import 'package:app/pages/mealPlan/activities/activitycard.dart';

import 'package:app/pages/mealPlan/widgets/weighgtgaincard.dart';
import 'package:app/pages/mealPlan/widgets/weightloass.dart';
import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class MealPlan extends StatelessWidget {
  const MealPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 208, 208, 208),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text("Set Meal Plan", style: commentStyle(20, Colors.black)),
                WeightGainCrad(),
                SizedBox(height: 20),
                WeightlossCrad(),
                SizedBox(height: 20),
                activityCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



