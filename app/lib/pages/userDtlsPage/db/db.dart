import 'package:app/pages/userDtlsPage/model/heigth_weigth.dart';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: non_constant_identifier_names
final db_box = "HeigthAndWeigth_db";

ValueNotifier<List<HeigthWeigth>> heigthAndWeigthListener = ValueNotifier([]);
Future<void> addHeigthAndWeigth(data) async {
  final db = await Hive.openBox<HeigthWeigth>(db_box);

  await db.add(data);
  print(db.values.first.heigth);
  await getDataFromHeigthAndWeigth();
}

Future<void> getDataFromHeigthAndWeigth() async {
  final db = await Hive.openBox<HeigthWeigth>(db_box);
  final allValues = db.values.toList();
  heigthAndWeigthListener.value = allValues;
  heigthAndWeigthListener.notifyListeners();
}
