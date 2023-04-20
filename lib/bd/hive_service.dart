import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loginpage_tz3/hive_collections/schedule_model.dart';
import 'package:loginpage_tz3/hive_collections/user_model.dart';
import 'package:loginpage_tz3/hive_collections/todo_model.dart';

class HiveService {

  void hiveConfig() async {
    Hive.registerAdapter(ScheduleAdapter());
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(ToDoAdapter());
    await Hive.openBox<Schedule>('schedule');
    await Hive.openBox<User>('user');
    await Hive.openBox<ToDo>('todo');
  }

  Future<int> findUsers(String tabNum) async {
    final box = await Hive.box<User>('user');
    final token = box.values.where((user) => user.tabNumber == tabNum);
    return token.isEmpty ? 1 : 0;
  }

  Future<int> findUserPass(String value_tab2, String password) async {
    final box = await Hive.box<User>('user');
    final token = box.values.where((user) => user.tabNumber == value_tab2);
    final parol = token.where((user) => user.pass == password);
    return parol.isEmpty ? 1 : 0;
  }

  Future<void> addUser(
      String value_tab, String email, String rePassword) async {
    final box = await Hive.box<User>('user');
    final newUser = User()
      ..name = "Java GOD"
      ..kafedra = "Вычислительные системы и сеты"
      ..institut = "ИУЦТ"
      ..group = "УВП-211"
      ..email = email
      ..pass = rePassword
      ..tabNumber = value_tab;
    await box.add(newUser);
  }

  Future<void> addSchedule2(
    String auditory,
    String dayNumber,
    String end,
    String name,
    int numWeek,
    String start,
    String teacher,
    String type,
  ) async {
    final box = await Hive.box<Schedule>('schedule');
    final newSchedule = Schedule()
      ..auditory = auditory
      ..dayNumber = dayNumber
      ..end = end
      ..lname = name
      ..numWeek = numWeek
      ..start = start
      ..teacher = teacher
      ..type = type;
    await box.add(newSchedule);
  }

  Future<void> addUserPass(String pass) async {
    final box = await Hive.box<User>('user');
    final user = User()..pass = pass;
    await box.add(user);
  }

  Future<List<List<String>>> loadSchedule(
      String dayNumber, int numbWeek) async {
    final box = await Hive.box<Schedule>('schedule');
    final List<Schedule> schedules = box.values
        .where((schedule) =>
            schedule.dayNumber == dayNumber && schedule.numWeek == numbWeek)
        .toList();

    final List<List<String>> output = [];
    for (int i = 0; i < schedules.length; i++) {
      final List<String> innerList =
          List.filled(6, ''); // Initialize inner lists with default value
      innerList[0] = schedules[i].auditory;
      innerList[1] = schedules[i].lname;
      innerList[2] = schedules[i].teacher;
      innerList[3] = schedules[i].type;
      innerList[4] = schedules[i].start;
      innerList[5] = schedules[i].end;
      output.add(innerList);
    }
    return output;
  }

}