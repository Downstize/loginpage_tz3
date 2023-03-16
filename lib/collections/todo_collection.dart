import 'package:isar/isar.dart';

part 'todo_collection.g.dart';

@collection
class ToDoEntity {

  Id toDoId = Isar.autoIncrement;

  late String name;
  late String description;
  late String type;
  @Index()
  late DateTime issue;
  @Index()
  late DateTime expiry;
}