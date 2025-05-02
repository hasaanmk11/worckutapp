import 'package:app/pages/loginPage/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String boxName = "user_db";
Future<void> addUser(UserModel model) async {
  final box = await Hive.openBox<UserModel>('user_db');

  final existingUserKey = box.keys.firstWhere(
    (key) => box.get(key)?.id == model.id,
    orElse: () => null,
  );

  if (existingUserKey != null) {
    await box.put(existingUserKey, model);
  } else {
    await box.add(model);
  }
}

Future<bool> checkUser() async {
  final box = await Hive.openBox<UserModel>('user_db');

  final userExists = box.values.any((element) => element.id == 'userData');

  return userExists;
 

  
}
