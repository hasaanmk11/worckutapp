

import 'package:app/user/pages/set_goals/model/setgoal.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

final ValueNotifier<List<Setgoal>> setGoalCardListener = ValueNotifier([]);
const String boxName = "setGoal";

Future<void> setGoalCardUpdate(Setgoal day) async {
  final box = await Hive.openBox<Setgoal>(boxName);
  await box.add(day);
  setGoalCardGetData();

}

Future<void> setGoalCardGetData() async {
  final box = await Hive.openBox<Setgoal>(boxName);
  setGoalCardListener.value = box.values.toList();
  setGoalCardListener.notifyListeners();
}
