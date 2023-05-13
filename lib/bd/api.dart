import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loginpage_tz3/hive_collections/schedule_model.dart';
import 'package:loginpage_tz3/hive_collections/users_model.dart';
import 'package:loginpage_tz3/hive_collections/todo_model.dart';
import 'package:loginpage_tz3/hive_collections/session_model.dart';
import 'package:loginpage_tz3/pages/authorization/auth.dart';

import 'hive_service.dart';

//сделал заглушку из двумерного массива, да он может показаться массивом из массивов, но сейчас это просто заглушка XD
final List<List<String>> stSessions = [
  [
    "0000000",
    "Асинхронное программирование",
    "Экзамен",
    "Лелейникова Е.М.",
    "5",
    "4",
    "2-й семестр"
  ],
  [
    "0000000",
    "Дискретная математика",
    "Зачет",
    "Лелейникова Е.М.",
    "5",
    "Зачет",
    "2-й семестр"
  ],
  [
    "0000000", "Английский Яз.", "Экзамен", "Лелейникова Е.М.",
       "5", "4", "3-й семестр"
  ],
  [
    "0000000", "Китайский Яз.", "Зачет", "Лелейникова Е.М.",
        "5", "Зачет", "3-й семестр"
  ],
  [
    "0000000", "Теория Вероятностей", "Экзамен",
        "Лелейникова Е.М.", "5", "4", "4-й семестр"
  ]
];

final List<List<String>> stSchedule = [
  [
    "0000000",
    "1234",
    "пн",
    "12:50",
    'Математика',
    "1",
    "9:30",
    "Васиьлькова Т.А.",
    "Лекция"
  ],
  [
    "0000000",
    "1234", "вт", "12:50", 'Рус. Яз.', "1", "9:30", "Васиьлькова Т.А.", "Лекция"
  ],
  [
    "0000000",
    "1234",
    "ср",
    "12:50",
    'Базы данных',
    "1",
    "9:30",
    "Васиьлькова Т.А.",
    "Лекция"
  ],
  [
    "0000000",
    "1234",
    "чт",
    "12:50",
    'Веб-приложения',
    "1",
    "9:30",
    "Васиьлькова Т.А.",
    "Лекция"
  ],
  [
    "0000000",
    "1234",
    "пт",
    "12:50",
    'Теория Графов',
    "1",
    "9:30",
    "Васиьлькова Т.А.",
    "Лекция"
  ],
  [
    "0000000",
    "1234",
    "сб",
    "12:50",
    'Японский язык',
    "1",
    "9:30",
    "Васиьлькова Т.А.",
    "Лекция"
  ],
  [
    "0000000",
    "1234",
    "вс",
    "12:50",
    'Правоведение',
    "1",
    "9:30",
    "Васиьлькова Т.А.",
    "Лекция"
  ],
  [
    "0000000",
    "1234", "пн", "12:50", 'ОБЖ', "2", "9:30", "Васиьлькова Т.А.", "Лекция"
  ],
  [
    "0000000",
    "1234", "вт", "12:50", 'ОКТ', "2", "9:30", "Васиьлькова Т.А.", "Лекция"
  ],
  [
    "0000000",
    "1234", "ср", "12:50", 'Математика', "2", "9:30", "Васиьлькова Т.А.", "Лекция"
  ],
  [
    "0000000",
    "1234", "чт", "12:50", 'ОБЖ', "2", "9:30", "Васиьлькова Т.А.", "Лекция"
  ],
  [
    "0000000",
    "1234", "пт", "12:50", 'ОКЖД', "2", "9:30", "Васиьлькова Т.А.", "Лекция"
  ],
  [
    "0000000" , "1234", "сб", "12:50", 'UML', "2", "9:30", "Васиьлькова Т.А.", "Лекция"
  ],
  [
    "0000000" , "1234", "вс", "12:50", 'ОБЖ', "2", "9:30", "Васиьлькова Т.А.", "Лекция" ],
];

final List<List<String>> newData = [];

