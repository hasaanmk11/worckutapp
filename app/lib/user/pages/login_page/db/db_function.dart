

import 'package:app/user/pages/login_page/const/consts.dart';
import 'package:app/user/pages/login_page/model/login_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String boxName = "user_db";
Future<void> addUser(UserModel model) async {
  final box = await Hive.openBox<UserModel>(boxName);
  await box.put(userId, model);
}

Future<bool> checkUser() async {
  final box = await Hive.openBox<UserModel>(boxName);
  userDtlsListener.value = box.values.toList();
  return box.containsKey(userId);
}

Future<void> deleteUser() async {
  final box = await Hive.openBox<UserModel>(boxName);
  await box.delete(userId);
}
