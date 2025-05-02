import 'package:app/pages/categories/bignner/model/bignnermodel.dart';
import 'package:app/pages/mealPlan/activities/activityModel/activity_model.dart';
import 'package:app/pages/mealPlan/model/MealModel.dart';

import 'package:hive_flutter/adapters.dart';

Future<void> init() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(BignnermodelAdapter().typeId)) {
    Hive.registerAdapter(BignnermodelAdapter());
  }

  if (!Hive.isAdapterRegistered(MealmodelAdapter().typeId)) {
    Hive.registerAdapter(MealmodelAdapter());
  }

  if (!Hive.isAdapterRegistered(ActivityModelAdapter().typeId)) {
    Hive.registerAdapter(ActivityModelAdapter());
  }
}
