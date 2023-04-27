import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loginpage_tz3/main.dart';
import 'package:loginpage_tz3/themes/text_themes.dart';

import '../addTasks/addTasks.dart';

class TodayTasks extends StatefulWidget {
  const TodayTasks({super.key});

  @override
  State<TodayTasks> createState() => _TodayTasksState();
}

class _TodayTasksState extends State<TodayTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarSettings(context),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_addTaskBar(context)],
      ),
    );
  }
}

_appBarSettings(BuildContext context) {
  return AppBar(
    foregroundColor: containersColorOnTaskPage,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Text(
          "Задачи",
          style: TextStyle(fontSize: 20),
        )),
    titleSpacing: 0,
  );
}

_addTaskBar(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd('ru_RU').format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                "Сегодня",
                style: headingStyle,
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddTasksPage()));
          },
          child: Container(
            width: 120,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: containersColorOnTaskPage),
            child: const Center(
                child: Text(
              "+ Добавить задачу",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            )),
          ),
        )
      ],
    ),
  );
}
