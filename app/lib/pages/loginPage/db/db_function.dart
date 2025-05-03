import 'package:app/pages/loginPage/const/consts.dart';
import 'package:app/pages/loginPage/model/login_model.dart';

import 'package:hive_flutter/hive_flutter.dart';

const String boxName = "user_db";
Future<void> addUser(UserModel model) async {
  final box = await Hive.openBox<UserModel>(boxName);
  await box.put(userId, model);
}

Future<bool> checkUser() async {
  final box = await Hive.openBox<UserModel>(boxName);
  return box.containsKey(userId);
}

Future<void> deleteUser() async {
  final box = await Hive.openBox<UserModel>(boxName);
  await box.delete(userId);
}
