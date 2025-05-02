import 'package:hive_flutter/adapters.dart';
part 'advanceModel.g.dart';

@HiveType(typeId: 1)
class Advancemodel {
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

  Advancemodel({
    required this.image,
    required this.rep,
    required this.set,
    required this.time,
    required this.workoutName,
  });
}
