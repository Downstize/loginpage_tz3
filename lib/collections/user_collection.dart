import 'dart:typed_data';
import 'package:isar/isar.dart';

part 'user_collection.g.dart';

@collection
class UserEntity {
  
  Id userId = Isar.autoIncrement;

  late String name;
  //late List<byte>? imageBytes;
  late String kafedra;
  late String institut;
  late String group;
  late String email;
  //@Index(unique: true)
  late String tabNumber;
  late String pass;

  //UserEntity({required this.imageBytes});
}