// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MealModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealmodelAdapter extends TypeAdapter<Mealmodel> {
  @override
  final int typeId = 2;

  @override
  Mealmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Mealmodel(
      name: fields[0] as String,
      protein: fields[2] as String,
      calories: fields[3] as String,
      fat: fields[4] as String,
      time: fields[5] as String,
      categoryId: fields[6] as String,
      id: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Mealmodel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.protein)
      ..writeByte(3)
      ..write(obj.calories)
      ..writeByte(4)
      ..write(obj.fat)
      ..writeByte(5)
      ..write(obj.time)
      ..writeByte(6)
      ..write(obj.categoryId)
      ..writeByte(7)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
