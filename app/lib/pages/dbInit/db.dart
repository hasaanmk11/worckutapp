import 'package:app/pages/categories/bignner/model/bignnermodel.dart';
import 'package:app/pages/loginPage/model/login_model.dart';
import 'package:app/pages/mealPlan/activities/activityModel/activity_model.dart';
import 'package:app/pages/mealPlan/model/MealModel.dart';
import 'package:app/pages/setGoals/model/setgoal.dart';


import 'package:app/pages/transformation/model/transformtion.dart';
import 'package:app/pages/userDtlsPage/model/heigth_weigth.dart';

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
  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    Hive.registerAdapter(UserModelAdapter());
  }
  if (!Hive.isAdapterRegistered(SetgoalAdapter().typeId)) {
    Hive.registerAdapter(SetgoalAdapter());
  }

  if (!Hive.isAdapterRegistered(TransformtionAdapter().typeId)) {
    Hive.registerAdapter(TransformtionAdapter());
  }

  if (!Hive.isAdapterRegistered(HeigthWeigthAdapter().typeId)) {
    Hive.registerAdapter(HeigthWeigthAdapter());
  }
}
