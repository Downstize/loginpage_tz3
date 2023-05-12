import 'package:hive/hive.dart';

part 'schedule_model.g.dart';

@HiveType(typeId: 1)
class Schedule extends HiveObject {
  @HiveField(0)
  late int numWeek;
  @HiveField(1)
  late String lname;
  @HiveField(2)
  late String stype;
  @HiveField(3)
  late String teacher;
  @HiveField(4)
  late String auditory;
  @HiveField(5)
  late String dayNumber;
  @HiveField(6)
  late String start;
  @HiveField(7)
  late String end;
}
