import 'package:hive_flutter/hive_flutter.dart';
import '../model/transformtion.dart';
import 'package:flutter/foundation.dart';

final dbName = 'Image_db';

ValueNotifier<List<Transformtion>> transformationImag = ValueNotifier([]);

Future<void> addTransformationImage(Transformtion image) async {
  final data = await Hive.openBox<Transformtion>(dbName);
  await data.add(image);
  transformationImag.value = data.values.toList();
  transformationImag.notifyListeners();
  getImage();
}

Future<void> getImage() async {
  final data = await Hive.openBox<Transformtion>(dbName);
  transformationImag.value = data.values.toList();
}
