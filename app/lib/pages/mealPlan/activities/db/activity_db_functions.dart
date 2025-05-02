import 'package:app/pages/mealPlan/activities/activityModel/activity_model.dart';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

String boxName = "Activity_db";

final ValueNotifier<List<ActivityModel>> getActivityDataByListeners =
    ValueNotifier([]);

Future<void> addDataActivity(ActivityModel data) async {
  final box = await Hive.openBox<ActivityModel>(boxName);
  await box.add(data);
  getActivityData();
}

Future<void> getActivityData() async {
  final box = await Hive.openBox<ActivityModel>(boxName);

  getActivityDataByListeners.value = box.values.toList();
}

deleteActivity(int id) async {
  final box = await Hive.openBox<ActivityModel>(boxName);
  await box.delete(id);
  getActivityData();
}

Future<void> editeActivity(int id, data) async {
  final box = await Hive.openBox<ActivityModel>(boxName);

  box.put(id, data);
  await getActivityData();
}
