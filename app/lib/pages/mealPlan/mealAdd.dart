import 'package:app/pages/mealPlan/db/db_Functions.dart';
import 'package:app/pages/mealPlan/widgets/FlotingActionBtn.dart';
import 'package:app/pages/mealPlan/widgets/gainAndLossPage/loss_card.dart';




import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class Mealadd extends StatefulWidget {
  const Mealadd({super.key});

  @override
  State<Mealadd> createState() => _MealaddState();
}

final String catgryName = 'weightloss';

class _MealaddState extends State<Mealadd> {
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
              child: Text(catgryName, style: commentStyle(20, Colors.black)),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: weightLossMeals,
                builder: (context, value, child) {
                  return ListView.separated(
                    itemCount: value.length,

                    itemBuilder: (context, index) {
                      final meal = value[index];
                      return Container(
                        width: MediaQuery.of(context).size.width - 30,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 197, 197, 197),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: buildCrad(meal: meal),
                        ),
                      );
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
