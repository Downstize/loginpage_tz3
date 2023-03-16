import 'package:isar/isar.dart';

part 'schedule_collection.g.dart';

@Collection()
class ScheduleEntity {
  Id scheduleId = Isar.autoIncrement;

  late int numWeek;
  late String name;
  late String type;
  late String teacher;
  late int auditory;
}