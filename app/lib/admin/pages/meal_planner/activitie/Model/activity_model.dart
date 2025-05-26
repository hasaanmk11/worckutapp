import 'dart:typed_data';

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
  @HiveField(3)
    final String? imagePath;
    @HiveField(4)
    final Uint8List? imageBytes;

  ActivityModel({
   
    required this.id,
    required this.activity,
    required this.time,
    required this.imageBytes,
    required this.imagePath
  });
}
