import 'package:hive_flutter/adapters.dart';
part 'transformtion.g.dart';

@HiveType(typeId: 7)
class Transformtion {
  @HiveField(0)
  final image;
  Transformtion({required this.image});
}