class UseApi {
  Future<void> parseInHive(String tabel) async {
    final h = HiveService();
    await h.userPlus("0000000", "user_admin@ya.ru", "0000000", "student",
        "Admin_name", "ЦТУТП", "ИУЦТ", "УВП-211");
    print("reg");

    int i = 0;
    while (i < stSessions.length) {
      await h.addSession(
      stSessions[i][0], 
      stSessions[i][1], 
      stSessions[i][2], 
      stSessions[i][3], 
      stSessions[i][4], 
      stSessions[i][5], 
      stSessions[i][6]);
      i++;
    }
    
    int j = 0;
    while(j < stSchedule.length) {
      print(stSchedule[j][4]);
      await h.addSchedule2(
      stSchedule[j][0], 
      stSchedule[j][1],
      stSchedule[j][2],
      stSchedule[j][3],
      stSchedule[j][4],
      stSchedule[j][5],
      stSchedule[j][6],
      stSchedule[j][7],
      stSchedule[j][8]
      );
      j++;
    }
  }
}

Future<List<Map<String, dynamic>>> listNews() async {
  List<Map<String, dynamic>> news = [
    {
      "postTime": "6 апр в 11:00",
      "postText":
          "Команда Российского университета транспорта стала бронзовым призёром логистического турнира.",
      "postImage": "assets/image/logistic_news.jpeg"
    },
    {
      "postTime": '7 апр в 14:30',
      "postText": "Продолжается регистрация на кейс-чемпионат «PRO СТРОЙ»",
      "postImage": "assets/image/case_news.jpeg"
    },
    {
      "postTime": '12 апр в 10:00',
      "postText":
          "Финал Высшей студенческой квиз-лиги «Учись, студент!» прошёл 14 апреля в Новой Государственной Третьяковской галерее.",
      "postImage": "assets/image/learn_student_news.jpeg"
    },
    {
      "postTime": '15 апр в 19:00',
      "postText":
          "Благотворительный фонд «Система» при поддержке Минобрнауки России проводит стипендиальную программу «Система».",
      "postImage": "assets/image/system_news.jpeg"
    },
  ];
  return news;
}

//функция сравнения с API и кэширования обновленных данных
Future<void> resfreshScheduleData(String value_tab2, List<List<String>> newData, List<List<String>>oldData, String numWeek, String dayNum) async {
  final h = HiveService();
  int index = 0;
  String newValue = "";
  String timeStart = "";
  //int m = 0;
    for (int i = 0; i < oldData.length; i++) {
      for (int j = 0; j < oldData[i].length; j++) {
        if (oldData[i][j] != newData[i][j]) {
          // обновляем запись в Hive
          index = j;
          newValue = newData[i][j];
          timeStart = oldData[i][4];
          await h.freshSchedule(value_tab2, numWeek, dayNum, timeStart, index, newValue);
        }
      }
  }
}

Future<void> resfreshSession(String tabel, List<List<String>> newData,
  List<List<String>> oldData,
) async {
  final h = HiveService();
  int index = 0;
  String newValue = "";
  String sessionType = "";
  String sessionSubjectType = "";
  for (int i = 0; i < oldData.length; i++) {
    for (int j = 0; j < oldData[i].length; j++) {
      if (oldData[i][j] != newData[i][j]) {
        // обновляем запись в Hive
        index = j;
        newValue = newData[i][j];
        sessionType = oldData[i][1];
        sessionSubjectType = oldData[i][0];
        await h.freshSession(tabel, sessionSubjectType, sessionType, index, newValue);
      }
    }
  }
}

Future<void> resfreshUser() async {

}

//функция удаляет все кэшированные данные (пока что кроме toDO)
Future<void> clearAllData() async {
  final h = HiveService();
  await h.clearTable();
}
//функция удаляет только пользователей
Future<void> clearUsers() async {
  final h = HiveService();
  await h.clearUserTable();
}
//функция удаляет только все расписания
Future<void> clearSschedules() async {
  final h = HiveService();
  await h.clearScheduleTable();
}
//функция удаляет только все результаты сессий
Future<void> clearSessions() async {
  final h = HiveService();
  await h.clearSessionTable();
}

//функция удаляет пользователя по его табельному номеру
Future<void> clearOneUser(String tab) async {
  final h = HiveService();
  await h.clearOneUser(tab);
}

