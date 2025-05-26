import 'dart:typed_data';

import 'package:hive_flutter/adapters.dart';
part 'transformtion.g.dart';

@HiveType(typeId: 7)
class Transformtion {
  @HiveField(0)
  final image;
  @HiveField(1)
   final Uint8List? imageBytes;
  Transformtion({required this.imageBytes, this.image});
}
