import 'package:app/pages/categories/bignner/model/bignnermodel.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

String boxName = "WorckoutDb";

final ValueNotifier<List<Bignnermodel>> getDataByLisner = ValueNotifier([]);

class BignnerDb {
  static Future<void> addBignner(Bignnermodel data) async {
    final box = await Hive.openBox<Bignnermodel>(boxName);
    await box.add(data);
  }

  static Future<void> getData() async {
    final box = await Hive.openBox<Bignnermodel>(boxName);
    getDataByLisner.value = box.values.toList();
  }
}

getDataWithId(int id) async {
  final box = await Hive.openBox<Bignnermodel>(boxName);

  List<Bignnermodel> filltered =
      box.values.where((categoryID) => categoryID.categoryId == id).toList();

  getDataByLisner.value = filltered;
}

deleteCrad(int id, int categoryId) async {
  final box = await Hive.openBox<Bignnermodel>(boxName);

  final cardToDelete = box.values.firstWhere(
    (element) => element.categoryId == categoryId && element.id == id,
  );

  if (cardToDelete != null) {
    int index = box.values.toList().indexOf(cardToDelete);

    await box.deleteAt(index);
    await getDataWithId(categoryId);
  }
}

Future<void> updateItem(Bignnermodel updatedItem) async {
  final db = await Hive.openBox<Bignnermodel>(boxName);

  final key = db.keys.cast<int?>().firstWhere(
    (k) => db.get(k)?.id == updatedItem.id,
  );

  await db.put(key, updatedItem);
  await getDataWithId(updatedItem.categoryId);
}
