// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advanceModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdvancemodelAdapter extends TypeAdapter<Advancemodel> {
  @override
  final int typeId = 1;

  @override
  Advancemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Advancemodel(
      image: fields[0] as String,
      rep: fields[3] as String,
      set: fields[2] as String,
      time: fields[1] as String,
      workoutName: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Advancemodel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.set)
      ..writeByte(3)
      ..write(obj.rep)
      ..writeByte(4)
      ..write(obj.workoutName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdvancemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
