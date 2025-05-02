import 'package:hive_flutter/adapters.dart';
part 'activity_model.g.dart';

@HiveType(typeId: 3)
class ActivityModel {
  @HiveField(0)
  final String activity;
  @HiveField(1)
  final String time;
  @HiveField(2)
  final int id;

  ActivityModel({required this.id, required this.activity, required this.time});
}
