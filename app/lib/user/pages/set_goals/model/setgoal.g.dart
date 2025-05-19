// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setgoal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SetgoalAdapter extends TypeAdapter<Setgoal> {
  @override
  final int typeId = 5;

  @override
  Setgoal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Setgoal(
      day: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Setgoal obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.day);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SetgoalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