// await h.addSession("0000000", "Дискретная математика", "Зачет",
    //     "Лелейникова Е.М.", "5", "Зачет", "2-й семестр");
    // await h.addSession("0000000", "Английский Яз.", "Экзамен", "Лелейникова Е.М.",
    //     "5", "4", "3-й семестр");
    // await h.addSession("0000000", "Китайский Яз.", "Зачет", "Лелейникова Е.М.",
    //     "5", "Зачет", "3-й семестр");
    // await h.addSession("0000000", "Теория Вероятностей", "Экзамен",
    //     "Лелейникова Е.М.", "5", "4", "4-й семестр");
    // await h.addSession("0000000", "Базы Данных", "Зачет", "Лелейникова Е.М.", "5",
    //     "Зачет", "4-й семестр");
    // await h.addSession("0000000", "Базы Данных", "Экзамен", "Лелейникова Е.М.",
    //     "5", "4", "5-й семестр");
    // await h.addSession("0000000", "Инженерная Графика", "Зачет",
    //     "Лелейникова Е.М.", "5", "Зачет", "5-й семестр");
    // await h.addSession("0000000", "Операционные Системы 1", "Экзамен",
    //     "Лелейникова Е.М.", "5", "4", "6-й семестр");
    // await h.addSession("0000000", "Операционные системы 2", "Экзамен",
    //     "Лелейникова Е.М.", "5", "4", "6-й семестр");
    // await h.addSession("0000000", "Математика", "Экзамен", "Лелейникова Е.М.",
    //     "5", "4", "1-й семестр");
    // await h.addSession("0000000", "Математика", "Экзамен", "Лелейникова Е.М.",
    //     "5", "4", "1-й семестр");
    // await h.addSession("0000000", "Асинхронное программирование", "Экзамен",
    //     "Лелейникова Е.М.", "5", "4", "2-й семестр");
    // await h.addSession("0000000", "Дискретная математика", "Зачет",
    //     "Лелейникова Е.М.", "5", "Зачет", "2-й семестр");

// await h.addSchedule2("1234", "пн", "12:50", 'Англ. Яз.', 1, "9:30",
    //     "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "вт", "12:50", 'Рус. Яз.', 1, "9:30",
    //     "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "вт", "12:50", 'Цифровые Технологии', 1,
    //     "9:30", "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "ср", "12:50", 'Базы данных', 1, "9:30",
    //     "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "ср", "12:50", 'Асинхронное программирование',
    //     1, "9:30", "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "чт", "12:50", 'Веб-приложения', 1, "9:30",
    //     "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "чт", "12:50", 'Мобильные приложения', 1,
    //     "9:30", "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2(
    //     "1234", "пт", "12:50", 'ИИ', 1, "9:30", "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "пт", "12:50", 'Теория Графов', 1, "9:30",
    //     "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "сб", "12:50", 'Дискретная математика', 1,
    //     "9:30", "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "сб", "12:50", 'Японский язык', 1, "9:30",
    //     "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "вс", "12:50", 'Логистика Ж/Д', 1, "9:30",
    //     "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "вс", "12:50", 'Правоведение', 1, "9:30",
    //     "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "пн", "12:50", 'История Транспорта', 2, "9:30",
    //     "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2(
    //     "1234", "пн", "12:50", 'ОБЖ', 2, "9:30", "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2(
    //     "1234", "вт", "12:50", 'ОКТ', 2, "9:30", "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2(
    //     "1234", "вт", "12:50", 'ВУЦ', 2, "9:30", "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "ср", "12:50", 'Математика', 2, "9:30",
    //     "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "ср", "12:50", 'Математика', 2, "9:30",
    //     "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "чт", "12:50", 'Математика', 2, "9:30",
    //     "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "чт", "12:50", 'Математика', 2, "9:30",
    //     "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "пт", "12:50", 'Биомедицинские Технологии', 2,
    //     "9:30", "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "пт", "12:50", 'Физика', 2, "9:30",
    //     "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "сб", "12:50", 'Проектная Деятельность', 2,
    //     "9:30", "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "сб", "12:50", 'Проектная Деятельность', 2,
    //     "9:30", "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "вс", "12:50", 'Математика', 2, "9:30",
    //     "Васиьлькова Т.А.", "Лекция");
    // await h.addSchedule2("1234", "вс", "12:50", 'Математика', 2, "9:30",
    //     "Васиьлькова Т.А.", "Лекция");
    //caching info updated from server
