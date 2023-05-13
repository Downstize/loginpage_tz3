import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loginpage_tz3/hive_collections/schedule_model.dart';
import 'package:loginpage_tz3/hive_collections/users_model.dart';
import 'package:loginpage_tz3/hive_collections/todo_model.dart';
import 'package:loginpage_tz3/hive_collections/session_model.dart';

class HiveService {

  void hiveConfig() async {
    Hive.registerAdapter(ScheduleAdapter());
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(ToDoAdapter());
    Hive.registerAdapter(SessionAdapter());
    await Hive.openBox<Schedule>('schedule');
    await Hive.openBox<User>('user');
    await Hive.openBox<ToDo>('todo');
    await Hive.openBox<Session>('session');
  }

  Future<String> getGroup(String tabNum) async {
    final box = await Hive.box<User>('user');
    final List<User> data =
        box.values.where((user) => user.tabNumber == tabNum).toList();
    return data[0].group;
  }

  Future<int> findUsers(String tabNum) async {
    final box = await Hive.box<User>('user');
    final token = box.values.where((user) => user.tabNumber == tabNum);
    return token.isEmpty ? 1 : 0;
  }
//fix unworking check of password
  Future<int> findUserPass(String value_tab2, String password) async {
    final box = await Hive.box<User>('user');
    final token = box.values.where((user) => user.tabNumber == value_tab2);
    final parol = token.where((user) => user.pass == password);
    return parol.isEmpty ? 0 : 1;
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
      ..tabNumber = value_tab
      ..type = 'teacher';
    await box.add(newUser);
  }

  Future<void> addUser2(
      String value_tab, String rePassword) async {
    final box = await Hive.box<User>('user');
    final newUser = User()
      ..name = ""
      ..kafedra = ""
      ..institut = ""
      ..group = ""
      ..email = " "
      ..pass = rePassword
      ..tabNumber = value_tab
      ..type = 'teacher';
    await box.add(newUser);
  }

  Future<String> findUserType(String tabnum) async {
    final box = await Hive.box<User>('user');
    final example = box.values.where((user) => user.tabNumber == tabnum).toList();
    final typer = example.isNotEmpty ? example[0].type : ' ';

    log(typer);
    return typer;
  }

  Future<void> userPlus(
      String value_tab, String email, String rePassword, String utype, String name, String kafedra, String institut, String group) async {
    final box = await Hive.box<User>('user');
    final newUser = User()
      ..name = name
      ..kafedra = kafedra
      ..institut = institut
      ..group = group
      ..email = email
      ..pass = rePassword
      ..tabNumber = value_tab
      ..type = utype;
      log(utype);
      log(newUser.type);
    await box.add(newUser);
  }

  Future<void> clearOneUser(String tabNumber) async {
    final box = await Hive.box<User>('user');
    final ex = box.values.where((user) => user.tabNumber == tabNumber).toList();
    final userToDeleteKey = box.keys.firstWhere(
        (key) => box.get(key)?.tabNumber == tabNumber,
        orElse: () => null);

    if (userToDeleteKey != null) {
      await box.delete(userToDeleteKey);
    }

    
  }

  Future<List<String>> getUserData(String numTab) async {
    final box = await Hive.box<User>('user');
    final ex = box.values.where((user) => user.tabNumber == numTab).toList();
    final stName = ex[0].name;
    final stGroup = ex[0].group;
    final stMail = ex[0].email;
    final result = ["$stName", "$stMail", "$stGroup"];
    print(result);
    return result;
  }

  Future<void> clearTable() async {
    final box = await Hive.box<Schedule>('schedule');
    final box2 = await Hive.box<Session>('session');
    final box3 = await Hive.box<User>('user');
    box.clear();
    box2.clear();
    box3.clear();
  }

  Future<void> clearSessionTable() async {
    final box = await Hive.box<Session>('session');
    box.clear();
  }

  Future<void> clearScheduleTable() async {
    final box = await Hive.box<Schedule>('schedule');
    box.clear();
  }

  Future<void> clearUserTable() async {
    final box = await Hive.box<User>('user');
    box.clear();
  }

  Future<void> addSession(
    String tabelnum,
    // String group,
    String subject,
    String type,
    String steacher,
    String note1,
    String note2,
    String numSession,
  ) async {
    final box = await Hive.box<Session>('session');
    final newSession = Session()
      ..tabelnum = tabelnum
      ..subject = subject
      ..type = type
      ..steacher = steacher
      ..note1 = note1
      ..note2 = note2
      ..numSession = numSession;
    print(newSession);
    await box.add(newSession);
  }

  Future<List<List<String>>> loadSession(
    String numSession,
    String tabelnum,
    // String group,
  ) async {
    final box = await Hive.box<Session>('session');
    final List<Session> sessions = box.values
        .where((session) =>
            session.numSession == numSession && session.tabelnum == tabelnum)
        .toList();

    final List<List<String>> output2 = [];

    for (int i = 0; i < sessions.length; i++) {
      final List<String> innerList2 =
          List.filled(5, ''); // Initialize inner lists with default value
      // innerList2[0] = sessions[i].tabelnum;
      // innerList2[1] = sessions[i].group;
      innerList2[0] = sessions[i].subject;
      innerList2[1] = sessions[i].type;
      innerList2[2] = sessions[i].steacher;
      innerList2[3] = sessions[i].note1;
      innerList2[4] = sessions[i].note2;
      // innerList2[5] = sessions[i].numSession;
      output2.add(innerList2);
    }
    return output2;
  }

  Future<void> addSchedule2(
    String schTabNum,
    String auditory,
    String dayNumber,
    String end,
    String name,
    String numWeek,
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
      ..numWeek = int.parse(numWeek)
      ..start = start
      ..teacher = teacher
      ..stype = type
      ..schTabNum = schTabNum;
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
      innerList[3] = schedules[i].stype;
      innerList[4] = schedules[i].start;
      innerList[5] = schedules[i].end;
      output.add(innerList);
    }
    return output;
  }

  Future<void> freshSchedule(String tabNum, String numW, String dayNum, String startTime, int valueIndex, String newValue) async {
    final box = await Hive.box<Schedule>('schedule');
    final schedule = box.values
        .firstWhere((schedule) =>
            schedule.dayNumber == dayNum && schedule.numWeek == numW && schedule.start == startTime && schedule.schTabNum == tabNum);
    switch (valueIndex) {
      case 0:
        schedule.auditory = newValue;
        break;
      case 1:
        schedule.lname = newValue;
        break;
      case 2:
        schedule.teacher = newValue;
        break;
      case 3:
        schedule.stype = newValue;
        break;
      case 4:
        schedule.start = newValue;
        break;
      case 5:
        schedule.end = newValue;
        break;
      // ...
    }
  }

  Future<void> freshSession(String tabNum, String subject, String type, int valueIndex, String newValue) async {
    final box = await Hive.box<Session>('session');
    final session = box.values.firstWhere((session) =>
        session.subject == subject &&
        session.type == type &&
        session.tabelnum == tabNum);
    switch (valueIndex) {
      case 0:
        session.subject = newValue;
        break;
      case 1:
        session.type = newValue;
        break;
      case 2:
        session.steacher = newValue;
        break;
      case 3:
        session.note1 = newValue;
        break;
      case 4:
        session.note2 = newValue;
        break;
      // ...
    }
  }

}