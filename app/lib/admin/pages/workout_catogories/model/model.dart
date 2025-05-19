import 'package:hive_flutter/adapters.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class Bignnermodel {
  @HiveField(0)
  String image;
  @HiveField(1)
  String time;
  @HiveField(2)
  String set;
  @HiveField(3)
  String rep;
  @HiveField(4)
  String workoutName;
  @HiveField(5)
  int categoryId;
  @HiveField(6)
  int id;
  @HiveField(7)
  String url;

  Bignnermodel({
    required this.image,
    required this.rep,
    required this.set,
    required this.time,
    required this.workoutName,
    required this.categoryId,
    required this.id,
    required this.url,
  });
}
