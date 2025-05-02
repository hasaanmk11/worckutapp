import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

String boxName = "WorckoutDb";

final ValueNotifier<List<Advancemodel>> getDataByLisnerFromadvanced =
    ValueNotifier([]);

class Advancemodel {
  static Future<void> addAdvanced(Advancemodel data) async {
    final box = await Hive.openBox<Advancemodel>(boxName);
    await box.add(data);
    getDataFromAdvaced();
  }

  static Future<void> getDataFromAdvaced() async {
    final box = await Hive.openBox<Advancemodel>(boxName);
    getDataByLisnerFromadvanced.value = box.values.toList();
  }
}
