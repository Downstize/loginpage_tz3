import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 2)
//@JsonSerializable(nullable: false)
class ToDo extends HiveObject {
  @HiveField(0)
  //@JsonKey(name: 'name')
  late String name;
  @HiveField(1)
  late String description;
  @HiveField(2)
  late String type;
  @HiveField(3)
  late DateTime issue;
  @HiveField(4)
  late DateTime expiry;
}
