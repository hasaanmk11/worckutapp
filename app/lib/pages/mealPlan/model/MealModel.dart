import 'package:hive_flutter/adapters.dart';
part 'MealModel.g.dart';

@HiveType(typeId: 2)
class Mealmodel {
  @HiveField(0)
  final String name;
  @HiveField(2)
  final String protein;
  @HiveField(3)
  final String calories;
  @HiveField(4)
  final String fat;
  @HiveField(5)
  final String time;
  @HiveField(6)
  String categoryId;
  @HiveField(7)
  int id;

  Mealmodel({
    required this.name,
    required this.protein,
    required this.calories,
    required this.fat,
    required this.time,
    required this.categoryId,
    required this.id,
  });
}
