// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduleAdapter extends TypeAdapter<Schedule> {
  @override
  final int typeId = 1;

  @override
  Schedule read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Schedule()
      ..numWeek = fields[0] as int
      ..lname = fields[1] as String
      ..stype = fields[2] as String
      ..teacher = fields[3] as String
      ..auditory = fields[4] as String
      ..dayNumber = fields[5] as String
      ..start = fields[6] as String
      ..end = fields[7] as String;
  }

  @override
  void write(BinaryWriter writer, Schedule obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.numWeek)
      ..writeByte(1)
      ..write(obj.lname)
      ..writeByte(2)
      ..write(obj.stype)
      ..writeByte(3)
      ..write(obj.teacher)
      ..writeByte(4)
      ..write(obj.auditory)
      ..writeByte(5)
      ..write(obj.dayNumber)
      ..writeByte(6)
      ..write(obj.start)
      ..writeByte(7)
      ..write(obj.end);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
