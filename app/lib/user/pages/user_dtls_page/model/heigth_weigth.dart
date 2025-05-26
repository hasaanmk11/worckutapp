import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
part 'heigth_weigth.g.dart';

@HiveType(typeId: 6)
class HeigthWeigth {
  @HiveField(0)
  final heigth;
  @HiveField(1)
  final weigth;
  @HiveField(2)
  final String imagePath;
  @HiveField(3)
   final Uint8List? imageBytes;
  HeigthWeigth({
    required this.imageBytes,
    required this.imagePath,
    required this.heigth,
    required this.weigth,
  });
}
