// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User()
      ..name = fields[0] as String
      ..kafedra = fields[1] as String
      ..institut = fields[2] as String
      ..group = fields[3] as String
      ..email = fields[4] as String
      ..tabNumber = fields[5] as String
      ..pass = fields[6] as String;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.kafedra)
      ..writeByte(2)
      ..write(obj.institut)
      ..writeByte(3)
      ..write(obj.group)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.tabNumber)
      ..writeByte(6)
      ..write(obj.pass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
