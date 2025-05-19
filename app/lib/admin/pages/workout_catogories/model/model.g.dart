// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BignnermodelAdapter extends TypeAdapter<Bignnermodel> {
  @override
  final int typeId = 1;

  @override
  Bignnermodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bignnermodel(
      image: fields[0] as String,
      rep: fields[3] as String,
      set: fields[2] as String,
      time: fields[1] as String,
      workoutName: fields[4] as String,
      categoryId: fields[5] as int,
      id: fields[6] as int,
      url: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Bignnermodel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.set)
      ..writeByte(3)
      ..write(obj.rep)
      ..writeByte(4)
      ..write(obj.workoutName)
      ..writeByte(5)
      ..write(obj.categoryId)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BignnermodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
