import 'package:flutter/material.dart';
import 'package:loginpage_tz3/collections/schedule_collection.dart';
import 'package:loginpage_tz3/collections/todo_collection.dart';
import 'package:isar/isar.dart';
import 'package:loginpage_tz3/pages/registration/registration.dart';
import 'package:path_provider/path_provider.dart';

import '../collections/user_collection.dart';


class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }
  
 
Future<dynamic> isarConfig() async {
  final dir = await getApplicationSupportDirectory();
  final isar = Isar.open(
      [UserEntitySchema],
      directory: dir.path,
      inspector: true);
}


Future<int> findUsers(String email) async {
  final isar = await db;
  final token = await isar.userEntitys.filter().tabNumberEqualTo(email);
  int res = 0;
  if (token.isEmptySync()) {
    res = 1;
  }else{
    res = 0;
  }
  return res;
}
  // Future<void> saveCourse(Course newCourse) async {
  //   final isar = await db;
  //   isar.writeTxnSync<int>(() => isar.courses.putSync(newCourse));
  // }

  Future<void> saveToDO(ToDoEntity newToDo) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.toDoEntitys.putSync(newToDo));
  }

  Future<void> saveTeacher(ScheduleEntity newSchedule) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.scheduleEntitys.putSync(newSchedule));
  }

  // Future<List<toDoEntitys>> getAllCourses() async {
  //   final isar = await db;
  //   return await isar.courses.where().findAll();
  // }

  // Stream<List<Course>> listenToCourses() async* {
  //   final isar = await db;
  //   yield* isar.courses.where().watch(initialReturn: true);
  // }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  // Future<List<Student>> getStudentsFor(Course course) async {
  //   final isar = await db;
  //   return await isar.students
  //       .filter()
  //       .courses((q) => q.idEqualTo(course.id))
  //       .findAll();
  // }

  // Future<Teacher?> getTeacherFor(Course course) async {
  //   final isar = await db;

  //   final teacher = await isar.teachers
  //       .filter()
  //       .course((q) => q.idEqualTo(course.id))
  //       .findFirst();

  //   return teacher;
  // }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [UserEntitySchema],
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> addUser(String value_tab, String email, String rePassword) async {
  final isar = await db;
  final newUser = UserEntity()
    ..name = "Java GOD"
    ..kafedra = "Вычислительные системы и сеты"
    ..institut = "ИУЦТ"
    ..group = "УВП-211"
    ..email = email
    ..pass = rePassword
    ..tabNumber = value_tab;
    //tabNumber => string
    value_tab = "";
    tabelNumber = "";
  await isar.writeTxn(() async {
    await isar.userEntitys.put(newUser);
  });

  Future<void> addUserPass(String pass) async {
  final isar = await db;
  final newUser = UserEntity()
    ..pass = pass;
    //tabNumber => string
  await isar.writeTxn(() async {
    await isar.userEntitys.put(newUser);
  });
  
  // final existingUser = await isar.userEntitys.get(newUser.userId);
  // await isar.writeTxn(() async {
  //   await isar.userEntitys.delete(existingUser!.userId);
  //   //  await isar.users.delete(existingUser.id!);
  // });
}

  // Future<String> getBill(String name) async {
  //       final isar = await db;
  //       return isar.UserEntity.filter().nameEqualTo(name).findFirst();
  // }
}
}