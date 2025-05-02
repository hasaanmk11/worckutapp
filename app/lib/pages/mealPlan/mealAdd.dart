import 'package:app/pages/mealPlan/db/db_functions.dart';
import 'package:app/pages/mealPlan/widgets/FlotingActionBtn.dart';
import 'package:app/pages/mealPlan/widgets/actions.dart';
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
                              Text("Food Name: ${value[index].name}"),
                              SizedBox(height: 6),
                              Text("Protein: ${value[index].protein}g"),
                              SizedBox(height: 6),
                              Text("Calories: ${value[index].calories} kcal"),
                              SizedBox(height: 6),
                              Text("Fat: ${value[index].fat}g"),
                              SizedBox(height: 6),
                              Text("Time: ${value[index].time}"),
                              SizedBox(height: 16),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: EditAndImageAndDeleteParts(
                                  catgryName: value[index].categoryId,
                                  name: value[index].name,
                                  calories: value[index].calories,
                                  fat: value[index].fat,
                                  protein: value[index].protein,
                                  time: value[index].time,
                                  cardId: value[index].id,
                                ),
                              ),
                            ],
                          ),
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
