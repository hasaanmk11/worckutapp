
import 'package:app/admin/pages/workout_catogories/model/model.dart';
import 'package:app/user/pages/login_page/model/login_model.dart';
import 'package:app/admin/pages/meal_planner/activitie/Model/activity_model.dart';
import 'package:app/admin/pages/meal_planner/model/MealModel.dart';
import 'package:app/user/pages/set_goals/model/setgoal.dart';
import 'package:app/user/pages/transformation/model/transformtion.dart';
import 'package:app/user/pages/user_dtls_page/model/heigth_weigth.dart';

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
