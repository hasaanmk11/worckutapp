import 'package:hive_flutter/hive_flutter.dart';

part 'setgoal.g.dart';

@HiveType(typeId: 5)
class Setgoal {
  Setgoal({required this.day});
  @HiveField(0)
  int day;
}
