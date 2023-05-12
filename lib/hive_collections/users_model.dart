import 'package:hive/hive.dart';

part 'users_model.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String kafedra;
  @HiveField(2)
  late String institut;
  @HiveField(3)
  late String group;
  @HiveField(4)
  late String email;
  @HiveField(5)
  late String tabNumber;
  @HiveField(6)
  late String pass;
  @HiveField(7, defaultValue: 'teacher')
  late String type;
  // late String type;
}
