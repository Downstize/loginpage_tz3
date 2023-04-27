// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionAdapter extends TypeAdapter<Session> {
  @override
  final int typeId = 4;

  @override
  Session read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Session()
      ..tabelnum = fields[0] as String
      ..subject = fields[1] as String
      ..type = fields[2] as String
      ..steacher = fields[3] as String
      ..note1 = fields[4] as String
      ..note2 = fields[5] as String
      ..numSession = fields[6] as String;
  }

  @override
  void write(BinaryWriter writer, Session obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.tabelnum)
      ..writeByte(1)
      ..write(obj.subject)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.steacher)
      ..writeByte(4)
      ..write(obj.note1)
      ..writeByte(5)
      ..write(obj.note2)
      ..writeByte(6)
      ..write(obj.numSession);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
