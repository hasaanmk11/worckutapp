// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heigth_weigth.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HeigthWeigthAdapter extends TypeAdapter<HeigthWeigth> {
  @override
  final int typeId = 6;

  @override
  HeigthWeigth read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HeigthWeigth(
      imageBytes: fields[3] as Uint8List?,
      imagePath: fields[2] as String,
      heigth: fields[0] as dynamic,
      weigth: fields[1] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, HeigthWeigth obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.heigth)
      ..writeByte(1)
      ..write(obj.weigth)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.imageBytes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HeigthWeigthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
