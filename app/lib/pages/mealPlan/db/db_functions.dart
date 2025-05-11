
import 'package:app/pages/mealPlan/model/MealModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

final ValueNotifier<List<Mealmodel>> weightGainMeals = ValueNotifier([]);
final ValueNotifier<List<Mealmodel>> weightLossMeals = ValueNotifier([]);

String boxName = "MealPlann_card";

class MealPlanDbFunctions {
  static Future<void> addMealToWeightGainAndLoos(Mealmodel meal) async {
    final box = await Hive.openBox<Mealmodel>(boxName);
    await box.add(meal);
  }
}

Future<void> getMealWithId(String id) async {
  final box = await Hive.openBox<Mealmodel>(boxName);

  List<Mealmodel> gainMeals =
      box.values.where((meal) => meal.categoryId == "weightGain").toList();

  List<Mealmodel> lossMeals =
      box.values.where((meal) => meal.categoryId == "weightloss").toList();

  weightGainMeals.value = gainMeals;
  weightLossMeals.value = lossMeals;

  weightGainMeals.notifyListeners();
  weightLossMeals.notifyListeners();
}

editeMeal(Mealmodel data) async {
  final box = await Hive.openBox<Mealmodel>(boxName);

  final key = box.keys.cast<int?>().firstWhere(
    (k) => box.get(k)?.categoryId == data.categoryId,
  );
  await box.put(key, data);
}

Future<void> deleteMmeal(String categoryId, int cardId) async {
  final box = await Hive.openBox<Mealmodel>(boxName);

  final key = box.keys.cast<int?>().firstWhere((k) {
    final meal = box.get(k);
    return meal?.categoryId == categoryId && meal?.id == cardId;
  }, orElse: () => null);

  if (key != null) {
    await box.delete(key);
    await getMealWithId(categoryId);
  }
}
