// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transformtion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransformtionAdapter extends TypeAdapter<Transformtion> {
  @override
  final int typeId = 7;

  @override
  Transformtion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transformtion(
      image: fields[0] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Transformtion obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransformtionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
