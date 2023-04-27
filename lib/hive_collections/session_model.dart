import 'package:hive/hive.dart';

part 'session_model.g.dart';

@HiveType(typeId: 4)
class Session extends HiveObject{
  @HiveField(0)
  late String tabelnum;
  @HiveField(1)
  late String subject;
  @HiveField(2)
  late String type;
  @HiveField(3)
  late String steacher;
  @HiveField(4)
  late String note1;
  @HiveField(5)
  late String note2;
  @HiveField(6)
  late String numSession;
}